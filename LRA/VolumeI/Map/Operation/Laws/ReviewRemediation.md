# Generic Operation Laws Review Remediation

This file tracks findings from the scaffold review that should be handled
before replacing `sorry` proofs topic by topic.

## Repaired Immediately

- Replaced the false `ConstantZeroEmbeddingFailsPreservesAddition` failure mode
  with `ConstantZeroEmbeddingFailsPreservesOne`.
- Repaired the subtraction order-compatibility failure mode from right
  translation to left translation.
- Added the positive monus right-translation preservation example.
- Anchored `SignNegationLaws` to additive inverse behavior by adding
  `AdditiveInverseAnchor addition negation zero` to the bundle.
- Added element-level and predicate-restricted cancellation:
  `LeftRegular`, `RightRegular`, `LeftCancellativeOn`, and
  `RightCancellativeOn`.
- Added element-level and predicate-restricted inverse language:
  `LeftInverseOf`, `RightInverseOf`, `TwoSidedInverseOf`, and inverse-on
  predicates for subcarriers of units or nonzero elements.
- Added operation congruence/well-definedness language to `EquationalLogic`.
- Added injective embedding and relation-reflection language to
  `NumberEmbeddings`.
- Replaced nilpotence's dependency on an unconstrained zero-exponent identity
  by adding `PositivePower` and defining nilpotence through positive powers.

## Next Structural Batch

- Re-home the general `OperationPower` iterator into an iteration/power topic.
- Add the power-addition theorem with associativity as an explicit hypothesis.
- Add pointwise inverse uniqueness and shoes-and-socks inverse-order theorem.
- Add the derivation chain for sign-negation laws from additive inverse,
  distributivity, cancellation, and zero absorption.

## Later Audit Batch

- Add law-interaction theorems such as distributivity forcing zero absorption.
- Add relation-property pinned theorems for transitivity, reflexivity,
  antisymmetry, totality, and strict-order behavior.
- Add independence-matrix examples separating associativity, commutativity,
  idempotence, absorbing behavior, and cancellation.
- Deduplicate theorem statements that are currently pedagogical aliases.
