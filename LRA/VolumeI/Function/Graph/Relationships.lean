import LRA.VolumeI.Function.Graph.Theorems
import LRA.VolumeI.Function.Graph.Definition

namespace LRA.Function.Graph

open LRA.Function

universe u v

/--
**[Theorem — GraphSingleValued]**

The graph relation of a typed function is single-valued.

Logical form:

```lean
theorem GraphSingleValued
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    SingleValued (Graph map)
```
-/
theorem GraphSingleValued
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    SingleValued (Graph map) := by
  sorry
/--
**[Theorem — GraphTotalOverDomain]**

The graph relation of a typed function is total over the map's domain.

Logical form:

```lean
theorem GraphTotalOverDomain
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    TotalOverDomain (Graph map)
```
-/
theorem GraphTotalOverDomain
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    TotalOverDomain (Graph map) := by
  sorry
/--
**[Theorem — GraphFunctionalRelation]**

The graph relation of a typed function is functional.

Logical form:

```lean
theorem GraphFunctionalRelation
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    FunctionalRelation (Graph map)
```
-/
theorem GraphFunctionalRelation
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    FunctionalRelation (Graph map) := by
  sorry
end LRA.Function.Graph
