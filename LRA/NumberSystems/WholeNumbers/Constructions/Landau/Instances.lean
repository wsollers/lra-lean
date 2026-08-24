
import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Laws
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Behavior

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`zeroOn` TODO

Predicate logic:

  def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

Predicate logic (unfolded):

  def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩
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
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

/--
`oneOn` TODO

Predicate logic:

  def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

Predicate logic (unfolded):

  def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩
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
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

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
def succOn : HasSuccessor (Carrier natural_data) :=
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
def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

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
noncomputable def addOn : Add (Carrier natural_data) :=
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
noncomputable def addOn : Add (Carrier natural_data) :=
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
noncomputable def mulOn : Mul (Carrier natural_data) :=
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
noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

/--
`ltOn` TODO

Predicate logic:

  def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

Predicate logic (unfolded):

  def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩
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
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

/--
`leOn` TODO

Predicate logic:

  def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

Predicate logic (unfolded):

  def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩
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
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

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
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1
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
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1

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
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1
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
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1

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
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)
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
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)

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
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1
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
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1

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
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1
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
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1

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
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)
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
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)

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
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)
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
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)

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
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm
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
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm

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
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2
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
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2

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
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)
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
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)

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
noncomputable def commutativeSemiringLawsOn :
    @CommutativeSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) := by
  letI := additiveSemigroupLawsOn natural_data
  letI := additiveIdentityLawsOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  letI := multiplicativeSemigroupLawsOn natural_data
  letI := multiplicativeIdentityLawsOn natural_data
  letI := multiplicativeCommutativeLawsOn natural_data
  letI := zeroAbsorbingLawsOn natural_data
  letI := distributiveLawsOn natural_data
  infer_instance

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
noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data)
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
noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data)

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
noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data)
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
noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data)

/--
`additionRespectsOrderLawsOn` TODO

Predicate logic:

  noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry)

Predicate logic (unfolded):

  noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry)
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
noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry)

/--
`multiplicationRespectsOrderLawsOn` TODO

Predicate logic:

  noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry)

Predicate logic (unfolded):

  noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry)
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
noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry)

/--
`orderedSemiringLawsOn` TODO

Predicate logic:

  noncomputable def orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data)

Predicate logic (unfolded):

  noncomputable def orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data)
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
noncomputable def orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data) := by
  letI := commutativeSemiringLawsOn natural_data
  letI := partialOrderLawsOn natural_data
  letI := totalOrderLawOn natural_data
  letI := additionRespectsOrderLawsOn natural_data
  letI := multiplicationRespectsOrderLawsOn natural_data
  infer_instance

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
  letI := commutativeSemiringLawsOn natural_data
  letI := partialOrderLawsOn natural_data
  exact
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs.ofCarrier
      (Carrier natural_data)
      (by sorry)
      (by sorry)

example (a b : Carrier natural_data) : True := by
  letI := addOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
