import Mathlib.Analysis.InnerProductSpace.Basic
import LRA.VolumeIV.NormedLinearSpaces.Foundations

/-!
Reference definitions for real inner product spaces.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's `InnerProductSpace` API directly.
-/

namespace LRA.VolumeIV.InnerProductSpaces

universe u


/-- Reference data for a real inner product space.

Mathematical statement (Lean): `structure RealInnerProductSpaceDefinition (V : Type u)`.


Logical form:

```lean
structure RealInnerProductSpaceDefinition (V : Type u) where
  /-- The underlying real vector-space data. -/
  vectorSpace : LRA.VolumeIV.VectorSpaces.VectorSpaceDefinition Real V
  /-- The inner product. -/
  inner : V → V → Real
  /-- Symmetry of the inner product. -/
  inner_symm : ∀ x y : V, inner x y = inner y x
  /-- Additivity in the first argument. -/
  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z
  /-- Homogeneity in the first argument. -/
  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y
  /-- Positivity of the quadratic form. -/
  inner_nonneg : ∀ x : V, 0 ≤ inner x x
  /-- Definiteness of the quadratic form. -/
  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero
```
-/
structure RealInnerProductSpaceDefinition (V : Type u) where
  /-- The underlying real vector-space data. -/
  vectorSpace : LRA.VolumeIV.VectorSpaces.VectorSpaceDefinition Real V
  /-- The inner product. -/
  inner : V → V → Real
  /-- Symmetry of the inner product. -/
  inner_symm : ∀ x y : V, inner x y = inner y x
  /-- Additivity in the first argument. -/
  inner_add_left :
    ∀ x y z : V, inner (vectorSpace.add x y) z = inner x z + inner y z
  /-- Homogeneity in the first argument. -/
  inner_smul_left :
    ∀ a : Real, ∀ x y : V, inner (vectorSpace.smul a x) y = a * inner x y
  /-- Positivity of the quadratic form. -/
  inner_nonneg : ∀ x : V, 0 ≤ inner x x
  /-- Definiteness of the quadratic form. -/
  inner_eq_zero : ∀ x : V, inner x x = 0 ↔ x = vectorSpace.zero

end LRA.VolumeIV.InnerProductSpaces

