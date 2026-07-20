# Step 1: Archive Current Lean Tree

## Goal

Preserve the existing Lean development as an explicit prototype archive before
starting the new foundation.

## Planned Action

```text
LRA/      -> LRA-OLD/
```

## Rules

- Do not delete current work.
- Do not edit files inside `LRA-OLD/` as part of the restart.
- Treat `LRA-OLD/` as reference material only.
- After the move, create a new `LRA/` tree from scratch.
- Update build roots only after the new skeleton exists.

## Reason

The current foundation has useful experiments, but it has started absorbing
later relation, order, and number-system needs too early. Archiving it lets the
project restart cleanly without losing prior work.

## Acceptance Criteria

- `LRA-OLD/` exists and contains the previous `LRA/` contents.
- A new minimal `LRA/` directory exists.
- No archived file was modified during the move.
- The main restart tracker links to this step.

## Result

Completed. The previous `LRA/` tree was moved to `LRA-OLD/`, and a new minimal
`LRA/` skeleton was created.
