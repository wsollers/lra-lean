# p0-16 Implement Task

P0 title: Replace detached ...Realizes...Model with carrier-tied packaging.

Repository: `F:/repos/lra-lean`
Branch policy: work on `main` only.
Precondition: before edits, confirm `git rev-list --left-right --count origin/main...main` is `0 0`.

Inputs:
- `docs/p0-repair/prompts/p0-16-spec.md`
- `docs/p0-repair/prompts/p0-16-verify.md`
- the current ledger entry in `docs/p0-repair/ledger.json`
- validator path: `TBD_BY_SPEC`
- build target: `TBD_BY_SPEC`

Task:
- Implement exactly the verified repair scope.
- Run `python scripts/validate_structure.py --path <validator_path>`.
- Run `lake build <build_target>`.
- If both pass, commit on `main` and push `origin main`.
- If either fails, do not commit; report the exact failure and the next repair step.

Output format:
- files changed
- validator result
- build result
- commit sha if created
- push result
- remaining risk
