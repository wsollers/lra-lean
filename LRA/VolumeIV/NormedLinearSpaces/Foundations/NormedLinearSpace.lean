import Mathlib.Analysis.Normed.Module.Basic
import LRA.VolumeIV.VectorSpaces.Foundations

/-!
Reference definitions for normed linear spaces.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's normed-space APIs directly.
-/

namespace LRA.VolumeIV.NormedLinearSpaces

universe u v


/-- Reference data for a normed linear space over a normed field.

Mathematical statement (Lean): `structure NormedLinearSpaceDefinition (K : Type u) [NormedField K] (V : Type v)`.


Logical form:

```lean
structure NormedLinearSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where
  /-- The underlying vector-space data. -/
  vectorSpace : LRA.VolumeIV.VectorSpaces.VectorSpaceDefinition K V
  /-- The norm. -/
  norm : V → Real
  /-- Norms are nonnegative. -/
  norm_nonneg : ∀ x : V, 0 ≤ norm x
  /-- The only vector with norm zero is the zero vector. -/
  norm_eq_zero : ∀ x : V, norm x = 0 ↔ x = vectorSpace.zero
  /-- The triangle inequality. -/
  triangle : ∀ x y : V, norm (vectorSpace.add x y) ≤ norm x + norm y
  /-- Compatibility of the norm with scalar multiplication. -/
  norm_smul : ∀ a : K, ∀ x : V, norm (vectorSpace.smul a x) = ‖a‖ * norm x
```
-/
structure NormedLinearSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where
  /-- The underlying vector-space data. -/
  vectorSpace : LRA.VolumeIV.VectorSpaces.VectorSpaceDefinition K V
  /-- The norm. -/
  norm : V → Real
  /-- Norms are nonnegative. -/
  norm_nonneg : ∀ x : V, 0 ≤ norm x
  /-- The only vector with norm zero is the zero vector. -/
  norm_eq_zero : ∀ x : V, norm x = 0 ↔ x = vectorSpace.zero
  /-- The triangle inequality. -/
  triangle : ∀ x y : V, norm (vectorSpace.add x y) ≤ norm x + norm y
  /-- Compatibility of the norm with scalar multiplication. -/
  norm_smul : ∀ a : K, ∀ x : V, norm (vectorSpace.smul a x) = ‖a‖ * norm x

end LRA.VolumeIV.NormedLinearSpaces

