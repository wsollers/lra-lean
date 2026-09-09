import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity

universe u v w

/--
`IndexedOperationCongruence` TODO

Predicate logic:

  ∀ {Index : Type u} {Carrier : Type v} {Codomain : Type w} (operation : (Index → Carrier) → Codomain) {left right : Index → Carrier}, (∀ (index : Index), left index = right index) → operation left = operation right

Predicate logic (unfolded):

  ∀ {Index : Type u} {Carrier : Type v} {Codomain : Type w} (operation : (Index → Carrier) → Codomain) {left right : Index → Carrier}, (∀ (index : Index), left index = right index) → operation left = operation right

Logical form (Lean):

```lean
theorem IndexedOperationCongruence
    {Index : Type u} {Carrier : Type v} {Codomain : Type w}
    (operation : (Index → Carrier) → Codomain)
    {left right : Index → Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    operation left = operation right
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
theorem IndexedOperationCongruence
    {Index : Type u} {Carrier : Type v} {Codomain : Type w}
    (operation : (Index → Carrier) → Codomain)
    {left right : Index → Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    operation left = operation right := by
  sorry


/--
`AlgebraicStructure.interpretOperationCongruence` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) (symbol : signature.OperationSymbol) {left right : Fin (signature.arity symbol) → structure_.Carrier}, (∀ (index : Fin (signature.arity symbol)), left index = right index) → structure_.interpretOperation symbol left = structure_.interpretOperation symbol right

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) (symbol : signature.OperationSymbol) {left right : Fin (signature.arity symbol) → structure_.Carrier}, (∀ (index : Fin (signature.arity symbol)), left index = right index) → structure_.interpretOperation symbol left = structure_.interpretOperation symbol right

Logical form (Lean):

```lean
theorem AlgebraicStructure.interpretOperationCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    (symbol : signature.OperationSymbol)
    {left right : Fin (signature.arity symbol) → structure_.Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    structure_.interpretOperation symbol left =
      structure_.interpretOperation symbol right
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
theorem AlgebraicStructure.interpretOperationCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    (symbol : signature.OperationSymbol)
    {left right : Fin (signature.arity symbol) → structure_.Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    structure_.interpretOperation symbol left =
      structure_.interpretOperation symbol right := by
  sorry


end LRA.Identity
