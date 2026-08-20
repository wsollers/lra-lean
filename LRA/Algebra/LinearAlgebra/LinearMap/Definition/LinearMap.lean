import LRA.Algebra.LinearAlgebra.VectorSpace.Definition.VectorSpace

/-!
Linear-algebra reference structures.  The vector-space data is canonically
owned by the Volume IV orientation module; this later module adds only the
linear-map data instead of redeclaring the same vector-space family.
-/

namespace LRA.LinearAlgebra

universe u v w

/-- Reference data for a linear map between two pedagogical vector spaces. -/
structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where
  /-- The underlying function. -/
  toFun : V → W
  /-- The map preserves vector addition. -/
  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)
  /-- The map preserves scalar multiplication. -/
  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x)

end LRA.LinearAlgebra
