import LRA.Algebra.LinearAlgebra.VectorSpace.Definition.VectorSpace

namespace LRA.LinearAlgebra

universe u v w

/--
`LinearMapDefinition` TODO

Predicate logic:

  structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where

  toFun : V → W

  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)

  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x)

Predicate logic (unfolded):

  structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where

  toFun : V → W

  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)

  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where

  toFun : V → W

  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)

  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x)
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
structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where

  toFun : V → W

  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)

  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x)

end LRA.LinearAlgebra
