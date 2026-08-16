# Equational Logic Topic

Equational logic records how equality may be transported through operations.
It is the generic learning home for the algebraic habit of replacing equals by
equals.

## Core Questions

- If `a = b`, may `op a c` be replaced by `op b c`?
- If `a = b`, may `op c a` be replaced by `op c b`?
- If two inputs are replaced by equal inputs, is the output equal?
- How does substitution in an expression differ from a special algebraic law?

## Intended Definitions

For a binary operation `op`, reserve definitions or theorem names for:

- left argument equality compatibility;
- right argument equality compatibility;
- two-argument equality compatibility;
- equality compatibility for unary operations;
- substitution through operation expressions.

In Lean, much of this is powered by equality itself and tools such as
congruence. The learning topic still deserves explicit names because students
use these moves constantly before they understand what justifies them.

## Example Forms

```text
a = b -> op a c = op b c
```

```text
a = b -> op c a = op c b
```

```text
a = b -> c = d -> op a c = op b d
```

For notation-specific operations, these specialize to:

```text
a = b -> a + c = b + c
a = b -> a * c = b * c
```

## Dependency Position

This topic should be introduced after binary operations and before serious
algebraic manipulation. It does not depend on associativity, commutativity,
identity, or inverses.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

