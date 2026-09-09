import LRA.Logic.Semantics.Satisfaction
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.Logic.Syntax.FirstOrder.Substitute

namespace LRA.Logic.FirstOrder

/--
`evaluateTerm_substituteInTerm_eq_update` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S (assignment : Variable → M.Domain) (replacedVariable : Variable) (replacementTerm originalTerm : LRA.Logic.FirstOrder.Term S Variable), LRA.Logic.FirstOrder.evaluateTerm M assignment (LRA.Logic.FirstOrder.substituteInTerm replacedVariable replacementTerm originalTerm) = LRA.Logic.FirstOrder.evaluateTerm M (LRA.Logic.updateAssignment assignment replacedVariable (LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm)) originalTerm

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    assignment : Variable -> M.Domain
    replacedVariable : Variable
    replacementTerm originalTerm : Term S Variable
  Prove
    LRA.Logic.FirstOrder.evaluateTerm M assignment (LRA.Logic.FirstOrder.substituteInTerm replacedVariable replacementTerm originalTerm) = LRA.Logic.FirstOrder.evaluateTerm M (fun v' => Decidable.rec (fun h => (fun x => assignment v') h) (fun h => (fun x => LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm) h) (inst v' replacedVariable)) originalTerm

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

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S {leftAssignment rightAssignment : Variable → M.Domain} (term : LRA.Logic.FirstOrder.Term S Variable), (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariablesInTerm term → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.evaluateTerm M leftAssignment term = LRA.Logic.FirstOrder.evaluateTerm M rightAssignment term

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    leftAssignment rightAssignment : Variable -> M.Domain
    term : Term S Variable
  Prove
    (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariablesInTerm term → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.evaluateTerm M leftAssignment term = LRA.Logic.FirstOrder.evaluateTerm M rightAssignment term

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

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = formula : LRA.Logic.FirstOrder.Formula S Variable (replacedVariable : Variable) (replacementTerm : LRA.Logic.FirstOrder.Term S Variable), (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm → ¬ SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.allVariables formula) → LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    formula : Formula S Variable
    replacedVariable : Variable
    replacementTerm : Term S Variable
  Prove
    (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm → SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.allVariables formula → False) → LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm

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

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S {leftAssignment rightAssignment : Variable → M.Domain} (formula : LRA.Logic.FirstOrder.Formula S Variable), (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariables formula → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    leftAssignment rightAssignment : Variable -> M.Domain
    formula : Formula S Variable
  Prove
    (∀ (candidateVariable : Variable), SetLike.candidateVariable ∈ LRA.Logic.FirstOrder.freeVariables formula → leftAssignment candidateVariable = rightAssignment candidateVariable) → LRA.Logic.FirstOrder.Satisfies M leftAssignment formula ↔ LRA.Logic.FirstOrder.Satisfies M rightAssignment formula

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
      Satisfies M rightAssignment formula
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

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = M : LRA.Logic.FirstOrder.Interpretation S (assignment : Variable → M.Domain) (replacedVariable : Variable) (replacementTerm : LRA.Logic.FirstOrder.Term S Variable) (formula : LRA.Logic.FirstOrder.Formula S Variable), LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm → LRA.Logic.FirstOrder.Satisfies M assignment (LRA.Logic.FirstOrder.substitute replacedVariable replacementTerm formula) ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment replacedVariable (LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm)) formula

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    M : Interpretation S
    assignment : Variable -> M.Domain
    replacedVariable : Variable
    replacementTerm : Term S Variable
    formula : Formula S Variable
  Prove
    LRA.Logic.FirstOrder.IsSubstitutable formula replacedVariable replacementTerm → LRA.Logic.FirstOrder.Satisfies M assignment (LRA.Logic.FirstOrder.substitute replacedVariable replacementTerm formula) ↔ LRA.Logic.FirstOrder.Satisfies M (LRA.Logic.updateAssignment assignment replacedVariable (LRA.Logic.FirstOrder.evaluateTerm M assignment replacementTerm)) formula

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
          formula
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
