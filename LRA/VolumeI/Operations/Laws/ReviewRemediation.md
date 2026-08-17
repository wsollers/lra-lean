# Generic Operation Laws Review Remediation

This file tracks findings from the scaffold review that should be handled
before replacing `sorry` proofs topic by topic.

## Repaired Immediately

- Replaced the false `ConstantZeroEmbeddingFailsPreservesAddition` failure mode
  with `ConstantZeroEmbeddingFailsPreservesOne`.
- Repaired the subtraction order-compatibility failure mode from right
  translation to left translation.
- Added the positive monus right-translation preservation example.
- Removed the obsolete operation-law bundle for sign/subtraction/product
  negation; those facts now belong to additive-group, ring, derived operation,
  or ordered-structure owners.
- Added element-level and predicate-restricted cancellation:
  `LeftRegular`, `RightRegular`, `LeftCancellativeOn`, and
  `RightCancellativeOn`.
- Added element-level and predicate-restricted inverse language:
  `LeftInverseOf`, `RightInverseOf`, `TwoSidedInverseOf`, and inverse-on
  predicates for subcarriers of units or nonzero elements.
- Moved operation congruence/well-definedness language to
  `UniversalAlgebra/Congruence`.
- Moved generic embedding and relation-reflection language out of
  `NumberEmbeddings` and into `Map/Morphisms`.
- Replaced nilpotence's dependency on an unconstrained zero-exponent identity
  by adding `PositivePower` and defining nilpotence through positive powers.

## Next Structural Batch

- Re-home the general `OperationPower` iterator into an iteration/power topic.
- Add the power-addition theorem with associativity as an explicit hypothesis.
- Add pointwise inverse uniqueness and shoes-and-socks inverse-order theorem.
- Add the derivation chain for product-negation and subtraction facts under
  additive-group/ring consequences, using distributivity, cancellation, and
  zero absorption as explicit hypotheses.

## Later Audit Batch

- Add law-interaction theorems such as distributivity forcing zero absorption.
- Add relation-property pinned theorems for transitivity, reflexivity,
  antisymmetry, totality, and strict-order behavior.
- Add independence-matrix examples separating associativity, commutativity,
  idempotence, absorbing behavior, and cancellation.
- Deduplicate theorem statements that are currently pedagogical aliases.
