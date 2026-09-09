import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.AlgebraicStructures

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`satisfiesAdditiveCommutativeSemigroup` The 0-based Presburger construction canonically realizes additive commutative semigroup structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws Element

Logical form (Lean):

```lean
theorem satisfiesAdditiveCommutativeSemigroup
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveCommutativeSemigroupLaws Element
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
theorem satisfiesAdditiveCommutativeSemigroup
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveCommutativeSemigroupLaws Element := by
  sorry
/--
`satisfiesAdditiveMonoid` The 0-based Presburger construction canonically realizes additive monoid structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerZeroOn model; have x_2 := ⋯; LRA.AlgebraicStructures.AdditiveMonoidLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerZeroOn model; have x_2 := ⋯; LRA.AlgebraicStructures.AdditiveMonoidLaws Element

Logical form (Lean):

```lean
theorem satisfiesAdditiveMonoid
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveMonoidLaws Element
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
theorem satisfiesAdditiveMonoid
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveMonoidLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
