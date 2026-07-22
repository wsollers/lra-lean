import Mathlib.Tactic.Tauto
import LRA.VolumeI.Set.ZFC.Semantics.Satisfaction
import LRA.VolumeI.Set.ZFC.Theory.SchemaFacts

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Semantic readings of the ZFC axiom schemas.

The schema constructors in `Theory/Schemas.lean` are syntactic. This module
records the model-facing propositions they express, using the same internally
chosen auxiliary variables, and proves that satisfaction of each constructed
formula is equivalent to that intended reading.
-/

/-- The semantic membership relation expressed by the ZFC atom `x ∈ y`
under an assignment. -/
def zfcMembershipHolds
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (x y : ZFCVariable) : Prop :=
  satisfiesZFCFormula M assignment (isMemberOf x y)

theorem satisfies_andFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    satisfiesZFCFormula M assignment (andFormula φ ψ) ↔
      satisfiesZFCFormula M assignment φ ∧
        satisfiesZFCFormula M assignment ψ := by
  exact FirstOrder.satisfiesAndIffSatisfiesBoth M assignment φ ψ

theorem firstOrder_satisfies_andFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (andFormula φ ψ) ↔
      FirstOrder.Satisfies M assignment φ ∧
        FirstOrder.Satisfies M assignment ψ := by
  exact FirstOrder.satisfiesAndIffSatisfiesBoth M assignment φ ψ

theorem satisfies_existsVariable_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (v : ZFCVariable)
    (φ : ZFCFormula) :
    satisfiesZFCFormula M assignment (existsVariable v φ) ↔
      ∃ witness : M.Domain,
        satisfiesZFCFormula M
          (updateAssignment assignment v witness)
          φ := by
  exact FirstOrder.satisfiesExistsIffSomeWitness M assignment v φ

