
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

/-- The whole-number Landau input package carries an underlying one-based
natural arithmetic surface, so its `model` can be reused directly as a
`CommutativeSemiringWithoutZeroLaws` witness on the Chapter I carrier. -/
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

  def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

Predicate logic (unfolded):

  def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩ (source fallback; no compiled unfold data available)

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

  def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

Predicate logic (unfolded):

  def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩ (source fallback; no compiled unfold data available)

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

  def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

Predicate logic (unfolded):

  def succOn : HasSuccessor (Carrier natural_data) :=
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
`nonemptyOn` packages the distinguished `one` element as the witness required
by semigroup-strength and stronger bundled interfaces.
-/
theorem nonemptyOn : Nonempty (Carrier natural_data) := by
  sorry
/--
`addOn` TODO

Predicate logic:

  noncomputable def addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩

Predicate logic (unfolded):

  noncomputable def addOn : Add (Carrier natural_data) :=
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

  noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

Predicate logic (unfolded):

  noncomputable def mulOn : Mul (Carrier natural_data) :=
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

  def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

Predicate logic (unfolded):

  def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩ (source fallback; no compiled unfold data available)

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

  def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

Predicate logic (unfolded):

  def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩ (source fallback; no compiled unfold data available)

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

  noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1

Predicate logic (unfolded):

  noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem additiveSemigroupLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    AdditiveSemigroupLaws (Carrier natural_data) := by
  letI : Add (Carrier natural_data) := addOn natural_data
  letI : Nonempty (Carrier natural_data) := nonemptyOn natural_data
  exact ⟨(additive_structure natural_data).1⟩
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

  noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1

Predicate logic (unfolded):

  noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) := by
  sorry
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

  noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)

Predicate logic (unfolded):

  noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) := by
  sorry
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

  noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1

Predicate logic (unfolded):

  noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem multiplicativeSemigroupLawsOn :
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    MultiplicativeSemigroupLaws (Carrier natural_data) := by
  letI : Mul (Carrier natural_data) := mulOn natural_data
  letI : Nonempty (Carrier natural_data) := nonemptyOn natural_data
  exact ⟨(semiring_structure natural_data).2.1⟩
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

  noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1

Predicate logic (unfolded):

  noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) := by
  sorry
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

  noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)

Predicate logic (unfolded):

  noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) := by
  sorry
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

  noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)

Predicate logic (unfolded):

  noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) := by
  sorry
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

  noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm

Predicate logic (unfolded):

  noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) := by
  sorry
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

  noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2

Predicate logic (unfolded):

  noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) := by
  sorry
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

  noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)

Predicate logic (unfolded):

  noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) := by
  sorry
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

  noncomputable def commutativeSemiringLawsOn :
    @CommutativeSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data)

Predicate logic (unfolded):

  noncomputable def commutativeSemiringLawsOn :
    @CommutativeSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def commutativeSemiringLawsOn :
    @CommutativeSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
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

  noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data)

Predicate logic (unfolded):

  noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  by
    sorry
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

  noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data)

Predicate logic (unfolded):

  noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  by
    sorry
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

  theorem additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) := by
  sorry

Predicate logic (unfolded):

  theorem additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) := by
  sorry (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) := by
  sorry
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

  theorem multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) := by
  sorry

Predicate logic (unfolded):

  theorem multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) := by
  sorry (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) := by
  sorry
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

  theorem orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data) := by
  sorry

Predicate logic (unfolded):

  theorem orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data) := by
  sorry (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem orderedSemiringLawsOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    let _ : Mul (Carrier natural_data) := mulOn natural_data
    let _ : OfNat (Carrier natural_data) 0 := zeroOn natural_data
    let _ : OfNat (Carrier natural_data) 1 := oneOn natural_data
    let _ : LE (Carrier natural_data) := leOn natural_data
    let _ : Nonempty (Carrier natural_data) := nonemptyOn natural_data
    OrderedSemiringLaws (Carrier natural_data) := by
  sorry
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
theorem quotientOrderedPairsAdditionCancellativeOn :
    let _ : Add (Carrier natural_data) := addOn natural_data
    ∀ first second common : Carrier natural_data,
      first + common = second + common → first = second := by
  sorry
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
