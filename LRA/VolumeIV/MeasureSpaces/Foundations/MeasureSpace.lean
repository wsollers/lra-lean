import Mathlib.Data.ENNReal.Basic
import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
import LRA.VolumeIV.MeasurableSpaces.Foundations

/-!
Reference definitions for measure spaces.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's `Measure` and `MeasureSpace` APIs directly.
-/

namespace LRA.VolumeIV.MeasureSpaces

universe u

/-- Reference data for a measure on a fixed family of measurable sets.

The countable-additivity axiom is stated for pairwise disjoint sequences whose
union is measurable.

Mathematical statement (Lean): `structure MeasureDefinition (X : Type u) (measurableSets : LRA.VolumeIV.MeasurableSpaces.MeasurableSpaceDefinitionOn X)`.
-/
structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.VolumeIV.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where
  /-- The value of the measure on an arbitrary subset. -/
  measure : Set X → ENNReal
  /-- The empty set has measure zero. -/
  measure_empty : measure ∅ = 0
  /-- Countable additivity on disjoint measurable sequences. -/
  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n)


/-- Reference data for a measure space.

Mathematical statement (Lean): `structure MeasureSpaceDefinition`.
-/
structure MeasureSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The measurable sets on the carrier. -/
  measurableSets : LRA.VolumeIV.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier
  /-- The measure on the measurable space. -/
  measure : MeasureDefinition Carrier measurableSets

end LRA.VolumeIV.MeasureSpaces
