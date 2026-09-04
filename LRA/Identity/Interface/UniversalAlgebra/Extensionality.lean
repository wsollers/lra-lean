import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity

universe u v w

/--
`IndexedOperationCongruence` TODO

Predicate logic:

  (∀ index, left index = right index) → operation left = operation right

Predicate logic (unfolded):

  Ambient
    (Index, Carrier, Codomain)
  Objects
    operation : (Index → Carrier) → Codomain
    left right : Index → Carrier
  Prove
    (∀ (index : Index), left index = right index) → operation left = operation right

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

  (∀ symbol ∈ signature.OperationSymbol), (∀ index, left index = right index) → structure_.interpretOperation symbol left = structure_.interpretOperation symbol right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    signature : AlgebraicSignature.{v, w}
    structure_ : AlgebraicStructure.{u} signature
    symbol : signature.OperationSymbol
    left right : Fin (signature.arity symbol) → structure_.Carrier
  Prove
    (∀ (index : Fin (signature.2 symbol)), left index = right index) → structure_.3 symbol left = structure_.3 symbol right

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
