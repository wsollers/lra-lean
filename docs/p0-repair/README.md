# P0 Repair Coordinator

This directory is the durable resume surface for the repository P0 workflow.

Files:
- `status.md`: human dashboard and current state
- `ledger.json`: machine-readable source of truth
- `prompts/`: per-P0 task prompts for `spec`, `verify`, and `implement` roles

Coordinator rules:
- Work only on `main`.
- Before any implementation task edits, confirm `git rev-list --left-right --count origin/main...main` is `0 0`.
- Success gate per P0: `python scripts/validate_structure.py --path <validator_path>` and `lake build <build_target>` both pass.
- If both gates pass, commit and push to `origin/main`.
- If either gate fails, do not commit; record the failure and the next repair step in `ledger.json` and `status.md`.

Status values:
- `not_started`
- `spec_in_progress`
- `spec_ready_for_verify`
- `verify_failed`
- `verified_ready_to_implement`
- `implement_in_progress`
- `gate_failed`
- `committed_not_pushed`
- `done`
- `blocked`
