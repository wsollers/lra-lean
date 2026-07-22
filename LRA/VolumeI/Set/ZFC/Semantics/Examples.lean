import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Model.Model
import LRA.VolumeI.Set.ZFC.Semantics.ClosedAxioms
import LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness

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

/-- Checkpoint: the one-assignment basic-axioms satisfaction predicate is
a well-formed proposition for a ZFC model. -/
example (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) : Prop :=
  SatisfiesZFCBasicAxiomsAt emptyMembershipTestModel assignment

/-- Checkpoint: the Separation schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesSeparationSchema emptyMembershipTestModel

/-- Checkpoint: the cleaned Separation schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesSeparationSchemaCleanly emptyMembershipTestModel

/-- Checkpoint: the ZFC-without-Replacement satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCAxiomsWithoutReplacement emptyMembershipTestModel

/-- Checkpoint: the Replacement schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesReplacementSchema emptyMembershipTestModel

/-- Checkpoint: the cleaned Replacement schema satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesReplacementSchemaCleanly emptyMembershipTestModel

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

/-- Checkpoint: satisfaction of a named closed ZFC axiom is independent of
the variable assignment. -/
example
    (leftAssignment rightAssignment :
      ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCFormula emptyMembershipTestModel leftAssignment extensionalityAxiom ↔
      satisfiesZFCFormula emptyMembershipTestModel rightAssignment extensionalityAxiom :=
  extensionalityAxiom_satisfaction_assignment_independent
    emptyMembershipTestModel leftAssignment rightAssignment

/-- Checkpoint: the generic closed-ZFC-formula bridge applies to named
closed ZFC axioms. -/
example
    (leftAssignment rightAssignment :
      ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCFormula emptyMembershipTestModel leftAssignment emptySetAxiom ↔
      satisfiesZFCFormula emptyMembershipTestModel rightAssignment emptySetAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    emptyMembershipTestModel emptySetAxiom emptySetAxiom_isClosedFormula

/-- Checkpoint: for the named basic ZFC axioms, satisfying one assignment
is equivalent to satisfying every assignment. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    SatisfiesZFCBasicAxioms emptyMembershipTestModel ↔
      SatisfiesZFCBasicAxiomsAt emptyMembershipTestModel assignment :=
  satisfiesZFCBasicAxioms_iff_at emptyMembershipTestModel assignment

/-- Checkpoint: for the named basic ZFC axioms, satisfying some assignment
is equivalent to satisfying every assignment. -/
example :
    SatisfiesZFCBasicAxioms emptyMembershipTestModel ↔
      ∃ assignment : ZFCVariable -> emptyMembershipTestModel.Domain,
        SatisfiesZFCBasicAxiomsAt emptyMembershipTestModel assignment :=
  satisfiesZFCBasicAxioms_iff_exists_assignment emptyMembershipTestModel

/-- Checkpoint: the Separation schema reading is the preferred semantic
view of the generated Separation formula. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain)
    (elementVariable : ZFCVariable)
    (predicate : ZFCFormula) :
    satisfiesZFCFormula emptyMembershipTestModel assignment
      (separationAxiomFor elementVariable predicate) ↔
        separationSchemaReading
          emptyMembershipTestModel assignment elementVariable predicate :=
  satisfies_separationAxiomFor_iff_schemaReading
    emptyMembershipTestModel assignment elementVariable predicate

/-- Checkpoint: model-level Separation satisfaction is equivalent to the
semantic reading for every schema instance. -/
example :
    SatisfiesSeparationSchema emptyMembershipTestModel ↔
      SatisfiesSeparationSchemaCleanly emptyMembershipTestModel :=
  satisfiesSeparationSchema_iff_cleanReadings emptyMembershipTestModel

/-- Checkpoint: the cleaned Replacement reading is the preferred semantic
view of the generated Replacement formula. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain)
    (inputVariable outputVariable : ZFCVariable)
    (predicate : ZFCFormula) :
    satisfiesZFCFormula emptyMembershipTestModel assignment
      (replacementAxiomFor inputVariable outputVariable predicate) ↔
        replacementSchemaCleanReading
          emptyMembershipTestModel assignment inputVariable outputVariable
          predicate :=
  satisfies_replacementAxiomFor_iff_cleanReading
    emptyMembershipTestModel assignment inputVariable outputVariable predicate

/-- Checkpoint: model-level Replacement satisfaction is equivalent to the
cleaned semantic reading for every schema instance. -/
example :
    SatisfiesReplacementSchema emptyMembershipTestModel ↔
      SatisfiesReplacementSchemaCleanly emptyMembershipTestModel :=
  satisfiesReplacementSchema_iff_cleanReadings emptyMembershipTestModel

end LRA.VolumeI.Set.ZFC
