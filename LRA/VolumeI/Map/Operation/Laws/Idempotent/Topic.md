# Idempotence Topic

Idempotence says that combining an element with itself gives the same element
back.

## Core Question

For an operation `op`:

```text
Idempotent op := for every a, op a a = a
```

## Why It Matters

Idempotence is common in set-like, lattice-like, and projection-like
operations:

```text
A union A = A
A intersection A = A
max a a = a
min a a = a
```

It is usually not a law of addition or multiplication in ordinary number
systems.

## Boundary

This topic belongs in the generic operation law map, but it is not part of the
first identity/associativity/inverse learning path. It is a sibling branch.

## Lean Owners

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `All.lean`

