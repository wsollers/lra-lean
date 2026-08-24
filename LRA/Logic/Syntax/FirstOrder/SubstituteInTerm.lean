import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

/--
`substituteInTerm` TODO

Predicate logic:

  def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i))

Predicate logic (unfolded):

  def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i))
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
def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i))

end LRA.Logic.FirstOrder
