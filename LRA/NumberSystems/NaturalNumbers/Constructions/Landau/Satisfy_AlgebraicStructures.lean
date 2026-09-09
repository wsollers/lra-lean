import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Instances

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`satisfiesAdditiveCommutativeSemigroup` The one-based Landau construction canonically realizes additive commutative semigroup structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws Element

Logical form (Lean):

```lean
theorem satisfiesAdditiveCommutativeSemigroup
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Nonempty Element := LandauNonemptyOn model
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
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    AdditiveCommutativeSemigroupLaws Element := by
  sorry
/--
`satisfiesCommutativeMonoid` The one-based Landau construction canonically realizes multiplicative commutative monoid structure.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; have x_2 := ⋯; LRA.AlgebraicStructures.CommutativeMonoidLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; have x_2 := ⋯; LRA.AlgebraicStructures.CommutativeMonoidLaws Element

Logical form (Lean):

```lean
theorem satisfiesCommutativeMonoid
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeMonoidLaws Element
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
theorem satisfiesCommutativeMonoid
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeMonoidLaws Element := by
  sorry
/--
`satisfiesCommutativeSemiringWithoutZero` The one-based Landau construction canonically realizes the positive-naturals endpoint of the algebraic hierarchy: a commutative semiring without zero.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; have x_3 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; have x_3 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroLaws Element

Logical form (Lean):

```lean
theorem satisfiesCommutativeSemiringWithoutZero
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeSemiringWithoutZeroLaws Element
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
theorem satisfiesCommutativeSemiringWithoutZero
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeSemiringWithoutZeroLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
