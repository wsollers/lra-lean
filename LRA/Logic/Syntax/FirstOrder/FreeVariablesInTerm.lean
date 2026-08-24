import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Union
import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

/--
`freeVariablesInTerm` TODO

Predicate logic:

  def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i))

Predicate logic (unfolded):

  def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i))

end LRA.Logic.FirstOrder
