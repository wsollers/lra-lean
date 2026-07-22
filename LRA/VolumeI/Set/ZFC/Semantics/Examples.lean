import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Model.Model
import LRA.VolumeI.Set.ZFC.Semantics.Satisfaction

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic.FirstOrder

/-!
ZFC semantics checkpoints.

These use a deliberately tiny non-ZFC structure whose membership relation
is always false. It is only a checkpoint for the encoding of `isMemberOf`
and for the well-formedness of the model-facing axiom predicates -- not a
model of the ZFC axioms.
-/

/-- A tiny test structure interpreting membership as always false. -/
def emptyMembershipTestModel : ZFCModel where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => False
  interpretConstant := Empty.elim

/-- Checkpoint: the basic-axioms satisfaction predicate is a well-formed
proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCBasicAxioms emptyMembershipTestModel

/-- Checkpoint: the Separation schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesSeparationSchema emptyMembershipTestModel

/-- Checkpoint: the ZFC-without-Replacement satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCAxiomsWithoutReplacement emptyMembershipTestModel

/-- Checkpoint: the Replacement schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesReplacementSchema emptyMembershipTestModel

/-- Checkpoint: the ZFC-without-Choice satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCAxiomsWithoutChoice emptyMembershipTestModel

/-- In the test structure with empty membership, variable `1` is not a
member of variable `0`, under any assignment. -/
theorem emptyMembershipTestModel_not_satisfies_one_isMemberOf_zero
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    ¬ satisfiesZFCFormula emptyMembershipTestModel assignment (isMemberOf 1 0) := by
  intro h
  exact h

end LRA.VolumeI.Set.ZFC
