# Order Compatibility Topic

Order compatibility records how an operation interacts with a relation,
especially a strict or non-strict order.

## Core Questions

- Does operating on the left preserve order?
- Does operating on the right preserve order?
- Does operating coordinatewise preserve order?
- Does positive multiplication preserve strict order?
- Does multiplication by a negative element reverse order?
- Which hypotheses are needed for reflection, not just preservation?

## Intended Definitions

For a relation `rel` and operation `op`, reserve definitions for:

- left translation preserves relation;
- right translation preserves relation;
- coordinatewise operation preserves relation;
- strict preservation under positive right multiplication;
- strict preservation under positive left multiplication;
- non-strict preservation under positive or nonnegative multiplication;
- order reversal under negative multiplication.

## Implementation Caution

Begin with relation-generic definitions. Do not tie the first definitions to
`<=`, `<`, or a concrete number system.

The first layer should speak only about an operation preserving or reversing an
arbitrary relation. After that layer is stable, add specialized
positive-multiplication-like and negative-multiplication-like contracts in this
same family, still as generic predicates.

This keeps the topic from becoming number-system-specific too early.

## Dependency Position

This topic comes after the basic operation laws and after the generic order
relation concepts are stable.

It is the bridge between:

- `LRA.VolumeI.Operations.Laws`;
- `LRA.VolumeI.Order`;
- notation-specific ordered algebraic structures.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`
