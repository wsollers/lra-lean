# Absorption Laws Topic

An absorption law is a two-operation law. It says that one operation discards
the second input after that input has been combined with the first input by a
second operation:

```text
AbsorptionLaw outer inner := outer a (inner a b) = a
```

Mutual absorption is the lattice-style pair of laws:

```text
join a (meet a b) = a
meet a (join a b) = a
```

This is separate from `Absorbing`, which is an element-level law for one
operation.

## Learning Point

Mutual absorption alone already forces both operations to be idempotent. This
is why some lattice axiom systems can take absorption as primitive and recover
idempotence as a theorem.

## Lean Owners

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`
- `AllWithExamples.lean`
