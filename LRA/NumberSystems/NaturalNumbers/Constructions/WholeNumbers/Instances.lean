-- LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Instances.lean
-- Def-level machine and certificate builders for the whole-number carrier.

import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Laws
import LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Behavior

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

open LRA.AlgebraicStructures
open LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/-!
Volume II label: whole-numbers-instance-builders
Verification status: checked builders (certificates delegate to the
structure theorems, whose proofs remain pending)

`Carrier natural_data` is definitionally `Option Element` for *every*
choice of `natural_data`, so — exactly as with the one-based `PeanoSystem`
models `LandauAddOn` etc. build against — the operations can never be
global instances: the carrier type does not determine the model. The
builders below are `def`s for local activation (`letI := addOn natural_data`),
mirroring `LandauAddOn`. The certificate builders delegate to the components
of `additive_structure`, `semiring_structure`, and `ordered_semiring_structure`.
-/

/-! ## Machine builders -/

/-- `zeroOn` defines the displayed object for zero on. -/
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

/-- `oneOn` defines the displayed object for one on. -/
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

/-- `succOn` defines the displayed object for succ on. -/
def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

/-- `addOn` defines the displayed object for add on. -/
noncomputable def addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩

/-- `mulOn` defines the displayed object for mul on. -/
noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

/-- `ltOn` defines the displayed object for lt on. -/
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

/-- `leOn` defines the displayed object for le on. -/
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

/-! ## Certificate builders -/

/-- `additiveSemigroupLawsOn` defines the displayed object for additive semigroup laws on. -/
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1

/-- `additiveCommutativeLawsOn` defines the displayed object for additive commutative laws on. -/
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1

/-- `additiveIdentityLawsOn` defines the displayed object for additive identity laws on. -/
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)

/-- `multiplicativeSemigroupLawsOn` defines the displayed object for multiplicative semigroup laws on. -/
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1

/-- `multiplicativeCommutativeLawsOn` defines the displayed object for multiplicative commutative laws on. -/
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1

/-- `multiplicativeIdentityLawsOn` defines the displayed object for multiplicative identity laws on. -/
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)

/-- `zeroAbsorbingLawsOn` defines the displayed object for zero absorbing laws on. -/
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)

/-- `nontrivialityLawOn` defines the displayed object for nontriviality law on. -/
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm

/-- `noZeroDivisorsLawOn` defines the displayed object for no zero divisors law on. -/
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2

/-- Left distributivity delegates; the right form follows from
commutativity and stays on the proving queue. -/
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)

/-- `commutativeSemiringLawsOn` packages the whole-number arithmetic
certificates into the repository's canonical semiring bundle. -/
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

/-- `partialOrderLawsOn` packages the lifted non-strict order as a partial
order certificate. -/
noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data)

/-- `totalOrderLawOn` packages totality of the lifted non-strict order. -/
noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data)

/-- `additionRespectsOrderLawsOn` packages addition compatibility with the
lifted non-strict order. -/
noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry)

/-- `multiplicationRespectsOrderLawsOn` packages nonnegative-right-factor
order compatibility for the whole-number multiplication. -/
noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry)

/-- `orderedSemiringLawsOn` packages the whole-number arithmetic and order
certificates into the repository's canonical ordered-semiring bundle. -/
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

/-- Canonical adapter from the repaired whole-number owner surface into the
shared quotient-pairs integer input contract. -/
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

/-! ## Smoke test: local activation -/

example (a b : Carrier natural_data) : True := by
  letI := addOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
