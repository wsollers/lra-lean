import LRA.VolumeI.Logic.Semantics.Substitution
import LRA.VolumeI.Logic.Syntax.FirstOrder.Sentence

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Semantics of closed first-order formulas.

Closed formulas have no free variables, so their satisfaction value is
independent of the assignment used to interpret variables.
-/

/-- Satisfaction of a closed formula is independent of the chosen
assignment. -/
theorem satisfies_iff_of_isClosedFormula
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (closedFormula : IsClosedFormula formula) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  apply satisfies_iff_of_agrees_on_freeVariables
  intro candidateVariable candidateVariableIsFree
  rw [closedFormula] at candidateVariableIsFree
  simp at candidateVariableIsFree

/-- Satisfaction of the underlying formula of a sentence is independent of
the chosen assignment. -/
theorem satisfies_sentence_iff
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (sentence : Sentence S Variable) :
    Satisfies M leftAssignment sentence.val ↔
      Satisfies M rightAssignment sentence.val :=
  satisfies_iff_of_isClosedFormula M sentence.val sentence.property

end LRA.VolumeI.Logic.FirstOrder
