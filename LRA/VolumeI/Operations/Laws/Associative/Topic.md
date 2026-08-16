# Associativity Topic

Associativity is a separate law from identity. It governs how nested uses of a
binary operation may be reparenthesized.

## Core Question

For an operation `op`, associativity says:

```text
op (op a b) c = op a (op b c)
```

It does not say:

- `op a b = op b a`;
- an identity exists;
- inverses exist;
- cancellation is valid.

## Why It Matters

Associativity becomes powerful when combined with identity and inverse laws.
It permits proofs that move from:

```text
op (op inverse a) b
```

to:

```text
op inverse (op a b)
```

Without associativity, most cancellation and inverse arguments do not go
through.

## Planned Concept Files

This topic starts with the existing Lean concept family:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `All.lean`

Later markdown concept pages may be added for:

- reassociation of three factors;
- reassociation of four factors;
- failure to imply commutativity;
- interaction with identity;
- interaction with inverse laws.

