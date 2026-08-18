import LRA.VolumeI.Map.Fiber.Definition
import LRA.Function.Definition

namespace LRA.Map.Fiber


universe u v w

/--
**[Theorem — KernelRelationReflexive]**

The kernel relation is reflexive.

Logical form:

```lean
theorem KernelRelationReflexive
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall input : Domain, KernelRelation map input input
```
-/
theorem KernelRelationReflexive
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall input : Domain, KernelRelation map input input := by
  sorry
/--
**[Theorem — KernelRelationSymmetric]**

The kernel relation is symmetric.

Logical form:

```lean
theorem KernelRelationSymmetric
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall left right : Domain,
      KernelRelation map left right ->
      KernelRelation map right left
```
-/
theorem KernelRelationSymmetric
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall left right : Domain,
      KernelRelation map left right ->
      KernelRelation map right left := by
  sorry
/--
**[Theorem — KernelRelationTransitive]**

The kernel relation is transitive.

Logical form:

```lean
theorem KernelRelationTransitive
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall first second third : Domain,
      KernelRelation map first second ->
      KernelRelation map second third ->
      KernelRelation map first third
```
-/
theorem KernelRelationTransitive
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    forall first second third : Domain,
      KernelRelation map first second ->
      KernelRelation map second third ->
      KernelRelation map first third := by
  sorry
/--
**[Theorem — FiberSaturatedByMap]**

Every fiber is saturated by the kernel relation of its map.

Logical form:

```lean
theorem FiberSaturatedByMap
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    {fiberSet : DomainSet}
    {map : LRA.Function Domain Codomain}
    {output : Codomain}
    (isFiber : IsFiberOf fiberSet map output) :
    SaturatedBy fiberSet map
```
-/
theorem FiberSaturatedByMap
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    {fiberSet : DomainSet}
    {map : LRA.Function Domain Codomain}
    {output : Codomain}
    (isFiber : IsFiberOf fiberSet map output) :
    SaturatedBy fiberSet map := by
  sorry
end LRA.Map.Fiber
