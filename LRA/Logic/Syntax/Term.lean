import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.FirstOrder

/--
`Term` TODO

Predicate logic:

  inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable

Predicate logic (unfolded):

  inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable
  deriving DecidableEq
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
inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable
  deriving DecidableEq

end LRA.Logic.FirstOrder
