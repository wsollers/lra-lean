import LRA.VolumeI.Map.Graph.Theorems
import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

open LRA.Map.Typed

universe u v

/--
**[Theorem — GraphSingleValued]**

The graph relation of a typed map is single-valued.

Logical form:

```lean
theorem GraphSingleValued
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    SingleValued (Graph map)
```
-/
theorem GraphSingleValued
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    SingleValued (Graph map) := by
  intro input firstOutput secondOutput hFirst hSecond
  exact hFirst.symm.trans hSecond
/--
**[Theorem — GraphTotalOverDomain]**

The graph relation of a typed map is total over the map's domain.

Logical form:

```lean
theorem GraphTotalOverDomain
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    TotalOverDomain (Graph map)
```
-/
theorem GraphTotalOverDomain
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    TotalOverDomain (Graph map) := by
  intro input
  exact ⟨map input, rfl⟩
/--
**[Theorem — GraphFunctionalRelation]**

The graph relation of a typed map is functional.

Logical form:

```lean
theorem GraphFunctionalRelation
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    FunctionalRelation (Graph map)
```
-/
theorem GraphFunctionalRelation
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    FunctionalRelation (Graph map) := by
  exact ⟨GraphTotalOverDomain map, GraphSingleValued map⟩
end LRA.Map.Graph
