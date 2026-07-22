import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Model.Model
import LRA.VolumeI.Set.ZFC.Semantics.AxiomReadings
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

/-- Checkpoint: the sentence-level basic-axioms satisfaction predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel

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

/-- Checkpoint: the cleaned ZFC-without-Replacement aggregate predicate is
a well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCAxiomsWithoutReplacementCleanly emptyMembershipTestModel

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

/-- Checkpoint: the cleaned ZFC-without-Choice aggregate predicate is a
well-formed proposition for a ZFC model. -/
example : Prop :=
  SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel

/-- In the test structure with empty membership, variable `1` is not a
member of variable `0`, under any assignment. -/
theorem emptyMembershipTestModel_not_satisfies_one_isMemberOf_zero
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    ¬ satisfiesZFCFormula emptyMembershipTestModel assignment (isMemberOf 1 0) := by
  intro h
  exact h

/-- Checkpoint: `zfcSetMembership` is the element-level membership relation
of a ZFC model. -/
example : Prop :=
  zfcSetMembership emptyMembershipTestModel () ()

/-- Checkpoint: satisfaction of an atomic membership formula bridges to
element-level model membership. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain)
    (x y : ZFCVariable) :
    satisfiesZFCFormula emptyMembershipTestModel assignment (isMemberOf x y) ↔
      zfcSetMembership
        emptyMembershipTestModel (assignment x) (assignment y) :=
  satisfies_isMemberOf_iff_zfcSetMembership
    emptyMembershipTestModel assignment x y

/-- Checkpoint: Extensionality has an element-level reading. -/
example
    (hBasicAxioms :
      SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel) :
    ∀ leftSet rightSet : emptyMembershipTestModel.Domain,
      (∀ element : emptyMembershipTestModel.Domain,
        zfcSetMembership emptyMembershipTestModel element leftSet ↔
          zfcSetMembership emptyMembershipTestModel element rightSet) ->
        leftSet = rightSet :=
  extensionalityAxiomReading hBasicAxioms

/-- Checkpoint: Pairing has an element-level reading. -/
example
    (hBasicAxioms :
      SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel) :
    ∀ leftSet rightSet : emptyMembershipTestModel.Domain,
      ∃ pairSet : emptyMembershipTestModel.Domain,
        ∀ element : emptyMembershipTestModel.Domain,
          zfcSetMembership emptyMembershipTestModel element pairSet ↔
            element = leftSet ∨ element = rightSet :=
  pairingAxiomReading hBasicAxioms

/-- Checkpoint: Union has an element-level reading. -/
example
    (hBasicAxioms :
      SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel) :
    ∀ family : emptyMembershipTestModel.Domain,
      ∃ unionSet : emptyMembershipTestModel.Domain,
        ∀ element : emptyMembershipTestModel.Domain,
          zfcSetMembership emptyMembershipTestModel element unionSet ↔
            ∃ memberSet : emptyMembershipTestModel.Domain,
              zfcSetMembership emptyMembershipTestModel memberSet family ∧
                zfcSetMembership emptyMembershipTestModel element memberSet :=
  unionAxiomReading hBasicAxioms

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

/-- Checkpoint: the extensionality axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel extensionalitySentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment extensionalityAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment extensionalitySentence

/-- Checkpoint: the empty set axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel emptySetSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment emptySetAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment emptySetSentence

/-- Checkpoint: the pairing axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel pairingSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment pairingAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment pairingSentence

/-- Checkpoint: the union axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel unionSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment unionAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment unionSentence

/-- Checkpoint: the power set axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel powerSetSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment powerSetAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment powerSetSentence

/-- Checkpoint: the foundation axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel foundationSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment foundationAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment foundationSentence

/-- Checkpoint: the infinity axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel infinitySentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment infinityAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment infinitySentence

/-- Checkpoint: the choice axiom sentence uses the assignment-free
sentence-satisfaction API. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    satisfiesZFCSentence emptyMembershipTestModel choiceSentence ↔
      satisfiesZFCFormula emptyMembershipTestModel assignment choiceAxiom :=
  satisfiesZFCSentence_iff_satisfiesZFCFormula
    emptyMembershipTestModel assignment choiceSentence

/-- Checkpoint: for the named basic ZFC axioms, satisfying one assignment
is equivalent to satisfying every assignment. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    SatisfiesZFCBasicAxioms emptyMembershipTestModel ↔
      SatisfiesZFCBasicAxiomsAt emptyMembershipTestModel assignment :=
  satisfiesZFCBasicAxioms_iff_at emptyMembershipTestModel assignment

/-- Checkpoint: the sentence-level named basic ZFC axiom predicate agrees
with the one-assignment basic-axiom predicate. -/
example
    (assignment : ZFCVariable -> emptyMembershipTestModel.Domain) :
    SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel ↔
      SatisfiesZFCBasicAxiomsAt emptyMembershipTestModel assignment :=
  satisfiesZFCBasicAxiomSentences_iff_at
    emptyMembershipTestModel assignment

/-- Checkpoint: the sentence-level named basic ZFC axiom predicate agrees
with the existing all-assignments basic-axiom predicate. -/
example :
    SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel ↔
      SatisfiesZFCBasicAxioms emptyMembershipTestModel :=
  satisfiesZFCBasicAxiomSentences_iff_basicAxioms
    emptyMembershipTestModel

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

/-- Checkpoint: the preferred clean aggregate for ZFC without Replacement
agrees with the existing formula-satisfaction aggregate. -/
example :
    SatisfiesZFCAxiomsWithoutReplacement emptyMembershipTestModel ↔
      SatisfiesZFCAxiomsWithoutReplacementCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutReplacement_iff_cleanly emptyMembershipTestModel

/-- Checkpoint: clean ZFC without Replacement projects to the named basic
axiom sentences. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutReplacementCleanly emptyMembershipTestModel) :
    SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutReplacementCleanly.basicAxiomSentences hAxioms

/-- Checkpoint: clean ZFC without Replacement projects to clean
Separation. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutReplacementCleanly emptyMembershipTestModel) :
    SatisfiesSeparationSchemaCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutReplacementCleanly.separation hAxioms

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

/-- Checkpoint: the preferred clean aggregate for ZFC without Choice agrees
with the existing formula-satisfaction aggregate. -/
example :
    SatisfiesZFCAxiomsWithoutChoice emptyMembershipTestModel ↔
      SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutChoice_iff_cleanly emptyMembershipTestModel

/-- Checkpoint: clean ZFC without Choice projects to the named basic axiom
sentences. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel) :
    SatisfiesZFCBasicAxiomSentences emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.basicAxiomSentences hAxioms

/-- Checkpoint: clean ZFC without Choice projects to clean Separation. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel) :
    SatisfiesSeparationSchemaCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.separation hAxioms

/-- Checkpoint: clean ZFC without Choice projects to clean Replacement. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel) :
    SatisfiesReplacementSchemaCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.replacement hAxioms

/-- Checkpoint: clean ZFC without Choice implies clean ZFC without
Replacement. -/
example
    (hAxioms :
      SatisfiesZFCAxiomsWithoutChoiceCleanly emptyMembershipTestModel) :
    SatisfiesZFCAxiomsWithoutReplacementCleanly emptyMembershipTestModel :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.withoutReplacement hAxioms

end LRA.VolumeI.Set.ZFC