theorem firstOrder_satisfies_existsVariable_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (v : ZFCVariable)
    (φ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (existsVariable v φ) ↔
      ∃ witness : M.Domain,
        FirstOrder.Satisfies M
          (updateAssignment assignment v witness)
          φ := by
  exact FirstOrder.satisfiesExistsIffSomeWitness M assignment v φ

theorem satisfies_iffFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    satisfiesZFCFormula M assignment (iffFormula φ ψ) ↔
      (satisfiesZFCFormula M assignment φ ↔
        satisfiesZFCFormula M assignment ψ) := by
  change FirstOrder.Satisfies M assignment (iffFormula φ ψ) ↔
    (FirstOrder.Satisfies M assignment φ ↔
      FirstOrder.Satisfies M assignment ψ)
  rw [show iffFormula φ ψ = andFormula (impliesFormula φ ψ) (impliesFormula ψ φ) by rfl]
  rw [firstOrder_satisfies_andFormula_iff]
  simp only [impliesFormula, FirstOrder.Satisfies]
  tauto

theorem firstOrder_satisfies_iffFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (iffFormula φ ψ) ↔
      (FirstOrder.Satisfies M assignment φ ↔
        FirstOrder.Satisfies M assignment ψ) := by
  exact satisfies_iffFormula_iff M assignment φ ψ

/-- The model-facing reading of a generated Separation instance.

For every source set there is a subset whose elements are exactly the source
elements satisfying the predicate, under the assignment where the schema's
distinguished element variable is rebound to the candidate element. -/
def separationSchemaReading
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (elementVariable : ZFCVariable)
    (predicate : ZFCFormula) : Prop :=
  let sourceSet := SchemaFacts.separationSourceSet elementVariable predicate
  let subsetSet := SchemaFacts.separationSubsetSet elementVariable predicate
  ∀ source : M.Domain,
    ∃ subset : M.Domain,
      ∀ element : M.Domain,
        let elementAssignment :=
          updateAssignment
            (updateAssignment
              (updateAssignment assignment sourceSet source)
              subsetSet subset)
            elementVariable element
        zfcMembershipHolds M elementAssignment elementVariable subsetSet ↔
          zfcMembershipHolds M elementAssignment elementVariable sourceSet ∧
            satisfiesZFCFormula M elementAssignment predicate

/-- Satisfaction of a generated Separation formula is exactly the
model-facing Separation reading. -/
theorem satisfies_separationAxiomFor_iff_schemaReading
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (elementVariable : ZFCVariable)
    (predicate : ZFCFormula) :
    satisfiesZFCFormula M assignment
      (separationAxiomFor elementVariable predicate) ↔
        separationSchemaReading M assignment elementVariable predicate := by
  classical
  simp only [separationSchemaReading, SchemaFacts.separationSourceSet,
    SchemaFacts.separationSubsetSet, separationAxiomFor, satisfiesZFCFormula,
    forallVariable, zfcMembershipHolds, isMemberOf, FirstOrder.Satisfies,
    firstOrder_satisfies_existsVariable_iff, firstOrder_satisfies_iffFormula_iff,
    firstOrder_satisfies_andFormula_iff]

/-- The model-facing reading of a generated Replacement instance.

For every source set, if the predicate is single-valued on that source,
then there is an image set whose elements are exactly the outputs related by
the predicate to some source element. The functionality clause uses the same
renamed predicate and fresh output-prime variable as `replacementAxiomFor`. -/
def replacementSchemaReading
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (inputVariable outputVariable : ZFCVariable)
    (predicate : ZFCFormula) : Prop :=
  let sourceSet :=
    SchemaFacts.replacementSourceSet inputVariable outputVariable predicate
  let imageSet :=
    SchemaFacts.replacementImageSet inputVariable outputVariable predicate
  let outputVariable' :=
    SchemaFacts.replacementOutputVariablePrime inputVariable outputVariable predicate
  let renamedPredicate :=
    FirstOrder.substitute outputVariable (variableTerm outputVariable') predicate
  ∀ source : M.Domain,
    (∀ input : M.Domain,
      let inputAssignment :=
        updateAssignment
          (updateAssignment assignment sourceSet source)
          inputVariable input
      zfcMembershipHolds M inputAssignment inputVariable sourceSet ->
        ∀ output : M.Domain,
          ∀ output' : M.Domain,
            let outputPrimeAssignment :=
              updateAssignment
                (updateAssignment inputAssignment outputVariable output)
                outputVariable' output'
            satisfiesZFCFormula M outputPrimeAssignment predicate ∧
              satisfiesZFCFormula M outputPrimeAssignment renamedPredicate ->
                outputPrimeAssignment outputVariable =
                  outputPrimeAssignment outputVariable') ->
      ∃ image : M.Domain,
        ∀ output : M.Domain,
          let outputAssignment :=
            updateAssignment
              (updateAssignment assignment sourceSet source)
              imageSet image
          let imageElementAssignment :=
            updateAssignment outputAssignment outputVariable output
          zfcMembershipHolds M imageElementAssignment outputVariable imageSet ↔
            ∃ input : M.Domain,
              let inputAssignment :=
                updateAssignment imageElementAssignment inputVariable input
              zfcMembershipHolds M inputAssignment inputVariable sourceSet ∧
                satisfiesZFCFormula M inputAssignment predicate

/-- Satisfaction of a generated Replacement formula is exactly the
model-facing Replacement reading. -/
theorem satisfies_replacementAxiomFor_iff_schemaReading
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (inputVariable outputVariable : ZFCVariable)
    (predicate : ZFCFormula) :
    satisfiesZFCFormula M assignment
      (replacementAxiomFor inputVariable outputVariable predicate) ↔
        replacementSchemaReading M assignment inputVariable outputVariable predicate := by
  classical
  simp only [replacementSchemaReading, SchemaFacts.replacementSourceSet,
    SchemaFacts.replacementImageSet, SchemaFacts.replacementOutputVariablePrime,
    SchemaFacts.replacementBaseUsed, replacementAxiomFor, satisfiesZFCFormula,
    forallVariable, impliesFormula,
    zfcMembershipHolds, isMemberOf, isEqualTo, variableTerm,
    FirstOrder.Satisfies, firstOrder_satisfies_existsVariable_iff,
    firstOrder_satisfies_iffFormula_iff, firstOrder_satisfies_andFormula_iff,
    FirstOrder.evaluateTerm]

end LRA.VolumeI.Set.ZFC
