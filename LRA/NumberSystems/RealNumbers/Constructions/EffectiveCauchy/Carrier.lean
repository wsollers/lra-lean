-- Modulus-tracked rational Cauchy approximations.

import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

/-- The dyadic precision radius `2⁻ⁿ` in the rational field.

Logical form:

```lean
def PrecisionRadius
    (rationalSystem : RationalNumberSystem) : Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹
```
-/
def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹

/-- A rational approximation equipped with an explicit modulus proving the
Cauchy condition at dyadic precision `2⁻ⁿ`.

This is an effective-form Cauchy approximation: the data include a modulus,
but no claim is made that the functions are computable. A genuine computable
real requires a separate computability notion or program code.

Logical form:

```lean
structure EffectiveCauchyApproximation
    (rationalSystem : RationalNumberSystem) where
  Approximate : Nat → rationalSystem.FieldModel.Carrier
  Modulus : Nat → Nat
  CauchyAtPrecision :
    ∀ precision firstIndex secondIndex : Nat,
      Modulus precision ≤ firstIndex →
      Modulus precision ≤ secondIndex →
        let difference := Approximate firstIndex + -Approximate secondIndex;
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision
```
-/
structure EffectiveCauchyApproximation
    (rationalSystem : RationalNumberSystem.{u}) where
  Approximate : Nat → rationalSystem.FieldModel.Carrier
  Modulus : Nat → Nat
  CauchyAtPrecision :
    ∀ precision firstIndex secondIndex : Nat,
      Modulus precision ≤ firstIndex →
      Modulus precision ≤ secondIndex →
        let difference := Approximate firstIndex + -Approximate secondIndex;
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
