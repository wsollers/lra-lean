-- LRA/VolumeII/ComplexNumbers/Construction/Construction.lean
-- Complex numbers over any certified carrier.

import LRA.VolumeI.AlgebraicStructures

namespace LRA.VolumeII.ComplexNumbers.Construction

open LRA.VolumeI.AlgebraicStructures

universe u

/-!
Volume II label: complex-number-construction
Lean module: LRA.VolumeII.ComplexNumbers.Construction.Construction
Verification status: definitions accepted; algebraic proofs pending

The standard construction of complex numbers, now over *any* carrier
`R`: the carrier is `R × R` (as a structure), operations are
coordinatewise in the instance notation of `R`, and each operation asks
for exactly the real capabilities it uses. Instantiating `R` at the
project reals, Mathlib's `ℝ`, `ℚ` (giving `ℚ(i)`), or even `ℤ` (giving
the Gaussian integers as a ring) is zero additional work — the
certificates below flow whenever `R`'s do.

Capability honesty in the certificates: the *ring* certificates need
only `CommutativeRingLaws R`, but the *field* certificates (inverses)
need `R` ordered — over an arbitrary field the norm `a² + b²` can
vanish on nonzero elements (over `ℂ` itself, `1² + i² = 0`), and it is
the ordering of `R` that rules this out.
-/

/-- A complex number over the carrier `R`: a formal pair
`real_part + imaginary_part · i`.

Logical form:

```lean
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R
```
-/
structure ComplexNumber (R : Type u) where
  real_part : R
  imaginary_part : R

namespace ComplexNumber

variable {R : Type u}

/-! ## Machines: each operation asks only for what it uses -/

instance [OfNat R 0] : OfNat (ComplexNumber R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (ComplexNumber R) 1 := ⟨⟨1, 0⟩⟩

/-- The imaginary unit `i`.

Logical form:

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩
```
-/
def imaginaryUnit [OfNat R 0] [OfNat R 1] : ComplexNumber R := ⟨0, 1⟩

instance [Add R] : Add (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part + second.real_part,
     first.imaginary_part + second.imaginary_part⟩⟩

instance [Neg R] : Neg (ComplexNumber R) :=
  ⟨fun value => ⟨-value.real_part, -value.imaginary_part⟩⟩

instance [Add R] [Neg R] : Sub (ComplexNumber R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (ComplexNumber R) :=
  ⟨fun first second =>
    ⟨first.real_part * second.real_part +
       -(first.imaginary_part * second.imaginary_part),
     first.real_part * second.imaginary_part +
       first.imaginary_part * second.real_part⟩⟩

/-- Complex conjugation: `a + b·i ↦ a - b·i`.

Logical form:

```lean
def conjugation [Neg R] (value : ComplexNumber R) : ComplexNumber R :=
  ⟨value.real_part, -value.imaginary_part⟩
```
-/
def conjugation [Neg R] (value : ComplexNumber R) : ComplexNumber R :=
  ⟨value.real_part, -value.imaginary_part⟩

/-- Squared modulus `a² + b²`, valued in the base carrier.

Logical form:

```lean
def normSquared [Add R] [Mul R] (value : ComplexNumber R) : R :=
  value.real_part * value.real_part +
    value.imaginary_part * value.imaginary_part
```
-/
def normSquared [Add R] [Mul R] (value : ComplexNumber R) : R :=
  value.real_part * value.real_part +
    value.imaginary_part * value.imaginary_part

/-- Totalized inverse through the base carrier's totalized inverse
(under the field convention `0⁻¹ = 0`, the complex zero maps to
zero). -/
instance [Add R] [Mul R] [Neg R] [Inv R] : Inv (ComplexNumber R) :=
  ⟨fun value =>
    ⟨value.real_part * (normSquared value)⁻¹,
     -(value.imaginary_part * (normSquared value)⁻¹)⟩⟩

/-- Embed the base carrier on the real axis.

Logical form:

```lean
def of_real [OfNat R 0] (value : R) : ComplexNumber R := ⟨value, 0⟩
```
-/
def of_real [OfNat R 0] (value : R) : ComplexNumber R := ⟨value, 0⟩

/-- Complex equality is coordinatewise equality.

Logical form:

```lean
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second
```
-/
theorem ext {first second : ComplexNumber R}
    (real_parts_equal : first.real_part = second.real_part)
    (imaginary_parts_equal :
      first.imaginary_part = second.imaginary_part) :
    first = second := by
  cases first
  cases second
  simp_all

/-! ## Construction theorems (statements; proofs are the construction's
obligations) -/

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` states addition is associative.

Logical form:

```lean
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c)
```
-/
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c) := by
  sorry

