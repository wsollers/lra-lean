import Mathlib.MeasureTheory.MeasurableSpace.Basic

/-!
Reference definitions for measurable spaces.

This module records textbook-level data for Volume IV orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's `MeasurableSpace` API directly.
-/

namespace LRA.Analysis.MeasureTheory.MeasurableSpaces

universe u

/-- Reference data for a measurable structure on a carrier type.

This is the usual sigma-algebra presentation: the measurable sets contain the
empty set and are closed under complements and countable unions.

Mathematical statement (Lean): `structure MeasurableSpaceDefinitionOn (X : Type u)`.


Logical form:

```lean
structure MeasurableSpaceDefinitionOn (X : Type u) where
  /-- The subsets declared measurable. -/
  IsMeasurable : Set X → Prop
  /-- The empty set is measurable. -/
  empty_mem : IsMeasurable ∅
  /-- Complements of measurable sets are measurable. -/
  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ
  /-- Countable unions of measurable sets are measurable, indexed by `ℕ`. -/
  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)
```
-/
structure MeasurableSpaceDefinitionOn (X : Type u) where
  /-- The subsets declared measurable. -/
  IsMeasurable : Set X → Prop
  /-- The empty set is measurable. -/
  empty_mem : IsMeasurable ∅
  /-- Complements of measurable sets are measurable. -/
  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ
  /-- Countable unions of measurable sets are measurable, indexed by `ℕ`. -/
  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)


/-- Reference data for a measurable space.

Mathematical statement (Lean): `structure MeasurableSpaceDefinition`.


Logical form:

```lean
structure MeasurableSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The measurable structure on the carrier. -/
  measurableSets : MeasurableSpaceDefinitionOn Carrier
```
-/
structure MeasurableSpaceDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The measurable structure on the carrier. -/
  measurableSets : MeasurableSpaceDefinitionOn Carrier

end LRA.Analysis.MeasureTheory.MeasurableSpaces

