#!/usr/bin/env bash
# Explicit Codex validation entrypoint for Codex Game Studios.
# This does not install hooks. It runs checks manually from the terminal.

set -u

MODE="${1:-baseline}"
FAILURES=0

run_check() {
  local label="$1"
  shift
  echo "==> $label"
  if "$@"; then
    echo "PASS: $label"
  else
    echo "FAIL: $label" >&2
    FAILURES=$((FAILURES + 1))
  fi
  echo
}

python_json_tool() {
  local file="$1"
  for cmd in python3 python py; do
    if command -v "$cmd" >/dev/null 2>&1; then
      "$cmd" -m json.tool "$file" >/dev/null
      return $?
    fi
  done
  echo "No Python command found for JSON validation" >&2
  return 1
}

validate_skill_catalog() {
  local count
  count=$(find .agents/skills -maxdepth 2 -name SKILL.md -print 2>/dev/null | wc -l | tr -d ' ')
  if [ "$count" != "72" ]; then
    echo "Expected 72 Codex skills, found $count" >&2
    return 1
  fi

  if rg --files-without-match "short-description:" .agents/skills/*/SKILL.md >/tmp/cgs-missing-short-description.txt 2>/dev/null; then
    echo "Skills missing metadata.short-description:" >&2
    cat /tmp/cgs-missing-short-description.txt >&2
    return 1
  fi

  local mismatch=0
  for file in .agents/skills/*/SKILL.md; do
    local dir name
    dir=$(basename "$(dirname "$file")")
    name=$(sed -n 's/^name: //p' "$file" | head -1)
    if [ "$dir" != "$name" ]; then
      echo "Skill folder/name mismatch: $dir -> $name" >&2
      mismatch=1
    fi
  done

  return "$mismatch"
}

validate_role_catalog() {
  local source_count mapped_count missing
  source_count=$(find .claude/agents -maxdepth 1 -type f -name '*.md' -print 2>/dev/null | wc -l | tr -d ' ')
  mapped_count=$(rg -o '\.claude/agents/[a-z0-9-]+\.md' .agents/roles/*.md 2>/dev/null | sed 's/.*\.claude/.claude/' | sort -u | wc -l | tr -d ' ')

  if [ "$source_count" != "$mapped_count" ]; then
    echo "Expected $source_count role mappings, found $mapped_count" >&2
    missing=$(comm -3 \
      <(find .claude/agents -maxdepth 1 -type f -name '*.md' -printf '.claude/agents/%f\n' | sort) \
      <(rg -o '\.claude/agents/[a-z0-9-]+\.md' .agents/roles/*.md | sed 's/.*\.claude/.claude/' | sort -u))
    [ -n "$missing" ] && echo "$missing" >&2
    return 1
  fi
}

validate_standard_catalog() {
  local source_count mapped_count missing
  source_count=$(find .claude/rules -maxdepth 1 -type f -name '*.md' -print 2>/dev/null | wc -l | tr -d ' ')
  mapped_count=$(rg -o '\.claude/rules/[a-z0-9-]+\.md' docs/STANDARDS.md 2>/dev/null | sort -u | wc -l | tr -d ' ')

  if [ "$source_count" != "$mapped_count" ]; then
    echo "Expected $source_count rule mappings, found $mapped_count" >&2
    missing=$(comm -3 \
      <(find .claude/rules -maxdepth 1 -type f -name '*.md' -printf '.claude/rules/%f\n' | sort) \
      <(rg -o '\.claude/rules/[a-z0-9-]+\.md' docs/STANDARDS.md | sort -u))
    [ -n "$missing" ] && echo "$missing" >&2
    return 1
  fi
}

validate_assets() {
  local failures=0
  if [ -d assets ]; then
    while IFS= read -r file; do
      local base
      base=$(basename "$file")
      if echo "$base" | grep -qE '[A-Z[:space:]-]'; then
        echo "Asset naming warning: $file should be lowercase_with_underscores" >&2
      fi
    done < <(find assets -type f 2>/dev/null)
  fi

  if [ -d assets/data ]; then
    while IFS= read -r file; do
      if ! python_json_tool "$file"; then
        echo "Invalid JSON: $file" >&2
        failures=$((failures + 1))
      fi
    done < <(find assets/data -type f -name '*.json' 2>/dev/null)
  fi

  return "$failures"
}

validate_staged_commit() {
  printf '{"tool_input":{"command":"git commit"}}' | bash .claude/hooks/validate-commit.sh
}

run_baseline() {
  run_check "Hook shell syntax" bash -n .claude/hooks/*.sh
  run_check "Claude settings JSON" python_json_tool .claude/settings.json
  run_check "Codex skill catalog" validate_skill_catalog
  run_check "Codex role catalog" validate_role_catalog
  run_check "Codex standards catalog" validate_standard_catalog
}

case "$MODE" in
  baseline)
    run_baseline
    ;;
  all)
    run_baseline
    run_check "Asset validation" validate_assets
    run_check "Staged commit validation" validate_staged_commit
    ;;
  session)
    run_check "Session context" bash .claude/hooks/session-start.sh
    run_check "Gap detection" bash .claude/hooks/detect-gaps.sh
    ;;
  staged)
    run_check "Staged commit validation" validate_staged_commit
    ;;
  assets)
    run_check "Asset validation" validate_assets
    ;;
  skills)
    run_check "Codex skill catalog" validate_skill_catalog
    ;;
  roles)
    run_check "Codex role catalog" validate_role_catalog
    ;;
  standards)
    run_check "Codex standards catalog" validate_standard_catalog
    ;;
  *)
    echo "Usage: bash tools/codex-validate.sh [baseline|all|session|staged|assets|skills|roles|standards]" >&2
    exit 2
    ;;
esac

if [ "$FAILURES" -gt 0 ]; then
  echo "$FAILURES validation check(s) failed." >&2
  exit 1
fi

echo "All requested validation checks passed."
