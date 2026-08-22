-- Equality of represented limits for modulus-tracked rational approximations.

import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

/-- Two effective-form Cauchy approximations represent the same limit when
their pointwise difference eventually lies inside every dyadic precision
radius.

Logical form:

```lean
def Equivalent
    {rationalSystem : RationalNumberSystem}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat, ∀ n ≥ index,
      let difference := first.Approximate n + -second.Approximate n
      -PrecisionRadius rationalSystem precision < difference ∧
        difference < PrecisionRadius rationalSystem precision
```
-/
def Equivalent
    {rationalSystem : RationalNumberSystem.{u}}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat, ∀ n ≥ index,
      let difference := first.Approximate n + -second.Approximate n;
      -PrecisionRadius rationalSystem precision < difference ∧
        difference < PrecisionRadius rationalSystem precision

/-- Equality-of-limit is an equivalence relation on effective-form Cauchy
approximations. -/
theorem EquivalentIsEquivalence
    (rationalSystem : RationalNumberSystem.{u}) :
    Equivalence (@Equivalent rationalSystem) := by
  sorry

/-- The setoid identifying approximations that represent the same limit. -/
def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem

/-- Real values represented by modulus-tracked rational Cauchy approximations.

No computability or countability claim is built into this quotient.
-/
abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem)

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
