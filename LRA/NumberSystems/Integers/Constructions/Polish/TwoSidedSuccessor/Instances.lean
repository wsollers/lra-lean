-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Instances.lean
-- Machine and certificate instances for the two-sided successor integers.

import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Behavior
import LRA.NumberSystems.IntegerStructure
import LRA.Set.PredicateSet

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open LRA.AlgebraicStructures
open LRA.Order

/-!
Volume II label: integers-polish-instances
Lean module: LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Instances
Verification status: ring/successor certificates checked by delegation;
order certificates carry stated `sorry` gaps (see below)

This module registers `TwoSidedSuccessor.Z` as a carrier in the Volume I
algebraic-structures layer, replacing the retired bundled
`IntegerStructure`/`IntegerLaws` interface. Machines first (`OfNat`,
`Sub`, `HasSuccessor`, `HasPredecessor` -- `Add`, `Neg`, `Mul`, `LT`,
`LE` are registered where the operations are defined), then one
certificate instance per law family, each field delegating to the
theorem already proved in `TwoSidedSuccessor`/`LandauWorkup`.

Proving queue (certificates without a proved Polish lemma):
`LeTrans`, `LeTotal`, `LtIffLeNotLe`, `AddLeAddLeft`, `AddLeAddRight`,
`MulNonneg`, `SuccAperiodic` — each one step from an existing strict
(`<`) lemma via `le_iff` — plus `OneNeZero` (constructor disjointness),
`EqZeroOfMulEqZero`, and `NoStrictBetweenAddOne`.
-/

/-! ## Machines -/

instance : OfNat Z 0 := ⟨Z.zero⟩

instance : OfNat Z 1 := ⟨one⟩

instance : Sub Z := ⟨fun firstInteger secondInteger => firstInteger + -secondInteger⟩

instance : HasSuccessor Z := ⟨succ⟩

instance : HasPredecessor Z := ⟨pred⟩

/-! ## Additive certificates -/

instance : AdditiveSemigroupLaws Z := ⟨add_assoc⟩

instance : AdditiveCommutativeLaws Z := ⟨add_comm⟩

instance : AdditiveIdentityLaws Z := ⟨zero_add, add_zero⟩

instance : AdditiveInverseLaws Z := ⟨neg_add_self, add_neg_self⟩

instance : SubtractionCompatibilityLaw Z := ⟨fun _ _ => rfl⟩

/-! ## Multiplicative certificates -/

instance : MultiplicativeSemigroupLaws Z := ⟨mul_assoc⟩

instance : MultiplicativeCommutativeLaws Z := ⟨mul_comm⟩

instance : MultiplicativeIdentityLaws Z := ⟨one_mul, mul_pos_succZero⟩

instance : ZeroAbsorbingLaws Z := ⟨zero_mul, mul_zero⟩

instance : DistributiveLaws Z := ⟨distrib_left, distrib_right⟩

instance : NontrivialityLaw Z where
  OneNeZero := by sorry

instance : NoZeroDivisorsLaw Z where
  EqZeroOfMulEqZero := by sorry

/-! ## Order certificates -/

instance : PartialOrderLaws Z where
  LeRefl := le_refl
  LeAntisymm := fun _ _ firstLeSecond secondLeFirst =>
    le_antisymm firstLeSecond secondLeFirst
  LeTrans := by sorry

instance : TotalOrderLaw Z where
  LeTotal := by sorry

instance : StrictOrderCompatibilityLaw Z where
  LtIffLeNotLe := by sorry

instance : AdditionRespectsOrderLaws Z where
  AddLeAddLeft := by sorry
  AddLeAddRight := by sorry

instance : MultiplicationRespectsOrderLaws Z where
  MulNonneg := by sorry

instance : OrderDiscretenessLaw Z where
  NoStrictBetweenAddOne := by sorry

/-! ## Discreteness certificates -/

instance : SuccessorLaws Z where
  PredSucc := pred_succ
  SuccPred := succ_pred
  SuccInjective := fun _ _ successorEquality => succ_injective successorEquality
  PredInjective := fun _ _ predecessorEquality => pred_injective predecessorEquality

instance : SuccessorAdditionLaw Z :=
  ⟨fun integer => (add_one integer).symm⟩

instance : SuccessorMultiplicationLaws Z := ⟨mul_succ, mul_pred⟩

instance : DiscretenessLaw Z where
  SuccAperiodic := by sorry
  TwoSidedInduction := twoSidedInduction

/-! ## Smoke tests: bundles synthesize from the leaf certificates -/

example : CommutativeRingLaws Z := inferInstance
example : RingLaws Z := inferInstance
example : IntegralDomainLaws Z := inferInstance
example : LinearOrderLaws Z := inferInstance
example : OrderedRingLaws Z := inferInstance

example (a b : Z) : a * Succ b = a * b + a := MulSucc a b
example (a b c : Z) : a * (b + c) = a * b + a * c := LeftDistributive a b c
example (a : Z) : a - a = a + -a := SubEqAddNeg a a

/-! ## Realization: registration into the generic `IntegerStructure` interface

Per §1.6, layer 3's `Instances.lean` also registers into the generic
interface a construction realizes, not only into `LRA.AlgebraicStructures`.
Every field below already has a proved (or, for `aperiodic`, stated-`sorry`
above) component lemma; the *assembly* into this record is new work under
this migration's "state, never complete, new proof obligations" policy, so
the whole definition is `sorry` rather than composed field-by-field without
a toolchain to check the composition. Tracked in `Integers/ProofOrder.md`.
-/

/-- `TwoSidedSuccessor.Z` realizes the generic `IntegerStructure` interface,
backed by `PredicateSet Z` for the induction clause's subset quantifier. -/
noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.PredicateSet Z) := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
