import Mathlib.Topology.Basic

namespace LRA.Topology

universe u

/--
`TopologyDefinition` TODO

Predicate logic:

  structure TopologyDefinition (X : Type u) where

  IsOpen : Set X → Prop

  isOpen_univ : IsOpen Set.univ

  isOpen_empty : IsOpen ∅

  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)

  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)

Predicate logic (unfolded):

  structure TopologyDefinition (X : Type u) where

  IsOpen : Set X → Prop

  isOpen_univ : IsOpen Set.univ

  isOpen_empty : IsOpen ∅

  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)

  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V) (source fallback; no compiled unfold data available)

Logical form (Lean):

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
structure TopologyDefinition (X : Type u) where

  IsOpen : Set X → Prop

  isOpen_univ : IsOpen Set.univ

  isOpen_empty : IsOpen ∅

  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)

  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)

end LRA.Topology
