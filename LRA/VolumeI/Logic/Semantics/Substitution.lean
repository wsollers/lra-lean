import LRA.VolumeI.Logic.Semantics.Satisfaction
import LRA.VolumeI.Logic.Syntax.FirstOrder.Substitute

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Semantic substitution facts.

The syntactic substitution functions are total. Their expected semantic
meaning is valid under the capture-avoidance side condition recorded by
`IsSubstitutable`.
-/

/-- Evaluating a substituted term is the same as evaluating the original
term under the assignment where the substituted variable receives the value
of the replacement term. -/
theorem evaluateTerm_substituteInTerm_eq_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    (assignment : Variable -> M.Domain)
    (replacedVariable : Variable)
    (replacementTerm originalTerm : Term S Variable) :
    evaluateTerm M assignment
      (substituteInTerm replacedVariable replacementTerm originalTerm) =
        evaluateTerm M
          (updateAssignment assignment replacedVariable
            (evaluateTerm M assignment replacementTerm))
          originalTerm := by
  induction originalTerm with
  | var originalVariable =>
      by_cases h : originalVariable = replacedVariable
      · subst originalVariable
        simp [substituteInTerm, evaluateTerm, updateAssignment]
      · simp [substituteInTerm, evaluateTerm, updateAssignment, h]
  | const constantSymbol =>
      simp [substituteInTerm, evaluateTerm]
  | apply functionSymbol arguments inductionHypotheses =>
      simp [substituteInTerm, evaluateTerm]
      congr 1
      funext argumentIndex
      exact inductionHypotheses argumentIndex

/-- If two assignments agree on every free variable of a term, then the term
has the same value under both assignments. -/
theorem evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (term : Term S Variable)
    (assignmentsAgree :
      ∀ candidateVariable, candidateVariable ∈ freeVariablesInTerm term ->
        leftAssignment candidateVariable = rightAssignment candidateVariable) :
    evaluateTerm M leftAssignment term =
      evaluateTerm M rightAssignment term := by
  induction term with
  | var originalVariable =>
      exact assignmentsAgree originalVariable (by simp [freeVariablesInTerm])
  | const constantSymbol =>
      simp [evaluateTerm]
  | apply functionSymbol arguments inductionHypotheses =>
      simp [evaluateTerm]
      congr 1
      funext argumentIndex
      exact
        inductionHypotheses argumentIndex (by
          intro candidateVariable candidateVariableInArgument
          exact assignmentsAgree candidateVariable (by
            simp [freeVariablesInTerm]
            exact ⟨argumentIndex, candidateVariableInArgument⟩))

/-- If two assignments agree on every free variable of a formula, then they
give the same satisfaction value for that formula. -/
theorem satisfies_iff_of_agrees_on_freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (assignmentsAgree :
      ∀ candidateVariable, candidateVariable ∈ freeVariables formula ->
        leftAssignment candidateVariable = rightAssignment candidateVariable) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  sorry

/-- Semantic correctness of capture-avoiding formula substitution.

Under `IsSubstitutable formula replacedVariable replacementTerm`,
satisfying the syntactically substituted formula is equivalent to satisfying
the original formula under the assignment where `replacedVariable` receives
the value of `replacementTerm`. -/
theorem satisfies_substitute_iff_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S)
    (assignment : Variable -> M.Domain)
    (replacedVariable : Variable)
    (replacementTerm : Term S Variable)
    (formula : Formula S Variable)
    (captureAvoiding :
      IsSubstitutable formula replacedVariable replacementTerm) :
    Satisfies M assignment
      (substitute replacedVariable replacementTerm formula) ↔
        Satisfies M
          (updateAssignment assignment replacedVariable
            (evaluateTerm M assignment replacementTerm))
          formula := by
  sorry

end LRA.VolumeI.Logic.FirstOrder
