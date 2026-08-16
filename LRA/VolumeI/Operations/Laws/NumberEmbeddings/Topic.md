# Number Embeddings And Mixed Operations Topic

Number embeddings explain how operations between different number systems can
be meaningful without pretending they are binary endo-operations on one
carrier.

## Core Questions

- If `a : SystemA` and `b : SystemB`, what carrier owns `a + b`?
- When does a mixed operation fail to be an endo-operation?
- When may one input be embedded into the other's carrier?
- Why does the result usually live in the larger or target carrier?
- What must Volume II prove before using generic laws after embedding?

## Core Distinction

An endo-operation has the shape:

```text
Carrier -> Carrier -> Carrier
```

A genuinely mixed operation has a wider shape:

```text
SystemA -> SystemB -> ResultSystem
```

If `SystemA` and `SystemB` are different, then addition is not an
endo-operation unless both inputs have first been interpreted in a common
carrier.

## Embedding Pattern

For number systems, the intended certification pattern is:

1. define an embedding `embed : SystemA -> SystemB`;
2. prove the embedding preserves the relevant operations and distinguished
   elements;
3. define mixed notation by embedding into a common carrier, when appropriate;
4. prove the result type is the common or larger carrier;
5. use generic operation laws only after the operation is expressed over one
   certified carrier.

## Example Forms

```text
a : Nat
b : Int
embedNatInt a + b : Int
```

```text
a : Int
b : Rat
embedIntRat a * b : Rat
```

The unembedded expression `a + b` is not a binary endo-operation on either
`Nat` or `Int` unless a coercion or embedding convention has been installed.

## Dependency Position

This topic belongs after:

1. arbitrary operations and endo-operations;
2. closure;
3. equality compatibility;
4. operation preservation by maps.

It bridges Volume I operation laws to Volume II concrete number-system
certification.

## Planned Lean Shape

This directory is scaffold-only until implementation.

Expected Lean files:

- `Definition.lean`
- `Theorems.lean`
- `Relationships.lean`
- `Examples.lean`
- `FailureModes.lean`
- `All.lean`

