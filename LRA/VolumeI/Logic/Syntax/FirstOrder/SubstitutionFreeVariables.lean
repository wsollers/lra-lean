import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariables
import LRA.VolumeI.Logic.Syntax.FirstOrder.Substitute

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Free-variable bounds for substitution.

Substitution can only keep variables already present in the original syntax
or introduce variables from the replacement term.
-/

theorem freeVariablesInTerm_substituteInTerm_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm originalTerm : Term S Variable) :
    freeVariablesInTerm (substituteInTerm replacedVariable replacementTerm originalTerm) ⊆
      freeVariablesInTerm originalTerm ∪ freeVariablesInTerm replacementTerm := by
  intro candidateVariable candidateVariableInSubstitutedTerm
  induction originalTerm with
  | var originalVariable =>
      by_cases originalVariableEqualsReplacedVariable : originalVariable = replacedVariable
      · subst originalVariable
        simp [substituteInTerm, freeVariablesInTerm, Finset.mem_union]
          at candidateVariableInSubstitutedTerm ⊢
        exact Or.inr candidateVariableInSubstitutedTerm
      · simp [substituteInTerm, originalVariableEqualsReplacedVariable,
          freeVariablesInTerm, Finset.mem_union]
          at candidateVariableInSubstitutedTerm ⊢
        exact Or.inl candidateVariableInSubstitutedTerm
  | const _ =>
      simp [substituteInTerm, freeVariablesInTerm] at candidateVariableInSubstitutedTerm
  | apply _ arguments inductionHypotheses =>
      simp [substituteInTerm, freeVariablesInTerm, Finset.mem_union]
        at candidateVariableInSubstitutedTerm ⊢
      rcases candidateVariableInSubstitutedTerm with
        ⟨argumentIndex, candidateVariableInSubstitutedArgument⟩
      have candidateVariableInOriginalOrReplacement :=
        inductionHypotheses argumentIndex candidateVariableInSubstitutedArgument
      simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
      rcases candidateVariableInOriginalOrReplacement with
        candidateVariableInOriginalArgument |
        candidateVariableInReplacementTerm
      · exact Or.inl ⟨argumentIndex, candidateVariableInOriginalArgument⟩
      · exact Or.inr candidateVariableInReplacementTerm

theorem freeVariables_substitute_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm : Term S Variable)
    (formula : Formula S Variable) :
    freeVariables (substitute replacedVariable replacementTerm formula) ⊆
      freeVariables formula ∪ freeVariablesInTerm replacementTerm := by
  intro candidateVariable candidateVariableInSubstitutedFormula
  induction formula with
  | relation _ arguments =>
      simp [substitute, freeVariables, Finset.mem_union]
        at candidateVariableInSubstitutedFormula ⊢
      rcases candidateVariableInSubstitutedFormula with
        ⟨argumentIndex, candidateVariableInSubstitutedArgument⟩
      have candidateVariableInOriginalOrReplacement :=
        freeVariablesInTerm_substituteInTerm_subset
          replacedVariable replacementTerm (arguments argumentIndex)
          candidateVariableInSubstitutedArgument
      simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
      rcases candidateVariableInOriginalOrReplacement with
        candidateVariableInOriginalArgument |
        candidateVariableInReplacementTerm
      · exact Or.inl ⟨argumentIndex, candidateVariableInOriginalArgument⟩
      · exact Or.inr candidateVariableInReplacementTerm
  | equal leftTerm rightTerm =>
      simp [substitute, freeVariables, Finset.mem_union]
        at candidateVariableInSubstitutedFormula ⊢
      rcases candidateVariableInSubstitutedFormula with
        candidateVariableInLeftTerm |
        candidateVariableInRightTerm
      · have candidateVariableInOriginalOrReplacement :=
          freeVariablesInTerm_substituteInTerm_subset
            replacedVariable replacementTerm leftTerm candidateVariableInLeftTerm
        simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
        rcases candidateVariableInOriginalOrReplacement with
          candidateVariableInOriginalLeftTerm |
          candidateVariableInReplacementTerm
        · exact Or.inl candidateVariableInOriginalLeftTerm
        · exact Or.inr (Or.inr candidateVariableInReplacementTerm)
      · have candidateVariableInOriginalOrReplacement :=
          freeVariablesInTerm_substituteInTerm_subset
            replacedVariable replacementTerm rightTerm candidateVariableInRightTerm
        simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
        rcases candidateVariableInOriginalOrReplacement with
          candidateVariableInOriginalRightTerm |
          candidateVariableInReplacementTerm
        · exact Or.inr (Or.inl candidateVariableInOriginalRightTerm)
        · exact Or.inr (Or.inr candidateVariableInReplacementTerm)
  | neg innerFormula inductionHypothesis =>
      simp [substitute, freeVariables, Finset.mem_union]
        at candidateVariableInSubstitutedFormula ⊢
      simpa [Finset.mem_union] using
        inductionHypothesis candidateVariableInSubstitutedFormula
  | impl hypothesis conclusion hypothesisInductionHypothesis conclusionInductionHypothesis =>
      simp [substitute, freeVariables, Finset.mem_union]
        at candidateVariableInSubstitutedFormula ⊢
      rcases candidateVariableInSubstitutedFormula with
        candidateVariableInHypothesis |
        candidateVariableInConclusion
      · have candidateVariableInOriginalOrReplacement :=
          hypothesisInductionHypothesis candidateVariableInHypothesis
        simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
        rcases candidateVariableInOriginalOrReplacement with
          candidateVariableInOriginalHypothesis |
          candidateVariableInReplacementTerm
        · exact Or.inl candidateVariableInOriginalHypothesis
        · exact Or.inr (Or.inr candidateVariableInReplacementTerm)
      · have candidateVariableInOriginalOrReplacement :=
          conclusionInductionHypothesis candidateVariableInConclusion
        simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
        rcases candidateVariableInOriginalOrReplacement with
          candidateVariableInOriginalConclusion |
          candidateVariableInReplacementTerm
        · exact Or.inr (Or.inl candidateVariableInOriginalConclusion)
        · exact Or.inr (Or.inr candidateVariableInReplacementTerm)
  | forallQ boundVariable body inductionHypothesis =>
      by_cases boundVariableEqualsReplacedVariable : boundVariable = replacedVariable
      · simp [substitute, boundVariableEqualsReplacedVariable, freeVariables,
          Finset.mem_union] at candidateVariableInSubstitutedFormula ⊢
        exact Or.inl candidateVariableInSubstitutedFormula
      · simp [substitute, boundVariableEqualsReplacedVariable, freeVariables,
          Finset.mem_union, Finset.mem_erase]
          at candidateVariableInSubstitutedFormula ⊢
        rcases candidateVariableInSubstitutedFormula with
          ⟨candidateVariableIsNotBoundVariable, candidateVariableInSubstitutedBody⟩
        have candidateVariableInOriginalOrReplacement :=
          inductionHypothesis candidateVariableInSubstitutedBody
        simp [Finset.mem_union] at candidateVariableInOriginalOrReplacement
        rcases candidateVariableInOriginalOrReplacement with
          candidateVariableInOriginalBody |
          candidateVariableInReplacementTerm
        · exact Or.inl ⟨candidateVariableIsNotBoundVariable, candidateVariableInOriginalBody⟩
        · exact Or.inr candidateVariableInReplacementTerm

end LRA.VolumeI.Logic.FirstOrder
