import LRA.Logic.Syntax.SecondOrder.Term

namespace LRA.Logic.SecondOrder

/--
`Formula` General second-order formulas with first-order quantification and quantification over relation and function variables of arbitrary finite arity.

Predicate logic:

  inductive Formula
      (S : Signature) (Variable : Type)
      (RelationVariable FunctionVariable : Nat → Type) where
    | relation :
        (r : S.RelationSymbol) →
        (Fin (S.relationArity r) → Term S Variable FunctionVariable) →
        Formula S Variable RelationVariable FunctionVariable
    | relationVar :
        {arity : Nat} →
        RelationVariable arity →
        (Fin arity → Term S Variable FunctionVariable) →
        Formula S Variable RelationVariable FunctionVariable
    | equal :
        Term S Variable FunctionVariable →
        Term S Variable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | neg :
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | impl :
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallQ :
        Variable →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallRel :
        {arity : Nat} →
        RelationVariable arity →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallFun :
        {arity : Nat} →
        FunctionVariable arity →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable

Predicate logic (unfolded):

  inductive Formula
      (S : Signature) (Variable : Type)
      (RelationVariable FunctionVariable : Nat → Type) where
    | relation :
        (r : S.RelationSymbol) →
        (Fin (S.relationArity r) → Term S Variable FunctionVariable) →
        Formula S Variable RelationVariable FunctionVariable
    | relationVar :
        {arity : Nat} →
        RelationVariable arity →
        (Fin arity → Term S Variable FunctionVariable) →
        Formula S Variable RelationVariable FunctionVariable
    | equal :
        Term S Variable FunctionVariable →
        Term S Variable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | neg :
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | impl :
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallQ :
        Variable →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallRel :
        {arity : Nat} →
        RelationVariable arity →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable
    | forallFun :
        {arity : Nat} →
        FunctionVariable arity →
        Formula S Variable RelationVariable FunctionVariable →
        Formula S Variable RelationVariable FunctionVariable (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Formula
    (S : Signature) (Variable : Type)
    (RelationVariable FunctionVariable : Nat → Type) where
  | relation :
      (r : S.RelationSymbol) →
      (Fin (S.relationArity r) → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | relationVar :
      {arity : Nat} →
      RelationVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | equal :
      Term S Variable FunctionVariable →
      Term S Variable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | neg :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | impl :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallQ :
      Variable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallRel :
      {arity : Nat} →
      RelationVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallFun :
      {arity : Nat} →
      FunctionVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
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
inductive Formula
    (S : Signature) (Variable : Type)
    (RelationVariable FunctionVariable : Nat → Type) where
  | relation :
      (r : S.RelationSymbol) →
      (Fin (S.relationArity r) → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | relationVar :
      {arity : Nat} →
      RelationVariable arity →
      (Fin arity → Term S Variable FunctionVariable) →
      Formula S Variable RelationVariable FunctionVariable
  | equal :
      Term S Variable FunctionVariable →
      Term S Variable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | neg :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | impl :
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallQ :
      Variable →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallRel :
      {arity : Nat} →
      RelationVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable
  | forallFun :
      {arity : Nat} →
      FunctionVariable arity →
      Formula S Variable RelationVariable FunctionVariable →
      Formula S Variable RelationVariable FunctionVariable

/--
`Formula.and` TODO

Predicate logic:

  def Formula.and
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      (φ ψ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.impl φ (Formula.neg ψ))

Predicate logic (unfolded):

  def Formula.and
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      (φ ψ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.impl φ (Formula.neg ψ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.and
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (φ ψ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
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

Related proof moves: intro, unfold

-/
def Formula.and
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (φ ψ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

/--
`Formula.existsQ` TODO

Predicate logic:

  def Formula.existsQ
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      (v : Variable) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallQ v (Formula.neg φ))

Predicate logic (unfolded):

  def Formula.existsQ
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      (v : Variable) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallQ v (Formula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.existsQ
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (v : Variable) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
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

Related proof moves: intro, unfold

-/
def Formula.existsQ
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    (v : Variable) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

/--
`Formula.existsRel` TODO

Predicate logic:

  def Formula.existsRel
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {arity : Nat}
      (X : RelationVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallRel X (Formula.neg φ))

Predicate logic (unfolded):

  def Formula.existsRel
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {arity : Nat}
      (X : RelationVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallRel X (Formula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.existsRel
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (X : RelationVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallRel X (Formula.neg φ))
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
def Formula.existsRel
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (X : RelationVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallRel X (Formula.neg φ))

/--
`Formula.existsFun` TODO

Predicate logic:

  def Formula.existsFun
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {arity : Nat}
      (F : FunctionVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallFun F (Formula.neg φ))

Predicate logic (unfolded):

  def Formula.existsFun
      {S : Signature} {Variable : Type}
      {RelationVariable FunctionVariable : Nat → Type}
      {arity : Nat}
      (F : FunctionVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
      Formula S Variable RelationVariable FunctionVariable :=
    Formula.neg (Formula.forallFun F (Formula.neg φ)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.existsFun
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (F : FunctionVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallFun F (Formula.neg φ))
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
def Formula.existsFun
    {S : Signature} {Variable : Type}
    {RelationVariable FunctionVariable : Nat → Type}
    {arity : Nat}
    (F : FunctionVariable arity) (φ : Formula S Variable RelationVariable FunctionVariable) :
    Formula S Variable RelationVariable FunctionVariable :=
  Formula.neg (Formula.forallFun F (Formula.neg φ))

end LRA.Logic.SecondOrder
