import Mathlib.MeasureTheory.MeasurableSpace.Basic

namespace LRA.Analysis.MeasureTheory.MeasurableSpaces

universe u

/--
`MeasurableSpaceDefinitionOn` TODO

Predicate logic:

  structure MeasurableSpaceDefinitionOn (X : Type u) where

  IsMeasurable : Set X → Prop

  empty_mem : IsMeasurable ∅

  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ

  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)

Predicate logic (unfolded):

  structure MeasurableSpaceDefinitionOn (X : Type u) where

  IsMeasurable : Set X → Prop

  empty_mem : IsMeasurable ∅

  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ

  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MeasurableSpaceDefinitionOn (X : Type u) where

  IsMeasurable : Set X → Prop

  empty_mem : IsMeasurable ∅

  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ

  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)
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
structure MeasurableSpaceDefinitionOn (X : Type u) where

  IsMeasurable : Set X → Prop

  empty_mem : IsMeasurable ∅

  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ

  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)

/--
`MeasurableSpaceDefinition` TODO

Predicate logic:

  structure MeasurableSpaceDefinition where

  Carrier : Type u

  measurableSets : MeasurableSpaceDefinitionOn Carrier

Predicate logic (unfolded):

  structure MeasurableSpaceDefinition where

  Carrier : Type u

  measurableSets : MeasurableSpaceDefinitionOn Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MeasurableSpaceDefinition where

  Carrier : Type u

  measurableSets : MeasurableSpaceDefinitionOn Carrier
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
structure MeasurableSpaceDefinition where

  Carrier : Type u

  measurableSets : MeasurableSpaceDefinitionOn Carrier

end LRA.Analysis.MeasureTheory.MeasurableSpaces
