import LRA.Logic.Language.SecondOrder.Language

namespace LRA.Logic.SecondOrder

/--
`Term` Second-order terms extend first-order terms by allowing application of second-order function variables of arbitrary finite arity.

Predicate logic:

  inductive Term (S : Signature) (Variable : Type) (FunctionVariable : Nat → Type) where
    | var : Variable → Term S Variable FunctionVariable
    | const : S.Constants → Term S Variable FunctionVariable
    | apply :
        (f : S.FunctionSymbol) →
        (Fin (S.functionArity f) → Term S Variable FunctionVariable) →
        Term S Variable FunctionVariable
    | applyVar :
        {arity : Nat} →
        FunctionVariable arity →
        (Fin arity → Term S Variable FunctionVariable) →
        Term S Variable FunctionVariable

Predicate logic (unfolded):

  inductive Term (S : Signature) (Variable : Type) (FunctionVariable : Nat → Type) where
    | var : Variable → Term S Variable FunctionVariable
    | const : S.Constants → Term S Variable FunctionVariable
    | apply :
        (f : S.FunctionSymbol) →
        (Fin (S.functionArity f) → Term S Variable FunctionVariable) →
        Term S Variable FunctionVariable
    | applyVar :
        {arity : Nat} →
        FunctionVariable arity →
        (Fin arity → Term S Variable FunctionVariable) →
        Term S Variable FunctionVariable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Term (S : Signature) (Variable : Type) (FunctionVariable : Nat → Type) where
  | var : Variable → Term S Variable FunctionVariable
  | const : S.Constants → Term S Variable FunctionVariable
  | apply :
      (f : S.FunctionSymbol) →
      (Fin (S.functionArity f) → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable
  | applyVar :
      {arity : Nat} →
      FunctionVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable
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
inductive Term (S : Signature) (Variable : Type) (FunctionVariable : Nat → Type) where
  | var : Variable → Term S Variable FunctionVariable
  | const : S.Constants → Term S Variable FunctionVariable
  | apply :
      (f : S.FunctionSymbol) →
      (Fin (S.functionArity f) → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable
  | applyVar :
      {arity : Nat} →
      FunctionVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Term S Variable FunctionVariable

end LRA.Logic.SecondOrder
