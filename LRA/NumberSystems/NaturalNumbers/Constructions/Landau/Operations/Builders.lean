
import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`LandauOneOn` TODO

Predicate logic:

  abbrev LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
    ⟨model.base⟩

Predicate logic (unfolded):

  abbrev LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
    ⟨model.base⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.base⟩
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
abbrev LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.base⟩

/--
`LandauSuccOn` TODO

Predicate logic:

  abbrev LandauSuccOn (model : PeanoSystem Element SetObject) :
      HasSuccessor Element :=
    ⟨model.successor⟩

Predicate logic (unfolded):

  abbrev LandauSuccOn (model : PeanoSystem Element SetObject) :
      HasSuccessor Element :=
    ⟨model.successor⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LandauSuccOn (model : PeanoSystem Element SetObject) :
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
abbrev LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

/--
`LandauNonemptyOn` packages the distinguished `one` element as the witness needed by bundled semigroup-style interfaces.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (a : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), Nonempty Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    Nonempty Element

Logical form (Lean):

```lean
theorem LandauNonemptyOn (model : PeanoSystem Element SetObject) :
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
theorem LandauNonemptyOn (model : PeanoSystem Element SetObject) :
    Nonempty Element := by
  sorry
/--
`LandauAddOn` TODO

Predicate logic:

  noncomputable abbrev LandauAddOn (model : PeanoSystem Element SetObject) :
      Add Element :=
    ⟨LandauAddition model⟩

Predicate logic (unfolded):

  noncomputable abbrev LandauAddOn (model : PeanoSystem Element SetObject) :
      Add Element :=
    ⟨LandauAddition model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩
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
noncomputable abbrev LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩

/--
`LandauMulOn` TODO

Predicate logic:

  noncomputable abbrev LandauMulOn (model : PeanoSystem Element SetObject) :
      Mul Element :=
    ⟨LandauMultiplication model⟩

Predicate logic (unfolded):

  noncomputable abbrev LandauMulOn (model : PeanoSystem Element SetObject) :
      Mul Element :=
    ⟨LandauMultiplication model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩
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
noncomputable abbrev LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩

/--
`LandauAdditiveSemigroupLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn model; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws Element

Logical form (Lean):

```lean
theorem LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Nonempty Element := LandauNonemptyOn model
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

Related proof moves: unfold

-/
theorem LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Add Element := LandauAddOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    AdditiveSemigroupLaws Element := by
  sorry
/--
`LandauAdditiveCommutativeLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), LRA.AlgebraicStructures.AdditiveCommutativeLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    LRA.AlgebraicStructures.AdditiveCommutativeLaws Element

Logical form (Lean):

```lean
theorem LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model)
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
theorem LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) := by
  sorry
/--
`LandauMultiplicativeSemigroupLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := ⋯; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn model; have x_1 := ⋯; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws Element

Logical form (Lean):

```lean
theorem LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    MultiplicativeSemigroupLaws Element
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
theorem LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    let _ : Mul Element := LandauMulOn model
    let _ : Nonempty Element := LandauNonemptyOn model
    MultiplicativeSemigroupLaws Element := by
  sorry
/--
`LandauMultiplicativeCommutativeLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), LRA.AlgebraicStructures.MultiplicativeCommutativeLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    LRA.AlgebraicStructures.MultiplicativeCommutativeLaws Element

Logical form (Lean):

```lean
theorem LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model)
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
theorem LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) := by
  sorry
/--
`LandauDistributiveLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject), LRA.AlgebraicStructures.DistributiveLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    model : PeanoSystem Element SetObject
  Prove
    LRA.AlgebraicStructures.DistributiveLaws Element

Logical form (Lean):

```lean
theorem LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model)
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
theorem LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) := by
  sorry
example (model : PeanoSystem Element SetObject) (a b c : Element) : True := by
  letI := LandauAddOn model
  letI := LandauNonemptyOn model
  letI := LandauAdditiveSemigroupLawsOn model
  letI := LandauAdditiveCommutativeLawsOn model
  have associated : (a + b) + c = a + (b + c) := AddAssociative a b c
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
