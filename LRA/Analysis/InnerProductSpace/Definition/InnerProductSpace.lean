import Mathlib.Analysis.InnerProductSpace.Basic
import LRA.Analysis.NormedLinearSpace.Definition

namespace LRA.Analysis.FunctionalAnalysis.InnerProductSpaces

universe u

/--
`RealInnerProductSpaceDefinition` TODO

Predicate logic:

  structure RealInnerProductSpaceDefinition (V : Type u) where

  vectorSpace : LRA.LinearAlgebra.VectorSpaceDefinition Real V

  inner : V → V → Real

  inner_symm : ∀ x y : V, inner x y = inner y x

  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z

  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y

  inner_nonneg : ∀ x : V, 0 ≤ inner x x

  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero

Predicate logic (unfolded):

  structure RealInnerProductSpaceDefinition (V : Type u) where

  vectorSpace : LRA.LinearAlgebra.VectorSpaceDefinition Real V

  inner : V → V → Real

  inner_symm : ∀ x y : V, inner x y = inner y x

  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z

  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y

  inner_nonneg : ∀ x : V, 0 ≤ inner x x

  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RealInnerProductSpaceDefinition (V : Type u) where

  vectorSpace : LRA.LinearAlgebra.VectorSpaceDefinition Real V

  inner : V → V → Real

  inner_symm : ∀ x y : V, inner x y = inner y x

  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z

  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y

  inner_nonneg : ∀ x : V, 0 ≤ inner x x

  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure RealInnerProductSpaceDefinition (V : Type u) where

  vectorSpace : LRA.LinearAlgebra.VectorSpaceDefinition Real V

  inner : V → V → Real

  inner_symm : ∀ x y : V, inner x y = inner y x

  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z

  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y

  inner_nonneg : ∀ x : V, 0 ≤ inner x x

  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero

end LRA.Analysis.FunctionalAnalysis.InnerProductSpaces
