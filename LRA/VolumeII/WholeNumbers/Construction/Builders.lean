-- LRA/VolumeII/WholeNumbers/Construction/Builders.lean
-- Def-level machine and certificate builders for the whole-number carrier.

import LRA.AlgebraicStructures
import LRA.VolumeII.WholeNumbers.Construction.Model

namespace LRA.NumberSystems.WholeNumbers

open LRA.AlgebraicStructures

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/-!
Volume II label: whole-numbers-instance-builders
Lean module: LRA.NumberSystems.WholeNumbers.Construction.Builders
Verification status: checked builders (certificates delegate to the
structure theorems, whose proofs remain pending)

`Carrier natural_data` is definitionally `Option Element` for *every*
choice of `natural_data`, so — exactly as with N-models — the
operations can never be global instances: the carrier type does not
determine the model. The builders below are `def`s for local
activation (`letI := addOn natural_data`), mirroring
`NModel.addOn`. The certificate builders delegate to the components of
`additive_structure`, `semiring_structure`, and
`ordered_semiring_structure`.
-/

/-! ## Machine builders -/

/--
`zeroOn` defines the displayed object for zero on.

Logical form:

```lean
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩
```
-/
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

/--
`oneOn` defines the displayed object for one on.

Logical form:

```lean
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩
```
-/
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

/--
`succOn` defines the displayed object for succ on.

Logical form:

```lean
def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩
```
-/
def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

/--
`addOn` defines the displayed object for add on.

Logical form:

```lean
noncomputable def addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩
```
-/
noncomputable def addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩

/--
`mulOn` defines the displayed object for mul on.

Logical form:

```lean
noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩
```
-/
noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

/--
`ltOn` defines the displayed object for lt on.

Logical form:

```lean
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩
```
-/
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

/--
`leOn` defines the displayed object for le on.

Logical form:

```lean
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩
```
-/
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

/-! ## Certificate builders -/

/--
`additiveSemigroupLawsOn` defines the displayed object for additive semigroup laws on.

Logical form:

```lean
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1
```
-/
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1

/--
`additiveCommutativeLawsOn` defines the displayed object for additive commutative laws on.

Logical form:

```lean
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1
```
-/
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1

/--
`additiveIdentityLawsOn` defines the displayed object for additive identity laws on.

Logical form:

```lean
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)
```
-/
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)

/--
`multiplicativeSemigroupLawsOn` defines the displayed object for multiplicative semigroup laws on.

Logical form:

```lean
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1
```
-/
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1

/--
`multiplicativeCommutativeLawsOn` defines the displayed object for multiplicative commutative laws on.

Logical form:

```lean
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1
```
-/
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1

/--
`multiplicativeIdentityLawsOn` defines the displayed object for multiplicative identity laws on.

Logical form:

```lean
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)
```
-/
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)

/--
`zeroAbsorbingLawsOn` defines the displayed object for zero absorbing laws on.

Logical form:

```lean
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)
```
-/
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)

/--
`nontrivialityLawOn` defines the displayed object for nontriviality law on.

Logical form:

```lean
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm
```
-/
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm

/--
`noZeroDivisorsLawOn` defines the displayed object for no zero divisors law on.

Logical form:

```lean
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2
```
-/
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2

/-- Left distributivity delegates; the right form follows from
commutativity and stays on the proving queue.

Logical form:

```lean
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)
```
-/
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)

/-! ## Smoke test: local activation -/

example (a b : Carrier natural_data) : True := by
  letI := addOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.WholeNumbers
