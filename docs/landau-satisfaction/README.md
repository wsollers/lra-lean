# Landau Satisfaction

Updated: 2026-08-30

This workspace holds the live planning and progress artifacts for the Landau
satisfaction buildout. It is intended to replace ad hoc discussion spread
across top-level markdown files when implementation work starts.

## Purpose

- Keep architectural overview separate from executable implementation steps.
- Record resolved naming and placement decisions before code changes begin.
- Provide resumable phase checklists with explicit file ownership and gates.
- Preserve references to older Landau and foundations documents where useful
  without forcing implementers to reconstruct the plan from prose.

## Live Artifacts

- `DECISIONS.md`: binding architectural decisions for this workstream.
- `status.md`: phase-level progress board.
- `ledger.json`: resumable machine-readable progress ledger.
- `phases/phase-01-generic-operation-laws.md`: executable Phase 1 checklist.
- `phases/phase-02-generic-operations.md`: executable Phase 2 checklist.

## Historical / Supporting Inputs

- Top-level `LANDAU-SATISFACTION-PLAN.md`: current survey and architectural
  overview. Treat this as context, not as the implementation contract.
- `docs/foundations/06-operations.md`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/foundations/06b-model-theory-boundary.md`
- `docs/foundations/16-landau-cert-naming-history.md`
- `docs/number-systems-architecture-audit.md`

## Usage

1. Read `DECISIONS.md`.
2. Read the active phase file.
3. Execute only the unchecked items in order unless a step explicitly permits
   parallel work.
4. Update `status.md` and `ledger.json` after each completed or blocked step.
