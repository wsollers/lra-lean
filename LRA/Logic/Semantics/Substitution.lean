import LRA.Logic.Semantics.Satisfaction
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.Logic.Syntax.FirstOrder.Substitute

namespace LRA.Logic.FirstOrder

/--
`evaluateTerm_substituteInTerm_eq_update` TODO

Predicate logic:

  (∀ replacedVariable ∈ Variable), evaluateTerm M assignment (substituteInTerm replacedVariable replacementTerm originalTerm) = evaluateTerm M (updateAssignment assignment replacedVariable (evaluateTerm M assignment replacementTerm)) originalTerm

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1) (replacedVariable : Variable) (replacementTerm originalTerm : LRA.Logic.FirstOrder.Term S Variable), LRA.Logic.FirstOrder.evaluateTerm M assignment (LRA.Logic.FirstOrder.substituteInTerm replacedVariable replacementTerm originalTerm) = LRA.Logic.FirstOrder.evaluateTerm M (fun v' => Decidable.rec (fun h => (fun x => assignment v') h) (fun h => (fun x => LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm) h) (inst v' replacedVariable)) originalTerm

Logical form (Lean):

```lean
theorem evaluateTerm_substituteInTerm_eq_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
    (assignment : Variable -> M.Domain)
    (replacedVariable : Variable)
    (replacementTerm originalTerm : Term S Variable) :
    evaluateTerm M assignment
      (substituteInTerm replacedVariable replacementTerm originalTerm) =
        evaluateTerm M
          (updateAssignment assignment replacedVariable
            (evaluateTerm M assignment replacementTerm))
          originalTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem evaluateTerm_substituteInTerm_eq_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
    (assignment : Variable -> M.Domain)
    (replacedVariable : Variable)
    (replacementTerm originalTerm : Term S Variable) :
    evaluateTerm M assignment
      (substituteInTerm replacedVariable replacementTerm originalTerm) =
        evaluateTerm M
          (updateAssignment assignment replacedVariable
            (evaluateTerm M assignment replacementTerm))
          originalTerm := by
  sorry
/--
`evaluateTerm_eq_of_agrees_on_freeVariablesInTerm` TODO

Predicate logic:

  (∀ candidateVariable, candidateVariable ∈ freeVariablesInTerm term -> leftAssignment candidateVariable = rightAssignment candidateVariable) → evaluateTerm M leftAssignment term = evaluateTerm M rightAssignment term

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Interpretation S) {leftAssignment rightAssignment : Variable → M.1} (term : LRA.Logic.FirstOrder.Term S Variable), (∀ (candidateVariable : Variable), SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariablesInTerm term) candidateVariable → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.evaluateTerm M leftAssignment term = LRA.Logic.FirstOrder.evaluateTerm M rightAssignment term

Logical form (Lean):

```lean
theorem evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (term : Term S Variable)
    (assignmentsAgree :
      ∀ candidateVariable, candidateVariable ∈ freeVariablesInTerm term ->
        leftAssignment candidateVariable = rightAssignment candidateVariable) :
    evaluateTerm M leftAssignment term =
      evaluateTerm M rightAssignment term
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem evaluateTerm_eq_of_agrees_on_freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (term : Term S Variable)
    (assignmentsAgree :
      ∀ candidateVariable, candidateVariable ∈ freeVariablesInTerm term ->
        leftAssignment candidateVariable = rightAssignment candidateVariable) :
    evaluateTerm M leftAssignment term =
      evaluateTerm M rightAssignment term := by
  sorry
/--
`isSubstitutable_of_freeVariablesInTerm_not_mem_allVariables` TODO

Predicate logic:

  (∀ replacedVariable ∈ Variable), (∀ candidateVariable, candidateVariable ∈ freeVariablesInTerm replacementTerm -> candidateVariable ∉ allVariables formula) → IsSubstitutable formula replacedVariable replacementTerm

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (formula : LRA.Logic.FirstOrder.Formula S Variable) (replacedVariable : Variable) (replacementTerm : LRA.Logic.FirstOrder.Term S Variable), (∀ (candidateVariable : Variable), SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm) candidateVariable → SetLike.instMembership.1 (LRA.Logic.FirstOrder.allVariables formula) candidateVariable → False) → LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm

Logical form (Lean):

```lean
theorem isSubstitutable_of_freeVariablesInTerm_not_mem_allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable)
    (replacedVariable : Variable)
    (replacementTerm : Term S Variable)
    (replacementVariablesAreFresh :
      ∀ candidateVariable,
        candidateVariable ∈ freeVariablesInTerm replacementTerm ->
          candidateVariable ∉ allVariables formula) :
    IsSubstitutable formula replacedVariable replacementTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem isSubstitutable_of_freeVariablesInTerm_not_mem_allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (formula : Formula S Variable)
    (replacedVariable : Variable)
    (replacementTerm : Term S Variable)
    (replacementVariablesAreFresh :
      ∀ candidateVariable,
        candidateVariable ∈ freeVariablesInTerm replacementTerm ->
          candidateVariable ∉ allVariables formula) :
    IsSubstitutable formula replacedVariable replacementTerm := by
  sorry
/--
`satisfies_iff_of_agrees_on_freeVariables` TODO

Predicate logic:

  (∀ candidateVariable, candidateVariable ∈ freeVariables formula -> leftAssignment candidateVariable = rightAssignment candidateVariable) → Satisfies M leftAssignment formula ↔ Satisfies M rightAssignment formula

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Interpretation S) {leftAssignment rightAssignment : Variable → M.1} (formula : LRA.Logic.FirstOrder.Formula S Variable), (∀ (candidateVariable : Variable), SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables formula) candidateVariable → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

Logical form (Lean):

```lean
theorem satisfies_iff_of_agrees_on_freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
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
            evaluateTerm M rightAssignment rightTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem satisfies_iff_of_agrees_on_freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
    {leftAssignment rightAssignment : Variable -> M.Domain}
    (formula : Formula S Variable)
    (assignmentsAgree :
      ∀ candidateVariable, candidateVariable ∈ freeVariables formula ->
        leftAssignment candidateVariable = rightAssignment candidateVariable) :
    Satisfies M leftAssignment formula ↔
      Satisfies M rightAssignment formula := by
  sorry
/--
`satisfies_substitute_iff_update` TODO

Predicate logic:

  (∀ replacedVariable ∈ Variable), (IsSubstitutable formula replacedVariable replacementTerm) → Satisfies M assignment (substitute replacedVariable replacementTerm formula) ↔ Satisfies M (updateAssignment assignment replacedVariable (evaluateTerm M assignment replacementTerm)) formula

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (M : LRA.Logic.FirstOrder.Interpretation S) (assignment : Variable → M.1) (replacedVariable : Variable) (replacementTerm : LRA.Logic.FirstOrder.Term S Variable) (formula : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm → LRA.Logic.FirstOrder.Satisfies M assignment (LRA.Logic.FirstOrder.substitute replacedVariable replacementTerm formula) ↔ LRA.Logic.FirstOrder.Satisfies M (fun v' => Decidable.rec (fun h => (fun x => assignment v') h) (fun h => (fun x => LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm) h) (inst v' replacedVariable)) formula

Logical form (Lean):

```lean
theorem satisfies_substitute_iff_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
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
                    evaluateTerm M assignment replacementTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem satisfies_substitute_iff_update
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Interpretation S)
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
end LRA.Logic.FirstOrder
