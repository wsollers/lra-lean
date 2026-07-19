# Isomorphism Requirements for Constructed Number Systems

## Purpose

Every completed number-system construction shall be related to the corresponding Lean or Mathlib reference type by a formally stated isomorphism theorem in Volume III.

The purpose of the theorem is not to define the constructed type by transport from the reference type. The construction remains independent in Volume II. Volume III proves that the completed construction has the expected mathematical structure.

## Reference types

| Constructed system | Reference type |
|---|---|
| natural-number construction | `Nat` |
| whole-number construction | `Nat` |
| integer construction | `Int` |
| rational construction | `Rat` |
| real construction | `Real` |
| complex construction | `Complex` |

## Carrier equivalence

For a constructed carrier `C` and reference carrier `R`, the first requirement is an equivalence

```lean
C ≃ R
```

with inverse laws:

```lean
theorem to_reference_after_from_reference
    (value : R) :
    toReference (fromReference value) = value := by
  sorry

theorem from_reference_after_to_reference
    (value : C) :
    fromReference (toReference value) = value := by
  sorry
```

These theorem statements must be final before proof work begins. Their proofs remain `sorry` until completed in the declared proof order.

## Ring isomorphism requirements

For an integer-like construction, the equivalence must preserve:

- zero;
- one;
- addition;
- negation;
- multiplication.

The required theorem statements have the form

```lean
theorem map_zero : toReference constructedZero = referenceZero := by
  sorry

theorem map_one : toReference constructedOne = referenceOne := by
  sorry

theorem map_add (left right : C) :
    toReference (constructedAdd left right) =
      referenceAdd (toReference left) (toReference right) := by
  sorry

theorem map_neg (value : C) :
    toReference (constructedNeg value) =
      referenceNeg (toReference value) := by
  sorry

theorem map_mul (left right : C) :
    toReference (constructedMul left right) =
      referenceMul (toReference left) (toReference right) := by
  sorry
```

Subtraction may be derived from addition and negation, but it must also have a named interoperability theorem because it is part of the public arithmetic interface.

## Ordered-ring requirements

For natural, whole, integer, rational, and real constructions, the bridge must preserve and reflect both strict and non-strict order:

```lean
theorem map_lt (left right : C) :
    constructedLt left right ↔
      referenceLt (toReference left) (toReference right) := by
  sorry

theorem map_le (left right : C) :
    constructedLe left right ↔
      referenceLe (toReference left) (toReference right) := by
  sorry
```

Order is not part of the complex-number isomorphism requirement. No linear order on `Complex` is to be invented.

## Field requirements

For rational and real constructions, the bridge must preserve inversion away from zero:

```lean
theorem map_inv (value : C)
    (value_is_nonzero : value ≠ constructedZero) :
    toReference (constructedInv value) =
      referenceInv (toReference value) := by
  sorry
```

Division shall have its own named theorem, derived later from multiplication and inversion.

## Complex requirements

For complex constructions, the bridge must preserve:

- zero and one;
- addition, negation, subtraction, and multiplication;
- inversion and division away from zero;
- conjugation;
- real and imaginary projections;
- norm or squared norm, according to the established public interface.

The complex bridge is a field isomorphism with additional conjugation data, not an ordered-field isomorphism.

## Construction-specific functions

Every named public function introduced by a construction must receive a commuting theorem when there is a corresponding reference function. Examples include:

- successor and predecessor;
- absolute value;
- sign;
- quotient and remainder;
- floor and ceiling;
- numerator and denominator after normalization;
- real and imaginary part;
- conjugation;
- interval endpoint maps where applicable.

A generic commuting theorem is not a substitute for naming the concrete theorem in the construction's interoperability module.

## Embedding compatibility

The canonical tower embeddings must commute with the reference embeddings:

```text
constructed N -> constructed Z -> constructed Q -> constructed R -> constructed C
     |                |                |                |                |
     v                v                v                v                v
    Nat ------------> Int -----------> Rat -----------> Real ----------> Complex
```

Each square requires a theorem statement with proof body `sorry` until reached in the proof queue.

## Proof-status rule

The isomorphism contracts and theorem signatures are required now. The proofs are intentionally not to be completed during statement normalization:

```lean
theorem construction_is_isomorphic_to_reference :
    RequiredIsomorphismData := by
  sorry
```

An isomorphism theorem may be marked proved only after `#print axioms` shows that it does not depend on `sorryAx`.
