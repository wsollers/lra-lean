import LRA.Carrier.Countability
import LRA.NumberSystems.Integers.Theorems
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers

universe u

/--
`RationalNumberSystemIsCountable` TODO

Predicate logic:

  LRA.Carrier.IsCountable rationalSystem.FieldModel.Carrier

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), Exists fun f => ∀ (y : Nat) (x₁ x₂ : rationalSystem.FieldModel.1), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem RationalNumberSystemIsCountable
    (rationalSystem : RationalNumberSystem.{u}) :
    LRA.Carrier.IsCountable rationalSystem.FieldModel.Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem RationalNumberSystemIsCountable
    (rationalSystem : RationalNumberSystem.{u}) :
    LRA.Carrier.IsCountable rationalSystem.FieldModel.Carrier := by
  sorry

end LRA.NumberSystems.RationalNumbers
