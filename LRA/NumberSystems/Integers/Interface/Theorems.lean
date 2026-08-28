import LRA.Carrier.Countability
import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.Integers

universe u

/--
`IntegerNumberSystemIsCountable` TODO

Predicate logic:

  LRA.Carrier.IsCountable integerSystem.Model.Carrier

Predicate logic (unfolded):

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem), Exists fun f => ∀ (y : Nat) (x₁ x₂ : integerSystem.Model.1), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
theorem IntegerNumberSystemIsCountable
    (integerSystem : IntegerNumberSystem.{u}) :
    LRA.Carrier.IsCountable integerSystem.Model.Carrier
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
theorem IntegerNumberSystemIsCountable
    (integerSystem : IntegerNumberSystem.{u}) :
    LRA.Carrier.IsCountable integerSystem.Model.Carrier := by
  sorry

end LRA.NumberSystems.Integers
