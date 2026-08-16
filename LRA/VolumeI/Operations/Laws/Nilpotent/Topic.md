# Nilpotence Topic

Nilpotence records when repeated application of a multiplication-like
operation eventually reaches an absorbing zero element.

## Core Questions

- What does it mean to repeat a binary operation a positive number of times?
- What does it mean for an element to become zero after enough repetitions?
- How is nilpotence different from being zero immediately?
- How is nilpotence different from idempotence?

## Intended Definitions

Reserve definitions for:

- powers or repeated operation by a positive natural number;
- nilpotent element relative to an operation and absorbing element;
- nilpotent index or witness;
- bounded nilpotence, if later needed.

## Example Form

```text
Nilpotent op zero x :=
  exists n > 0, power op x n = zero
```

## Dependency Position

This topic should come after:

1. binary operations;
2. absorbing elements;
3. iteration or power notation;
4. equality compatibility.

It is mostly a specialized algebraic-structure topic, but the generic
definition belongs with operation laws so the concept is not tied to rings
too early.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

