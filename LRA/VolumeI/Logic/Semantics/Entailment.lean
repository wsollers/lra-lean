import LRA.VolumeI.Logic.Semantics.TheoryModels

namespace LRA.VolumeI.Logic.Semantics.Entailment

/-!
Semantic consequence for Bool-valued object-language theories.
-/

def TheorySemanticallyEntailsFormula
    {L : LogicalLanguage}
    (T : LogicalTheory L)
    (formula : LogicalFormula L) : Prop :=
  forall M : LogicalStructure L,
    StructureModelsTheory M T ->
    StructureSatisfiesFormula M formula

theorem formulaInTheoryIsSemanticallyEntailedByTheory
    {L : LogicalLanguage}
    (T : LogicalTheory L)
    (formula : LogicalFormula L)
    (formulaIsInTheory : formula ∈ T) :
    TheorySemanticallyEntailsFormula T formula := by
  intro M modelOfTheory
  exact modelOfTheory formula formulaIsInTheory

end LRA.VolumeI.Logic.Semantics.Entailment
