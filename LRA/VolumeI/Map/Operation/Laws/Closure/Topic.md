# Closure Topic

Closure makes explicit that an operation returns values inside the intended
carrier.

Lean can hide closure in the type:

```text
BinaryEndoOperation Carrier := Carrier -> Carrier -> Carrier
```

That type already says: if both inputs are in `Carrier`, the output is in
`Carrier`. For learning, we still want closure as its own concept, because
mathematically one often starts with an ambient operation and then asks whether
a subset is closed under it.

## Core Questions

- What does it mean for an arbitrary operation to be closed on a carrier?
- What does it mean for a subset to be closed under an operation?
- Why does a binary endo-operation have closure by type?
- What changes when the operation is not endo-typed?
- How does closure precede identity, associativity, and inverse laws?

## Intended Distinctions

### Typed Closure

For:

```text
op : Carrier -> Carrier -> Carrier
```

closure is built in.

### Predicate/Subcarrier Closure

For:

```text
op : Ambient -> Ambient -> Ambient
S : Ambient -> Prop
```

closure of `S` under `op` should mean:

```text
for all a b, S a -> S b -> S (op a b)
```

### Arbitrary Operation Closure

For:

```text
op : Left -> Right -> Codomain
Carrier : Codomain -> Prop
```

closure into `Carrier` should mean the operation's outputs satisfy the carrier
predicate under the relevant input hypotheses.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

## Boundary

Identity, associativity, commutativity, cancellation, absorption,
distributivity, idempotence, order compatibility, and inverse laws should be
stated over closed operations once closure has been handled explicitly.

