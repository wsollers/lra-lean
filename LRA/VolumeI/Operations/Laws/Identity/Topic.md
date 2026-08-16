# Identity Laws Topic

This concept family owns left identity, right identity, two-sided identity,
identity coincidence, and identity uniqueness for arbitrary binary
endo-operations.

## Core Questions

- What does it mean for an element to act neutrally on the left?
- What does it mean for an element to act neutrally on the right?
- Why are those different conditions?
- What is a two-sided identity?
- Why does a left identity coincide with a right identity?
- Why does identity uniqueness not require associativity?
- How should `0 is neutral for addition` and `1 is a unit for multiplication`
  be expressed without mentioning addition or multiplication yet?

## Concept Files

- `Concepts/LeftIdentity.md`
- `Concepts/RightIdentity.md`
- `Concepts/TwoSidedIdentity.md`
- `Concepts/IdentityCoincidence.md`
- `Concepts/IdentityUniqueness.md`
- `Concepts/NeutralAndUnitLanguage.md`

## Lean Owners

- `Definition.lean`: definitions.
- `Theorems.lean`: direct application and projection theorems.
- `Relationships.lean`: coincidence, uniqueness, and later relation to
  notation-specific algebraic structures.
- `Examples.lean`: later examples only, after proofs are understood.
- `FailureModes.lean`: later counterexamples showing left-only and right-only
  identity behavior.

The files may not all exist yet as Lean files. This topic records the intended
shape before implementation.

