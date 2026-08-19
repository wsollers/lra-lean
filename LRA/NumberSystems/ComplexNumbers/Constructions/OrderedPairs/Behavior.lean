-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Behavior.lean
-- How the construction behaves with respect to the real-axis embedding,
-- and the algebraic-closure obligation over a complete ordered base field.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Laws

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

section EmbeddingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`of_real_preserves_zero` states of real preserves zero.

Logical form:

```lean
theorem of_real_preserves_zero : of_real (0 : R) = (0 : ComplexNumber R)
```
-/
theorem of_real_preserves_zero : of_real (0 : R) = (0 : ComplexNumber R) := by
  sorry

/--
`of_real_preserves_one` states of real preserves one.

Logical form:

```lean
theorem of_real_preserves_one : of_real (1 : R) = (1 : ComplexNumber R)
```
-/
theorem of_real_preserves_one : of_real (1 : R) = (1 : ComplexNumber R) := by
  sorry

/--
`of_real_preserves_addition` states of real preserves addition.

Logical form:

```lean
theorem of_real_preserves_addition (first second : R) :
    of_real (first + second) = of_real first + of_real second
```
-/
theorem of_real_preserves_addition (first second : R) :
    of_real (first + second) = of_real first + of_real second := by
  sorry

/--
`of_real_preserves_negation` states of real preserves negation.

Logical form:

```lean
theorem of_real_preserves_negation (value : R) :
    of_real (-value) = -(of_real value)
```
-/
theorem of_real_preserves_negation (value : R) :
    of_real (-value) = -(of_real value) := by
  sorry

/--
`of_real_preserves_multiplication` states of real preserves multiplication.

Logical form:

```lean
theorem of_real_preserves_multiplication (first second : R) :
    of_real (first * second) = of_real first * of_real second
```
-/
theorem of_real_preserves_multiplication (first second : R) :
    of_real (first * second) = of_real first * of_real second := by
  sorry

/--
`of_real_is_injective` states of real is injective.

Logical form:

```lean
theorem of_real_is_injective (first second : R)
    (images_equal : of_real first = of_real second) : first = second
```
-/
theorem of_real_is_injective (first second : R)
    (images_equal : of_real first = of_real second) : first = second := by
  sorry

end EmbeddingTheorems

/-! ## Polynomials and the algebraic-closure obligation -/

/-- A finite polynomial over the constructed complex numbers.

Logical form:

```lean
structure Polynomial (R : Type u) where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R
```
-/
structure Polynomial (R : Type u) where
  degree : Nat
  coefficient : Fin (degree + 1) → ComplexNumber R

/-- Polynomial evaluation.

Logical form:

```lean
def Polynomial.evaluate [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R
```
-/
def Polynomial.evaluate [Add R] [Mul R]
    (polynomial : Polynomial R)
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry

/-- A nonconstant polynomial.

Logical form:

```lean
def Polynomial.nonconstant (polynomial : Polynomial R) : Prop :=
  polynomial.degree ≠ 0
```
-/
def Polynomial.nonconstant (polynomial : Polynomial R) : Prop :=
  polynomial.degree ≠ 0

/--
Every nonconstant polynomial over the complex numbers built on a
*complete* ordered base field has a root: the fundamental theorem of
algebra obligation. Completeness of `R` is where analysis enters.


Logical form:

```lean
theorem algebraic_closure_obligation
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] [OrderCompletenessLaws R (Set R)]
    (polynomial : Polynomial R)
    (polynomial_nonconstant : polynomial.nonconstant) :
    ∃ root : ComplexNumber R,
      polynomial.evaluate root = (0 : ComplexNumber R)
```
-/
theorem algebraic_closure_obligation
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] [OrderCompletenessLaws R (Set R)]
    (polynomial : Polynomial R)
    (polynomial_nonconstant : polynomial.nonconstant) :
    ∃ root : ComplexNumber R,
      polynomial.evaluate root = (0 : ComplexNumber R) := by
  sorry

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
