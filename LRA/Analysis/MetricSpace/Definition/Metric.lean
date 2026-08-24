import Mathlib.Data.Real.Basic

namespace LRA.Analysis.MetricSpace

universe u

/--
`MetricDefinition` TODO

Predicate logic:

  structure MetricDefinition (X : Type u) where

  distance : X → X → Real

  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)

  symmetric : ∀ x y : X, distance x y = distance y x

  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z

Predicate logic (unfolded):

  structure MetricDefinition (X : Type u) where

  distance : X → X → Real

  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)

  symmetric : ∀ x y : X, distance x y = distance y x

  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MetricDefinition (X : Type u) where

  distance : X → X → Real

  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)

  symmetric : ∀ x y : X, distance x y = distance y x

  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
structure MetricDefinition (X : Type u) where

  distance : X → X → Real

  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)

  symmetric : ∀ x y : X, distance x y = distance y x

  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z

end LRA.Analysis.MetricSpace
