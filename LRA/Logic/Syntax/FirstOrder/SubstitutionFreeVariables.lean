import LRA.Logic.Syntax.FirstOrder.FreeVariables
import LRA.Logic.Syntax.FirstOrder.Substitute

namespace LRA.Logic.FirstOrder

/--
`freeVariablesInTerm_substituteInTerm_subset` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = replacedVariable : Variable (replacementTerm originalTerm : LRA.Logic.FirstOrder.Term S Variable), Finset.instPartialOrder.le (LRA.Logic.FirstOrder.freeVariablesInTerm (LRA.Logic.FirstOrder.substituteInTerm replacedVariable replacementTerm originalTerm)) (Finset.LRA.Logic.FirstOrder.freeVariablesInTerm originalTerm ∪ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm)

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    replacedVariable : Variable
    replacementTerm originalTerm : Term S Variable
  Prove
    Finset.instPartialOrder.toPreorder.1.le (LRA.Logic.FirstOrder.freeVariablesInTerm (LRA.Logic.FirstOrder.substituteInTerm replacedVariable replacementTerm originalTerm)) (Finset.LRA.Logic.FirstOrder.freeVariablesInTerm originalTerm ∪ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm)

Logical form (Lean):

```lean
theorem freeVariablesInTerm_substituteInTerm_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm originalTerm : Term S Variable) :
    freeVariablesInTerm (substituteInTerm replacedVariable replacementTerm originalTerm) ⊆
      freeVariablesInTerm originalTerm ∪ freeVariablesInTerm replacementTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem freeVariablesInTerm_substituteInTerm_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm originalTerm : Term S Variable) :
    freeVariablesInTerm (substituteInTerm replacedVariable replacementTerm originalTerm) ⊆
      freeVariablesInTerm originalTerm ∪ freeVariablesInTerm replacementTerm := by
  sorry
/--
`freeVariables_substitute_subset` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = replacedVariable : Variable (replacementTerm : LRA.Logic.FirstOrder.Term S Variable) (formula : LRA.Logic.FirstOrder.Formula S Variable), Finset.instPartialOrder.le (LRA.Logic.FirstOrder.freeVariables (LRA.Logic.FirstOrder.substitute replacedVariable replacementTerm formula)) (Finset.LRA.Logic.FirstOrder.freeVariables formula ∪ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm)

Predicate logic (unfolded):

  Ambient
    (Variable)
  Objects
    S : Signature
    replacedVariable : Variable
    replacementTerm : Term S Variable
    formula : Formula S Variable
  Prove
    Finset.instPartialOrder.toPreorder.1.le (LRA.Logic.FirstOrder.freeVariables (LRA.Logic.FirstOrder.substitute replacedVariable replacementTerm formula)) (Finset.LRA.Logic.FirstOrder.freeVariables formula ∪ LRA.Logic.FirstOrder.freeVariablesInTerm replacementTerm)

Logical form (Lean):

```lean
theorem freeVariables_substitute_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm : Term S Variable)
    (formula : Formula S Variable) :
    freeVariables (substitute replacedVariable replacementTerm formula) ⊆
      freeVariables formula ∪ freeVariablesInTerm replacementTerm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem freeVariables_substitute_subset
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (replacedVariable : Variable) (replacementTerm : Term S Variable)
    (formula : Formula S Variable) :
    freeVariables (substitute replacedVariable replacementTerm formula) ⊆
      freeVariables formula ∪ freeVariablesInTerm replacementTerm := by
  sorry
end LRA.Logic.FirstOrder
