import LRA.Logic.Syntax.Term
import LRA.Logic.Semantics.Interpretation

namespace LRA.Logic.FirstOrder

/--
`evaluateTerm` TODO

Predicate logic:

  def evaluateTerm
    {S : Signature} {Variable : Type} (M : Interpretation S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i))

Predicate logic (unfolded):

  def evaluateTerm
    {S : Signature} {Variable : Type} (M : Interpretation S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def evaluateTerm
    {S : Signature} {Variable : Type} (M : Interpretation S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i))
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
def evaluateTerm
    {S : Signature} {Variable : Type} (M : Interpretation S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i))

end LRA.Logic.FirstOrder
