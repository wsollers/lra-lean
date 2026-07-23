# Step 7: Set Diagrams And Governance

## Goal

Create lightweight documentation that keeps the set foundation understandable
and source-grounded.

## Planned Docs

```text
docs/foundations/set-architecture.md
docs/foundations/set-proof-roadmap.md
docs/foundations/set-book-tweaks.md
```

## Useful Diagrams

- book language to Lean representation;
- dependency graph for the first set definitions;
- proof ladder from extensionality through De Morgan laws.

## Governance Rules

- Every Lean declaration should map to a Volume I source label or to an
  explicitly documented Lean-support need.
- If Lean requires a distinction the book does not make, record it in
  `set-book-tweaks.md`.
- Do not introduce relations/functions/orders/numbers until the set phase has
  an accepted architecture.
- Do not add compatibility aliases during the restart.

## Git Considerations

- Do not track local Google Drive upload scratch directories named
  `.tmp.driveupload`. They are machine-local transfer artifacts, may appear at
  any depth inside a project, and must be covered by the project `.gitignore`.
  If one is ever accidentally tracked, remove it from Git, commit the ignore
  rule, and then recreate the local scratch directory if the local workflow
  still needs it.

## Acceptance Criteria

- Set architecture documentation exists.
- Set proof roadmap exists.
- Book-tweak tracking exists.
- The main restart tracker links to the relevant docs when they are created.
