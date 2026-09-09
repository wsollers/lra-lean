import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Laws.Definition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Builders

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauAdditiveCancellativeLawsOn` The one-based Landau addition law package is cancellative even though this carrier does not admit an additive identity.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; LRA.AlgebraicStructures.AdditiveCancellativeLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; LRA.AlgebraicStructures.AdditiveCancellativeLaws Element

Logical form (Lean):

```lean
theorem LandauAdditiveCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    AdditiveCancellativeLaws Element
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
theorem LandauAdditiveCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    AdditiveCancellativeLaws Element := by
  sorry
/--
`LandauMultiplicativeIdentityLawsOn` Landau multiplication on the Chapter I carrier has `1` as a two-sided identity.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; LRA.AlgebraicStructures.MultiplicativeIdentityLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn model; LRA.AlgebraicStructures.MultiplicativeIdentityLaws Element

Logical form (Lean):

```lean
theorem LandauMultiplicativeIdentityLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    MultiplicativeIdentityLaws Element
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
theorem LandauMultiplicativeIdentityLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    MultiplicativeIdentityLaws Element := by
  sorry
/--
`LandauMultiplicativeCancellativeLawsOn` The one-based Landau multiplication law package is cancellative on the positive carrier.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; LRA.AlgebraicStructures.MultiplicativeCancellativeLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; LRA.AlgebraicStructures.MultiplicativeCancellativeLaws Element

Logical form (Lean):

```lean
theorem LandauMultiplicativeCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    MultiplicativeCancellativeLaws Element
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
theorem LandauMultiplicativeCancellativeLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    MultiplicativeCancellativeLaws Element := by
  sorry
/--
`LandauCommutativeSemiringWithoutZeroLawsOn` Combined one-based semiring-without-zero package for the Landau Chapter I carrier. This is the natural algebraic endpoint for the construction before a zero is adjoined in the whole-number layer.

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
theorem LandauCommutativeSemiringWithoutZeroLawsOn
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
theorem LandauCommutativeSemiringWithoutZeroLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Mul Element := LandauMulOn model
    let _ : OfNat Element 1 := LandauOneOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    CommutativeSemiringWithoutZeroLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
