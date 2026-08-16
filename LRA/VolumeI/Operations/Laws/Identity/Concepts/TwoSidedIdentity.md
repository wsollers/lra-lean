# Two-Sided Identity

## Informal Meaning

An element is a two-sided identity for an operation when it is both a left
identity and a right identity.

For an operation `op` and element `e`, the intended statement is:

```text
LeftIdentity op e and RightIdentity op e
```

## Learning Point

Two-sided identity is not a new mysterious law. It is exactly the conjunction
of the two one-sided laws.

The important projections are:

- from two-sided identity, get left identity;
- from two-sided identity, get right identity.

## Implementation Target

Lean owner: `Identity/Definition.lean`.

Projection and assembly theorems belong in `Identity/Theorems.lean`.

