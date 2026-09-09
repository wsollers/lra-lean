import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.AlgebraicStructures

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PresburgerZeroOn` The concrete Presburger zero acts as the additive identity constant.

Predicate logic:

  abbrev PresburgerZeroOn (model : PresburgerModel Element SetObject) :
      OfNat Element 0 :=
    ⟨model.zero⟩

Predicate logic (unfolded):

  abbrev PresburgerZeroOn (model : PresburgerModel Element SetObject) :
      OfNat Element 0 :=
    ⟨model.zero⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PresburgerZeroOn (model : PresburgerModel Element SetObject) :
    OfNat Element 0 :=
  ⟨model.zero⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PresburgerZeroOn (model : PresburgerModel Element SetObject) :
    OfNat Element 0 :=
  ⟨model.zero⟩

/--
`PresburgerSuccOn` Presburger arithmetic keeps the primitive successor visible alongside the recursive addition layer.

Predicate logic:

  abbrev PresburgerSuccOn (model : PresburgerModel Element SetObject) :
      HasSuccessor Element :=
    ⟨model.successor⟩

Predicate logic (unfolded):

  abbrev PresburgerSuccOn (model : PresburgerModel Element SetObject) :
      HasSuccessor Element :=
    ⟨model.successor⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PresburgerSuccOn (model : PresburgerModel Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PresburgerSuccOn (model : PresburgerModel Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

/--
`PresburgerNonemptyOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (a : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), Nonempty Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    Nonempty Element

Logical form (Lean):

```lean
theorem PresburgerNonemptyOn (model : PresburgerModel Element SetObject) :
    Nonempty Element
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
theorem PresburgerNonemptyOn (model : PresburgerModel Element SetObject) :
    Nonempty Element := by
  sorry
/--
`PresburgerAddOn` TODO

Predicate logic:

  noncomputable abbrev PresburgerAddOn (model : PresburgerModel Element SetObject) :
      Add Element :=
    ⟨PresburgerAddition model⟩

Predicate logic (unfolded):

  noncomputable abbrev PresburgerAddOn (model : PresburgerModel Element SetObject) :
      Add Element :=
    ⟨PresburgerAddition model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev PresburgerAddOn (model : PresburgerModel Element SetObject) :
    Add Element :=
  ⟨PresburgerAddition model⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable abbrev PresburgerAddOn (model : PresburgerModel Element SetObject) :
    Add Element :=
  ⟨PresburgerAddition model⟩

/--
`PresburgerAdditiveSemigroupLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws Element

Logical form (Lean):

```lean
theorem PresburgerAdditiveSemigroupLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveSemigroupLaws Element
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
theorem PresburgerAdditiveSemigroupLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveSemigroupLaws Element := by
  sorry
/--
`PresburgerAdditiveIdentityLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerZeroOn model; LRA.AlgebraicStructures.AdditiveIdentityLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerZeroOn model; LRA.AlgebraicStructures.AdditiveIdentityLaws Element

Logical form (Lean):

```lean
theorem PresburgerAdditiveIdentityLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    AdditiveIdentityLaws Element
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
theorem PresburgerAdditiveIdentityLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    AdditiveIdentityLaws Element := by
  sorry
/--
`PresburgerAdditiveCommutativeLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; LRA.AlgebraicStructures.AdditiveCommutativeLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PresburgerModel Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddOn model; LRA.AlgebraicStructures.AdditiveCommutativeLaws Element

Logical form (Lean):

```lean
theorem PresburgerAdditiveCommutativeLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    AdditiveCommutativeLaws Element
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
theorem PresburgerAdditiveCommutativeLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    AdditiveCommutativeLaws Element := by
  sorry
/--
`PresburgerAdditiveMonoidLawsOn` TODO

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
theorem PresburgerAdditiveMonoidLawsOn
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
theorem PresburgerAdditiveMonoidLawsOn
    (model : PresburgerModel Element SetObject) :
    let _ : Add Element := PresburgerAddOn model
    let _ : OfNat Element 0 := PresburgerZeroOn model
    let _ : Nonempty Element := PresburgerNonemptyOn model
    AdditiveMonoidLaws Element := by
  sorry
end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
