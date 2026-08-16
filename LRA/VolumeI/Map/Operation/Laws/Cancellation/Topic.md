# Cancellation Topic

Cancellation records when applying the same operation input on one side can be
removed from an equality.

## Core Questions

- What is left cancellation?
- What is right cancellation?
- What is two-sided cancellation?
- Which hypotheses prove cancellation?
- Which hypotheses do not prove cancellation?

## Intended Definitions

For an operation `op`:

```text
LeftCancellation op :=
  for all a b c, op a b = op a c -> b = c
```

```text
RightCancellation op :=
  for all a b c, op b a = op c a -> b = c
```

```text
TwoSidedCancellation op :=
  LeftCancellation op and RightCancellation op
```

## Dependency Position

Cancellation is not primitive in the first pass. It should come after:

1. identity;
2. associativity;
3. inverse laws.

Then we can prove cancellation from suitable inverse hypotheses.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

