
import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Instances
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Laws
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Behavior

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.Order
open LRA.NumberSystems.NaturalNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`underlyingNaturalCommutativeSemiringWithoutZeroLawsOn` The whole-number Landau input package carries an underlying one-based natural arithmetic surface, so its `model` can be reused directly as a `CommutativeSemiringWithoutZeroLaws` witness on the Chapter I carrier.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn natural_data.model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn natural_data.model; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn natural_data.model; have x_3 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroLaws Element

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddOn natural_data.model; have x_1 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMulOn natural_data.model; have x_2 := LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauOneOn natural_data.model; have x_3 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroLaws Element

Logical form (Lean):

```lean
theorem underlyingNaturalCommutativeSemiringWithoutZeroLawsOn :
    let _ : Add Element :=
      LandauAddOn natural_data.model
    let _ : Mul Element :=
      LandauMulOn natural_data.model
    let _ : OfNat Element 1 :=
      LandauOneOn natural_data.model
    let _ : Nonempty Element :=
      LandauNonemptyOn natural_data.model
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
theorem underlyingNaturalCommutativeSemiringWithoutZeroLawsOn :
    let _ : Add Element :=
      LandauAddOn natural_data.model
    let _ : Mul Element :=
      LandauMulOn natural_data.model
    let _ : OfNat Element 1 :=
      LandauOneOn natural_data.model
    let _ : Nonempty Element :=
      LandauNonemptyOn natural_data.model
    CommutativeSemiringWithoutZeroLaws Element := by
  sorry
/--
`zeroOn` TODO

Predicate logic:

  abbrev zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

Predicate logic (unfolded):

  abbrev zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩
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
abbrev zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

/--
`oneOn` TODO

Predicate logic:

  abbrev oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

Predicate logic (unfolded):

  abbrev oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩
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
abbrev oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

/--
`succOn` TODO

Predicate logic:

  abbrev succOn : HasSuccessor (Carrier natural_data) :=
    ⟨successor natural_data⟩

Predicate logic (unfolded):

  abbrev succOn : HasSuccessor (Carrier natural_data) :=
    ⟨successor natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩
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
abbrev succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

/--
`nonemptyOn` packages the distinguished `one` element as the witness required by semigroup-strength and stronger bundled interfaces.

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), Nonempty (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    Nonempty (Option Element)

Logical form (Lean):

```lean
theorem nonemptyOn : Nonempty (Carrier natural_data)
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
theorem nonemptyOn : Nonempty (Carrier natural_data) := by
  sorry
/--
`addOn` TODO

Predicate logic:

  noncomputable abbrev addOn : Add (Carrier natural_data) :=
    ⟨addition natural_data⟩

Predicate logic (unfolded):

  noncomputable abbrev addOn : Add (Carrier natural_data) :=
    ⟨addition natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩
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
noncomputable abbrev addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩

/--
`mulOn` TODO

Predicate logic:

  noncomputable abbrev mulOn : Mul (Carrier natural_data) :=
    ⟨multiplication natural_data⟩

Predicate logic (unfolded):

  noncomputable abbrev mulOn : Mul (Carrier natural_data) :=
    ⟨multiplication natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable abbrev mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩
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
noncomputable abbrev mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

/--
`ltOn` TODO

Predicate logic:

  abbrev ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

Predicate logic (unfolded):

  abbrev ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩
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
abbrev ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

/--
`leOn` TODO

Predicate logic:

  abbrev leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

Predicate logic (unfolded):

  abbrev leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩
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
abbrev leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

/--
`additiveSemigroupLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := ⋯; LRA.AlgebraicStructures.AdditiveSemigroupLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem additiveSemigroupLawsOn
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    AdditiveSemigroupLaws (Carrier natural_data)
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
theorem additiveSemigroupLawsOn
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    AdditiveSemigroupLaws (Carrier natural_data) := by
  sorry
/--
`additiveCommutativeLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.AdditiveCommutativeLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.AdditiveCommutativeLaws (Option Element)

Logical form (Lean):

```lean
theorem additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data)
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
theorem additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) := by
  sorry
/--
`additiveIdentityLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.AdditiveIdentityLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.AdditiveIdentityLaws (Option Element)

Logical form (Lean):

```lean
theorem additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data)
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
theorem additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) := by
  sorry
/--
`multiplicativeSemigroupLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_1 := ⋯; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_1 := ⋯; LRA.AlgebraicStructures.MultiplicativeSemigroupLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem multiplicativeSemigroupLawsOn
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    MultiplicativeSemigroupLaws (Carrier natural_data)
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
theorem multiplicativeSemigroupLawsOn
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    MultiplicativeSemigroupLaws (Carrier natural_data) := by
  sorry
/--
`multiplicativeCommutativeLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.MultiplicativeCommutativeLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.MultiplicativeCommutativeLaws (Option Element)

Logical form (Lean):

```lean
theorem multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data)
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
theorem multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) := by
  sorry
/--
`multiplicativeIdentityLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.MultiplicativeIdentityLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.MultiplicativeIdentityLaws (Option Element)

Logical form (Lean):

```lean
theorem multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data)
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
theorem multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) := by
  sorry
