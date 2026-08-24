import Mathlib.Data.ENNReal.Basic
import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
import LRA.Analysis.MeasureTheory.MeasurableSpace.Definition

namespace LRA.Analysis.MeasureTheory.MeasureSpaces

universe u

/--
`MeasureDefinition` TODO

Predicate logic:

  structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where

  measure : Set X → ENNReal

  measure_empty : measure ∅ = 0

  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n)

Predicate logic (unfolded):

  structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where

  measure : Set X → ENNReal

  measure_empty : measure ∅ = 0

  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where

  measure : Set X → ENNReal

  measure_empty : measure ∅ = 0

  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n)
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
structure MeasureDefinition
    (X : Type u)
    (measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn X) where

  measure : Set X → ENNReal

  measure_empty : measure ∅ = 0

  countably_additive :
    ∀ A : ℕ → Set X,
      (∀ n, measurableSets.IsMeasurable (A n)) →
      (∀ m n, m ≠ n → A m ∩ A n = ∅) →
      measurableSets.IsMeasurable (⋃ n, A n) →
      measure (⋃ n, A n) = ∑' n, measure (A n)

/--
`MeasureSpaceDefinition` TODO

Predicate logic:

  structure MeasureSpaceDefinition where

  Carrier : Type u

  measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier

  measure : MeasureDefinition Carrier measurableSets

Predicate logic (unfolded):

  structure MeasureSpaceDefinition where

  Carrier : Type u

  measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier

  measure : MeasureDefinition Carrier measurableSets (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MeasureSpaceDefinition where

  Carrier : Type u

  measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier

  measure : MeasureDefinition Carrier measurableSets
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure MeasureSpaceDefinition where

  Carrier : Type u

  measurableSets : LRA.Analysis.MeasureTheory.MeasurableSpaces.MeasurableSpaceDefinitionOn Carrier

  measure : MeasureDefinition Carrier measurableSets

end LRA.Analysis.MeasureTheory.MeasureSpaces
