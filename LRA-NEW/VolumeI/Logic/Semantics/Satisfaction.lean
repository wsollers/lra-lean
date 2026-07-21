import LRA.VolumeI.Logic.Core

namespace LRA.VolumeI.Logic.Semantics.Satisfaction

/-!
Formula-level Bool-valued satisfaction facts for object-language structures.
-/

theorem everyFormulaHasDeterminateTruthValue
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (formula : LogicalFormula L) :
    Or (evaluateFormula M formula = true) (evaluateFormula M formula = false) := by
  cases h : evaluateFormula M formula <;> simp [h]

theorem structureSatisfiesFormulaIffFormulaEvaluatesToTrue
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (formula : LogicalFormula L) :
    StructureSatisfiesFormula M formula ↔ evaluateFormula M formula = true := by
  rfl

end LRA.VolumeI.Logic.Semantics.Satisfaction
