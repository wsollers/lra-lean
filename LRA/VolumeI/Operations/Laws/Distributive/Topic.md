# Distributivity Topic

Distributivity describes how one operation interacts with another.

## Core Question

For operations `outer` and `inner`:

```text
LeftDistributive outer inner :=
  outer a (inner b c) = inner (outer a b) (outer a c)
```

```text
RightDistributive outer inner :=
  outer (inner a b) c = inner (outer a c) (outer b c)
```

Two-sided distributivity is both laws together.

## Why It Matters

This is the abstract source of laws such as:

```text
a * (b + c) = a * b + a * c
(a + b) * c = a * c + b * c
```

It is the first topic where two operations must be orchestrated together.

## Dependency Position

Distributivity should be implemented after:

1. binary operations;
2. associativity and commutativity basics;
3. identity and absorbing element roles are clear.

## Lean Owners

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `All.lean`

