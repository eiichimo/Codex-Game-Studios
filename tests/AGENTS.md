# Tests Directory Instructions

Follow these standards for automated and manual test assets.

## Automated Tests

- Use descriptive names: `test_[system]_[scenario]_[expected_result]`.
- Keep arrange, act, and assert phases clear.
- Unit tests must not depend on external state such as filesystem, network, or
  database unless that dependency is explicitly mocked.
- Integration tests must clean up after themselves.
- Performance tests must specify thresholds and fail when thresholds are
  exceeded.
- Keep test data local to the test or in dedicated fixtures; avoid shared
  mutable state.
- Every bug fix should add a regression test or documented manual evidence that
  would catch the original issue.

## Manual Evidence

- Store QA evidence under `production/qa/` unless a specific workflow says
  otherwise.
- Include build/version, date, tester, steps, expected result, actual result,
  and artifacts when relevant.

## Validation

Run the engine-specific test command when configured. For template-level checks:

```bash
bash tools/codex-validate.sh baseline
```
