import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

/--
`Formula` TODO

Predicate logic:

  inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable

Predicate logic (unfolded):

  inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable
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
inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable

/--
`Formula.and` TODO

Predicate logic:

  def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

Predicate logic (unfolded):

  def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

/--
`Formula.existsQ` TODO

Predicate logic:

  def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

Predicate logic (unfolded):

  def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

end LRA.Logic.FirstOrder
