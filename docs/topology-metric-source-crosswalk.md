# Volume IV Topology and Metric Source Crosswalk

This document records the first source-modeled definitions and theorems for the
Volume IV topology and metric-space reference modules.

The reference definitions are included for reader orientation. The theorem
statements are modeled against Mathlib's `TopologicalSpace` and `MetricSpace`
APIs, not against the reference structures.

## Topology

### Topology

- Lean file: `LRA/VolumeIV/Topology/TopologicalSpace.lean`
- Source: Willard, *General Topology*, Definition 3.1
- Book-modeled statement: A topology on a set `X` is a collection of subsets of
  `X`, called open sets, containing `X` and `∅`, closed under arbitrary unions,
  and closed under finite intersections.
- Lean declaration:

```lean
structure TopologyDefinition (X : Type u) where
  IsOpen : Set X → Prop
  isOpen_univ : IsOpen Set.univ
  isOpen_empty : IsOpen ∅
  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)
  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)
```

### Topological Space

- Lean file: `LRA/VolumeIV/Topology/TopologicalSpace.lean`
- Source: Willard, *General Topology*, Definition 3.1
- Book-modeled statement: A topological space is a pair `(X, τ)` consisting of a
  carrier set `X` and a topology `τ` on `X`.
- Lean declaration:

```lean
structure TopologicalSpaceDefinition where
  Carrier : Type u
  topology : TopologyDefinition Carrier
```

### Closed Set Axioms

- Lean file: `LRA/VolumeIV/Topology/TopologicalSpace.lean`
- Source: Willard, *General Topology*, Theorem 3.4
- Book-modeled statement: In a topological space, the closed sets include `X`
  and `∅`, are closed under arbitrary intersections, and are closed under finite
  unions.
- Lean declaration:

```lean
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    IsClosed (Set.univ : Set X) ∧
      IsClosed (∅ : Set X) ∧
      (∀ S : Set (Set X), (∀ C, C ∈ S → IsClosed C) → IsClosed (⋂₀ S)) ∧
      (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) := by
  sorry
```

### Topology From Closed Set Axioms

- Lean file: `LRA/VolumeIV/Topology/TopologicalSpace.lean`
- Source: Willard, *General Topology*, Theorem 3.4
- Book-modeled statement: Conversely, any family of subsets satisfying the
  closed-set axioms determines a topology whose closed sets are exactly that
  family.
- Lean declaration:

```lean
theorem topology_from_closed_set_axioms
    {X : Type u}
    (ClosedSet : Set X → Prop)
    (closed_univ : ClosedSet Set.univ)
    (closed_empty : ClosedSet ∅)
    (closed_sInter :
      ∀ S : Set (Set X), (∀ C, C ∈ S → ClosedSet C) → ClosedSet (⋂₀ S))
    (closed_union :
      ∀ C D : Set X, ClosedSet C → ClosedSet D → ClosedSet (C ∪ D)) :
    ∃ topology : TopologicalSpace X,
      ∀ C : Set X, @IsClosed X topology C ↔ ClosedSet C := by
  sorry
```

## Metric Spaces

### Metric

- Lean file: `LRA/VolumeIV/MetricSpaces/MetricSpace.lean`
- Source: Ó Searcóid, *Metric Spaces*, Definition 1.1.1
- Book-modeled statement: A metric on a set `X` is a real-valued function
  `d : X × X → ℝ` satisfying nonnegativity with equality exactly on the
  diagonal, symmetry, and the triangle inequality.
- Lean declaration:

```lean
structure MetricDefinition (X : Type u) where
  dist : X → X → Real
  positive : ∀ x y : X, 0 ≤ dist x y ∧ (dist x y = 0 ↔ x = y)
  symmetric : ∀ x y : X, dist x y = dist y x
  triangle : ∀ x y z : X, dist x z ≤ dist x y + dist y z
```

### Metric Space

- Lean file: `LRA/VolumeIV/MetricSpaces/MetricSpace.lean`
- Source: Ó Searcóid, *Metric Spaces*, Definition 1.1.1
- Book-modeled statement: A metric space is a pair `(X, d)` consisting of a
  carrier set `X` and a metric `d` on `X`.
- Lean declaration:

```lean
structure MetricSpaceDefinition where
  Carrier : Type u
  metric : MetricDefinition Carrier
```

### Rearrangement Of The Triangle Inequality

- Lean file: `LRA/VolumeIV/MetricSpaces/MetricSpace.lean`
- Source: Ó Searcóid, *Metric Spaces*, Theorem 1.1.2
- Book-modeled statement: For points `a`, `b`, and `c` in a metric space,
  `|d(a, b) - d(b, c)| ≤ d(a, c)`.
- Lean declaration:

```lean
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  sorry
```
