
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

/--
`PrecisionRadius` TODO

Predicate logic:

  def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹

Predicate logic (unfolded):

  def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹

/--
`EffectiveCauchyApproximation` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
          difference < PrecisionRadius rationalSystem precision (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

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