/--
`addition_is_commutative` states addition is commutative.

Logical form:

```lean
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a
```
-/
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a := by
  sorry

/--
`zero_add_complex` states zero add complex.

Logical form:

```lean
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a
```
-/
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a := by
  sorry

/--
`add_zero_complex` states add zero complex.

Logical form:

```lean
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a
```
-/
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a := by
  sorry

/--
`neg_add_cancel_complex` states neg add cancel complex.

Logical form:

```lean
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0
```
-/
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0 := by
  sorry

/--
`add_neg_cancel_complex` states add neg cancel complex.

Logical form:

```lean
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0
```
-/
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0 := by
  sorry

/--
`multiplication_is_associative` states multiplication is associative.

Logical form:

```lean
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c)
```
-/
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c) := by
  sorry

/--
`multiplication_is_commutative` states multiplication is commutative.

Logical form:

```lean
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a
```
-/
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a := by
  sorry

/--
`one_mul_complex` states one mul complex.

Logical form:

```lean
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a
```
-/
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a := by
  sorry

/--
`mul_one_complex` states mul one complex.

Logical form:

```lean
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a
```
-/
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a := by
  sorry

/--
`zero_mul_complex` states zero mul complex.

Logical form:

```lean
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0
```
-/
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0 := by
  sorry

/--
`mul_zero_complex` states mul zero complex.

Logical form:

```lean
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0
```
-/
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0 := by
  sorry

/--
`left_distributive_complex` states left distributive complex.

Logical form:

```lean
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c
```
-/
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c := by
  sorry

/--
`right_distributive_complex` states right distributive complex.

Logical form:

```lean
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c
```
-/
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c := by
  sorry

/-- The defining identity: `i² = -1`.

Logical form:

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R)
```
-/
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R) := by
  sorry

end RingTheorems

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

/-- Over an *ordered* base field the norm is anisotropic: it vanishes
only at zero. This is where the ordering is genuinely used.

Logical form:

```lean
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R)
```
-/
theorem norm_squared_ne_zero_of_nonzero
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    normSquared value ≠ (0 : R) := by
  sorry

/--
`one_ne_zero_complex` states one ne zero complex.

Logical form:

```lean
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0
```
-/
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0 := by
  sorry

/--
`mul_inv_cancel_complex` states mul inv cancel complex.

Logical form:

```lean
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1
```
-/
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1 := by
  sorry

/--
`inv_zero_complex` states inv zero complex.

Logical form:

```lean
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0
```
-/
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0 := by
  sorry

end FieldTheorems

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

/-! ## Certificates: the construction theorems, registered -/

section RingCertificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (ComplexNumber R) :=
  ⟨addition_is_associative⟩

instance : AdditiveCommutativeLaws (ComplexNumber R) :=
  ⟨addition_is_commutative⟩

instance : AdditiveIdentityLaws (ComplexNumber R) :=
  ⟨zero_add_complex, add_zero_complex⟩

instance : AdditiveInverseLaws (ComplexNumber R) :=
  ⟨neg_add_cancel_complex, add_neg_cancel_complex⟩

instance : MultiplicativeSemigroupLaws (ComplexNumber R) :=
  ⟨multiplication_is_associative⟩

instance : MultiplicativeCommutativeLaws (ComplexNumber R) :=
  ⟨multiplication_is_commutative⟩

instance : MultiplicativeIdentityLaws (ComplexNumber R) :=
  ⟨one_mul_complex, mul_one_complex⟩

instance : ZeroAbsorbingLaws (ComplexNumber R) :=
  ⟨zero_mul_complex, mul_zero_complex⟩

instance : DistributiveLaws (ComplexNumber R) :=
  ⟨left_distributive_complex, right_distributive_complex⟩

instance : SubtractionCompatibilityLaw (ComplexNumber R) :=
  ⟨fun _ _ => rfl⟩

end RingCertificates

section FieldCertificates

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

instance : NontrivialityLaw (ComplexNumber R) :=
  ⟨one_ne_zero_complex⟩

instance : MultiplicativeInverseLaws (ComplexNumber R) :=
  ⟨mul_inv_cancel_complex, inv_zero_complex⟩

end FieldCertificates

/-! ## Smoke tests: the two worlds meet -/

example : CommutativeRingLaws (ComplexNumber Int) := inferInstance
example : FieldLaws (ComplexNumber Rat) := inferInstance
example : FieldLaws (ComplexNumber Real) := inferInstance

example (a b : ComplexNumber Real) : a + b = b + a := AddCommutative a b

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
    (input : ComplexNumber R) : ComplexNumber R :=
  sorry
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

end ComplexNumber

end LRA.VolumeII.ComplexNumbers.Construction
