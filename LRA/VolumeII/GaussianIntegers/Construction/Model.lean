-- LRA/VolumeII/GaussianIntegers/Construction/Model.lean
-- Gaussian integers over any certified commutative-ring carrier.

import LRA.VolumeI.Algebra.Models
import LRA.VolumeII.Integers.Construction

namespace LRA.VolumeII.GaussianIntegers

open LRA.VolumeI.Algebra.Models
open LRA.VolumeI.AlgebraicStructures

universe u

/-!
Volume II label: gaussian-integer-construction
Lean module: LRA.VolumeII.GaussianIntegers.Construction.Model
Verification status: definitions accepted; algebraic proofs pending

The Gaussian integers `a + b·i`, now over *any* commutative-ring
carrier `R` — the active project integers `Z`, Mathlib's `Int`, or any
other certified ring. Operations are the usual coordinate formulas in
the instance notation of `R`; the certificates flow whenever `R`'s do.
-/

/-- A Gaussian integer over the carrier `R`.

Logical form:

```lean
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R
```
-/
structure GaussianInteger (R : Type u) where
  realPart : R
  imaginaryPart : R

namespace GaussianInteger

variable {R : Type u}

/-! ## Machines -/

instance [OfNat R 0] : OfNat (GaussianInteger R) 0 := ⟨⟨0, 0⟩⟩

instance [OfNat R 0] [OfNat R 1] : OfNat (GaussianInteger R) 1 := ⟨⟨1, 0⟩⟩

/-- The Gaussian imaginary unit `0 + 1·i`.

Logical form:

```lean
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩
```
-/
def imaginaryUnit [OfNat R 0] [OfNat R 1] : GaussianInteger R := ⟨0, 1⟩

instance [Add R] : Add (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart + second.realPart,
     first.imaginaryPart + second.imaginaryPart⟩⟩

instance [Neg R] : Neg (GaussianInteger R) :=
  ⟨fun value => ⟨-value.realPart, -value.imaginaryPart⟩⟩

instance [Add R] [Neg R] : Sub (GaussianInteger R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart * second.realPart +
       -(first.imaginaryPart * second.imaginaryPart),
     first.realPart * second.imaginaryPart +
       first.imaginaryPart * second.realPart⟩⟩

/-- Gaussian conjugation: `a + b·i ↦ a - b·i`.

Logical form:

```lean
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩
```
-/
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩

/-- Squared Gaussian norm `a² + b²`, valued in the base carrier.

Logical form:

```lean
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart
```
-/
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart

/-! ## Construction theorems (statements; proofs pending) -/

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` states addition is associative.

Logical form:

```lean
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c)
```
-/
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c) := by
  sorry

/--
`addition_is_commutative` states addition is commutative.

Logical form:

```lean
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a
```
-/
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a := by
  sorry

/--
`zero_add_gaussian` states zero add gaussian.

Logical form:

```lean
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a
```
-/
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a := by
  sorry

/--
`add_zero_gaussian` states add zero gaussian.

Logical form:

```lean
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a
```
-/
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a := by
  sorry

/--
`neg_add_cancel_gaussian` states neg add cancel gaussian.

Logical form:

```lean
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0
```
-/
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0 := by
  sorry

/--
`add_neg_cancel_gaussian` states add neg cancel gaussian.

Logical form:

```lean
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0
```
-/
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0 := by
  sorry

/--
`multiplication_is_associative` states multiplication is associative.

Logical form:

```lean
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c)
```
-/
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c) := by
  sorry

/--
`multiplication_is_commutative` states multiplication is commutative.

Logical form:

```lean
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a
```
-/
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a := by
  sorry

/--
`one_mul_gaussian` states one mul gaussian.

Logical form:

```lean
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a
```
-/
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a := by
  sorry

/--
`mul_one_gaussian` states mul one gaussian.

Logical form:

```lean
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a
```
-/
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a := by
  sorry

/--
`zero_mul_gaussian` states zero mul gaussian.

Logical form:

```lean
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0
```
-/
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0 := by
  sorry

/--
`mul_zero_gaussian` states mul zero gaussian.

Logical form:

```lean
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0
```
-/
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0 := by
  sorry

/--
`left_distributive_gaussian` states left distributive gaussian.

Logical form:

```lean
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c
```
-/
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c := by
  sorry

/--
`right_distributive_gaussian` states right distributive gaussian.

Logical form:

```lean
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c
```
-/
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c := by
  sorry

/-- The Gaussian imaginary unit squares to negative one.

Logical form:

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R)
```
-/
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R) := by
  sorry

end RingTheorems

/-! ## Certificates -/

section Certificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (GaussianInteger R) :=
  ⟨addition_is_associative⟩

instance : AdditiveCommutativeLaws (GaussianInteger R) :=
  ⟨addition_is_commutative⟩

instance : AdditiveIdentityLaws (GaussianInteger R) :=
  ⟨zero_add_gaussian, add_zero_gaussian⟩

instance : AdditiveInverseLaws (GaussianInteger R) :=
  ⟨neg_add_cancel_gaussian, add_neg_cancel_gaussian⟩

instance : MultiplicativeSemigroupLaws (GaussianInteger R) :=
  ⟨multiplication_is_associative⟩

instance : MultiplicativeCommutativeLaws (GaussianInteger R) :=
  ⟨multiplication_is_commutative⟩

instance : MultiplicativeIdentityLaws (GaussianInteger R) :=
  ⟨one_mul_gaussian, mul_one_gaussian⟩

instance : ZeroAbsorbingLaws (GaussianInteger R) :=
  ⟨zero_mul_gaussian, mul_zero_gaussian⟩

instance : DistributiveLaws (GaussianInteger R) :=
  ⟨left_distributive_gaussian, right_distributive_gaussian⟩

instance : SubtractionCompatibilityLaw (GaussianInteger R) :=
  ⟨fun _ _ => rfl⟩

end Certificates

/-! ## The active Gaussian integers and their first-order model -/

/-- The Gaussian integers over the active project integers.

Logical form:

```lean
abbrev ActiveGaussianInteger := GaussianInteger LRA.VolumeII.Integers.Z
```
-/
abbrev ActiveGaussianInteger := GaussianInteger LRA.VolumeII.Integers.Z

/-- Any ring-ready carrier's Gaussian integers as a first-order model
of the arithmetic ring language.

Logical form:

```lean
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)
```
-/
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)

/-- The active Gaussian integers as a first-order model.

Logical form:

```lean
def GaussianArithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.VolumeII.Integers.Z
```
-/
def GaussianArithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.VolumeII.Integers.Z

/-! ## Smoke tests: same theorem surface over `Z` and `Int` -/

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance
example : CommutativeRingLaws (GaussianInteger Int) := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

example (a b : GaussianInteger Int) : a + b = b + a :=
  AddCommutative a b

end GaussianInteger

end LRA.VolumeII.GaussianIntegers
