# Identity Coincidence

## Informal Meaning

If `l` is a left identity and `r` is a right identity for the same operation,
then `l = r`.

The whole proof idea is:

```text
l = op l r = r
```

The first equality uses that `r` is a right identity. The second equality uses
that `l` is a left identity.

## Learning Point

This result does not use associativity.

That is a crucial conceptual checkpoint: identity coincidence is weaker and
earlier than monoid reasoning.

## Implementation Target

Lean owner: `Identity/Relationships.lean`.