/--
`zeroAbsorbingLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.ZeroAbsorbingLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.ZeroAbsorbingLaws (Option Element)

Logical form (Lean):

```lean
theorem zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data)
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
theorem zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) := by
  sorry
/--
`nontrivialityLawOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.NontrivialityLaw (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.NontrivialityLaw (Option Element)

Logical form (Lean):

```lean
theorem nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data)
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
theorem nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) := by
  sorry
/--
`noZeroDivisorsLawOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.NoZeroDivisorsLaw (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.NoZeroDivisorsLaw (Option Element)

Logical form (Lean):

```lean
theorem noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data)
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
theorem noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) := by
  sorry
/--
`distributiveLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.AlgebraicStructures.DistributiveLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.AlgebraicStructures.DistributiveLaws (Option Element)

Logical form (Lean):

```lean
theorem distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
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
theorem distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) := by
  sorry
/--
`commutativeSemiringLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := ⋯; LRA.AlgebraicStructures.CommutativeSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem commutativeSemiringLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    CommutativeSemiringLaws (Carrier natural_data)
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
theorem commutativeSemiringLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    CommutativeSemiringLaws (Carrier natural_data) := by
  sorry
/--
`partialOrderLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.Order.PartialOrderLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.Order.PartialOrderLaws (Option Element)

Logical form (Lean):

```lean
theorem partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data)
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
theorem partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) := by
  sorry
/--
`totalOrderLawOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.Order.TotalOrderLaw (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.Order.TotalOrderLaw (Option Element)

Logical form (Lean):

```lean
theorem totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data)
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
theorem totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) := by
  sorry
/--
`additionRespectsOrderLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.Order.AdditionRespectsOrderLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.Order.AdditionRespectsOrderLaws (Option Element)

Logical form (Lean):

```lean
theorem additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data)
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
theorem additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) := by
  sorry
/--
`multiplicationRespectsOrderLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), LRA.Order.MultiplicationRespectsOrderLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    LRA.Order.MultiplicationRespectsOrderLaws (Option Element)

Logical form (Lean):

```lean
theorem multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
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
theorem multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) := by
  sorry
/--
`orderedSemiringLawsOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; have x_5 := ⋯; LRA.AlgebraicStructures.OrderedSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.mulOn natural_data; have x_2 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.zeroOn natural_data; have x_3 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.oneOn natural_data; have x_4 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; have x_5 := ⋯; LRA.AlgebraicStructures.OrderedSemiringLaws (LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data)

Logical form (Lean):

```lean
theorem orderedSemiringLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data)
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
theorem orderedSemiringLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data) := by
  sorry
/--
`quotientOrderedPairsAdditionCancellativeOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; ∀ (first second common : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), instHAdd.hAdd first common = instHAdd.hAdd second common → first = second

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; ∀ (first second common : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), instHAdd.hAdd first common = instHAdd.hAdd second common → first = second

Logical form (Lean):

```lean
theorem quotientOrderedPairsAdditionCancellativeOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    ∀ first second common : Carrier natural_data,
      first + common = second + common → first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem quotientOrderedPairsAdditionCancellativeOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    ∀ first second common : Carrier natural_data,
      first + common = second + common → first = second := by
  sorry
/--
`quotientOrderedPairsAdditionPreservesAndReflectsOrderOn` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; ∀ (first second translation : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), x_1.le (instHAdd.hAdd first translation) (instHAdd.hAdd second translation) ↔ x_1.le first second

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    have x := LRA.NumberSystems.WholeNumbers.Constructions.Landau.addOn natural_data; have x_1 := LRA.NumberSystems.WholeNumbers.Constructions.Landau.leOn natural_data; ∀ (first second translation : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), x_1.le (instHAdd.hAdd first translation) (instHAdd.hAdd second translation) ↔ x_1.le first second

Logical form (Lean):

```lean
theorem quotientOrderedPairsAdditionPreservesAndReflectsOrderOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    ∀ first second translation : Carrier natural_data,
      first + translation ≤ second + translation ↔
        first ≤ second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem quotientOrderedPairsAdditionPreservesAndReflectsOrderOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    ∀ first second translation : Carrier natural_data,
      first + translation ≤ second + translation ↔
        first ≤ second := by
  sorry
/--
`quotientOrderedPairsInput` TODO

Predicate logic:

  noncomputable def quotientOrderedPairsInput :
      LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

Predicate logic (unfolded):

  noncomputable def quotientOrderedPairsInput :
      LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotientOrderedPairsInput :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
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
noncomputable def quotientOrderedPairsInput :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs := by
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := leOn natural_data
  letI := nonemptyOn natural_data
  letI := commutativeSemiringLawsOn natural_data
  letI := partialOrderLawsOn natural_data
  exact
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs.ofCarrier
      (Carrier natural_data)
      (quotientOrderedPairsAdditionCancellativeOn natural_data)
      (quotientOrderedPairsAdditionPreservesAndReflectsOrderOn natural_data)

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
