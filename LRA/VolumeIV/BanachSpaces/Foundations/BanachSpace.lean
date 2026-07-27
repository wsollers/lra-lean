import Mathlib.Topology.UniformSpace.Cauchy
import LRA.VolumeIV.NormedLinearSpaces.Foundations

/-!
Reference definitions for Banach spaces.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's `CompleteSpace` and normed-space APIs directly.
-/

namespace LRA.VolumeIV.BanachSpaces

universe u v

/-- Cauchy sequence predicate induced by reference normed-linear-space data. -/
def IsCauchySequence
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.VolumeIV.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
    space.norm (space.vectorSpace.add (sequence m) (space.vectorSpace.neg (sequence n))) < ε

/-- Convergence predicate induced by reference normed-linear-space data. -/
def ConvergesTo
    {K : Type u}
    [NormedField K]
    {V : Type v}
    (space : LRA.VolumeIV.NormedLinearSpaces.NormedLinearSpaceDefinition K V)
    (sequence : ℕ → V)
    (limit : V) : Prop :=
  ∀ ε : Real, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    space.norm (space.vectorSpace.add (sequence n) (space.vectorSpace.neg limit)) < ε

/-- Reference data for a Banach space. -/
structure BanachSpaceDefinition
    (K : Type u)
    [NormedField K]
    (V : Type v) where
  /-- The underlying normed linear space. -/
  normedLinearSpace : LRA.VolumeIV.NormedLinearSpaces.NormedLinearSpaceDefinition K V
  /-- Every Cauchy sequence converges. -/
  complete :
    ∀ sequence : ℕ → V,
      IsCauchySequence normedLinearSpace sequence →
      ∃ limit : V, ConvergesTo normedLinearSpace sequence limit

end LRA.VolumeIV.BanachSpaces

