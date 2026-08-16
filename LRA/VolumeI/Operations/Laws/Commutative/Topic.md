# Commutativity Topic

Commutativity is the law that an operation does not depend on the order of its
two inputs.

## Core Question

For an operation `op`, commutativity says:

```text
op a b = op b a
```

It does not say:

- the operation is associative;
- an identity exists;
- inverses exist;
- cancellation is valid.

## Why It Matters

Commutativity lets one-sided laws become their mirror images in controlled
settings.

Examples:

- a left identity becomes a right identity if the operation is commutative;
- left distributivity can imply right distributivity when the outer operation
  is commutative;
- left absorbing behavior can become right absorbing behavior under
  commutativity.

## Lean Owners

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `All.lean`

## Boundary

Do not hide asymmetry too early. The learning order should first distinguish
left from right, then show exactly how commutativity collapses that distinction.

