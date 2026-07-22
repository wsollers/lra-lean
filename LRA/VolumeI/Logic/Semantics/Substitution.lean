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
  induction formula generalizing leftAssignment rightAssignment with
  | relation relationSymbol arguments =>
      simp [Satisfies]
      have evaluatedArgumentsAgree :
          (fun argumentIndex =>
              evaluateTerm M leftAssignment (arguments argumentIndex)) =
            (fun argumentIndex =>
              evaluateTerm M rightAssignment (arguments argumentIndex)) := by
        funext argumentIndex
        exact
          evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
            M (arguments argumentIndex) (by
              intro candidateVariable candidateVariableInArgument
              exact assignmentsAgree candidateVariable (by
                simp [freeVariables]
                exact ⟨argumentIndex, candidateVariableInArgument⟩))
      rw [evaluatedArgumentsAgree]
  | equal leftTerm rightTerm =>
      simp [Satisfies]
      have leftTermEvaluationAgree :
          evaluateTerm M leftAssignment leftTerm =
            evaluateTerm M rightAssignment leftTerm :=
        evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
          M leftTerm (by
            intro candidateVariable candidateVariableInLeftTerm
            exact assignmentsAgree candidateVariable (by
              simp [freeVariables, candidateVariableInLeftTerm]))
      have rightTermEvaluationAgree :
          evaluateTerm M leftAssignment rightTerm =
            evaluateTerm M rightAssignment rightTerm :=
        evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
          M rightTerm (by
            intro candidateVariable candidateVariableInRightTerm
            exact assignmentsAgree candidateVariable (by
              simp [freeVariables, candidateVariableInRightTerm]))
      rw [leftTermEvaluationAgree, rightTermEvaluationAgree]
  | neg innerFormula inductionHypothesis =>
      simp [Satisfies]
      exact not_congr (inductionHypothesis assignmentsAgree)
  | impl hypothesis conclusion hypothesisInduction conclusionInduction =>
      simp [Satisfies]
      exact
        imp_congr
          (hypothesisInduction (by
            intro candidateVariable candidateVariableInHypothesis
            exact assignmentsAgree candidateVariable (by
              simp [freeVariables, candidateVariableInHypothesis])))
          (conclusionInduction (by
            intro candidateVariable candidateVariableInConclusion
            exact assignmentsAgree candidateVariable (by
              simp [freeVariables, candidateVariableInConclusion])))
  | forallQ boundVariable body inductionHypothesis =>
      simp [Satisfies]
      apply forall_congr'
      intro boundValue
      apply inductionHypothesis
      intro candidateVariable candidateVariableInBody
      by_cases candidateVariableEqualsBoundVariable :
          candidateVariable = boundVariable
      · subst candidateVariable
        simp [updateAssignment]
      · rw [
          differentVariableKeepsOldValue
            leftAssignment boundVariable candidateVariable boundValue
            candidateVariableEqualsBoundVariable,
          differentVariableKeepsOldValue
            rightAssignment boundVariable candidateVariable boundValue
            candidateVariableEqualsBoundVariable]
        exact assignmentsAgree candidateVariable (by
          simp [freeVariables, Finset.mem_erase,
            candidateVariableEqualsBoundVariable, candidateVariableInBody])

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
  induction formula generalizing assignment with
  | relation relationSymbol arguments =>
      simp [substitute, Satisfies]
      have evaluatedArgumentsAgree :
          (fun argumentIndex =>
              evaluateTerm M assignment
                (substituteInTerm replacedVariable replacementTerm
                  (arguments argumentIndex))) =
            (fun argumentIndex =>
              evaluateTerm M
                (updateAssignment assignment replacedVariable
                  (evaluateTerm M assignment replacementTerm))
                (arguments argumentIndex)) := by
        funext argumentIndex
        exact
          evaluateTerm_substituteInTerm_eq_update
            M assignment replacedVariable replacementTerm
            (arguments argumentIndex)
      rw [evaluatedArgumentsAgree]
  | equal leftTerm rightTerm =>
      simp [substitute, Satisfies]
      rw [
        evaluateTerm_substituteInTerm_eq_update
          M assignment replacedVariable replacementTerm leftTerm,
        evaluateTerm_substituteInTerm_eq_update
          M assignment replacedVariable replacementTerm rightTerm]
  | neg innerFormula inductionHypothesis =>
      simp [substitute, Satisfies]
      exact not_congr (inductionHypothesis assignment captureAvoiding)
  | impl hypothesis conclusion hypothesisInduction conclusionInduction =>
      simp [substitute, Satisfies, IsSubstitutable] at captureAvoiding ⊢
      exact
        imp_congr
          (hypothesisInduction assignment captureAvoiding.left)
          (conclusionInduction assignment captureAvoiding.right)
  | forallQ boundVariable body inductionHypothesis =>
      by_cases boundVariableEqualsReplacedVariable :
          boundVariable = replacedVariable
      · subst boundVariable
        simp [substitute]
        apply satisfies_iff_of_agrees_on_freeVariables
        intro candidateVariable candidateVariableInFormula
        have candidateVariableIsNotReplaced :
            candidateVariable ≠ replacedVariable := by
          have candidateVariableInErasedFreeVariables :
              candidateVariable ∈ (freeVariables body).erase replacedVariable := by
            simpa [freeVariables] using candidateVariableInFormula
          exact
            (Finset.mem_erase.mp candidateVariableInErasedFreeVariables).1
        simp [updateAssignment, candidateVariableIsNotReplaced]
      · have binderFreshIfNeeded :
            replacedVariable ∈
              freeVariables (Formula.forallQ boundVariable body) ->
              boundVariable ∉ freeVariablesInTerm replacementTerm :=
          captureAvoiding.left
        have bodyCaptureAvoiding :
            IsSubstitutable body replacedVariable replacementTerm :=
          captureAvoiding.right
        simp [substitute, boundVariableEqualsReplacedVariable, Satisfies]
        apply forall_congr'
        intro boundValue
        have bodySubstitution :=
          inductionHypothesis
            (updateAssignment assignment boundVariable boundValue)
            bodyCaptureAvoiding
        rw [bodySubstitution]
        apply satisfies_iff_of_agrees_on_freeVariables
        intro candidateVariable candidateVariableInBody
        by_cases candidateVariableEqualsBoundVariable :
            candidateVariable = boundVariable
        · subst candidateVariable
          simp [updateAssignment, boundVariableEqualsReplacedVariable]
        · by_cases candidateVariableEqualsReplacedVariable :
              candidateVariable = replacedVariable
          · subst candidateVariable
            have replacedVariableNotBoundVariable :
                replacedVariable ≠ boundVariable :=
              Ne.symm boundVariableEqualsReplacedVariable
            have replacedVariableFreeAcrossBinder :
                replacedVariable ∈
                  freeVariables (Formula.forallQ boundVariable body) := by
              simp [freeVariables, Finset.mem_erase,
                replacedVariableNotBoundVariable, candidateVariableInBody]
            have boundVariableNotInReplacement :
                boundVariable ∉ freeVariablesInTerm replacementTerm :=
              binderFreshIfNeeded replacedVariableFreeAcrossBinder
            have replacementTermValueUnchanged :
                evaluateTerm M
                  (updateAssignment assignment boundVariable boundValue)
                  replacementTerm =
                    evaluateTerm M assignment replacementTerm := by
              apply evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
              intro termVariable termVariableInReplacement
              by_cases termVariableEqualsBoundVariable :
                  termVariable = boundVariable
              · subst termVariable
                exact False.elim
                  (boundVariableNotInReplacement termVariableInReplacement)
              · simp [updateAssignment, termVariableEqualsBoundVariable]
            simp [updateAssignment, boundVariableEqualsReplacedVariable,
              replacedVariableNotBoundVariable, replacementTermValueUnchanged]
          · rw [
              differentVariableKeepsOldValue
                (updateAssignment assignment boundVariable boundValue)
                replacedVariable candidateVariable
                (evaluateTerm M
                  (updateAssignment assignment boundVariable boundValue)
                  replacementTerm)
                candidateVariableEqualsReplacedVariable,
              differentVariableKeepsOldValue
                (updateAssignment assignment replacedVariable
                  (evaluateTerm M assignment replacementTerm))
                boundVariable candidateVariable boundValue
                candidateVariableEqualsBoundVariable,
              differentVariableKeepsOldValue
                assignment boundVariable candidateVariable boundValue
                candidateVariableEqualsBoundVariable,
              differentVariableKeepsOldValue
                assignment replacedVariable candidateVariable
                (evaluateTerm M assignment replacementTerm)
                candidateVariableEqualsReplacedVariable]

end LRA.VolumeI.Logic.FirstOrder
