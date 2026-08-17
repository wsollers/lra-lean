import LRA.VolumeI.Map.Fiber.Definition

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v w

/--
**[Theorem — KernelRelationReflexive]**

The kernel relation is reflexive.

Logical form:

```lean
theorem KernelRelationReflexive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall input : Domain, KernelRelation map input input
```
-/
theorem KernelRelationReflexive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall input : Domain, KernelRelation map input input := by
  intro input
  rfl
/--
**[Theorem — KernelRelationSymmetric]**

The kernel relation is symmetric.

Logical form:

```lean
theorem KernelRelationSymmetric
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall left right : Domain,
      KernelRelation map left right ->
      KernelRelation map right left
```
-/
theorem KernelRelationSymmetric
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall left right : Domain,
      KernelRelation map left right ->
      KernelRelation map right left := by
  intro left right related
  exact related.symm
/--
**[Theorem — KernelRelationTransitive]**

The kernel relation is transitive.

Logical form:

```lean
theorem KernelRelationTransitive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall first second third : Domain,
      KernelRelation map first second ->
      KernelRelation map second third ->
      KernelRelation map first third
```
-/
theorem KernelRelationTransitive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall first second third : Domain,
      KernelRelation map first second ->
      KernelRelation map second third ->
      KernelRelation map first third := by
  intro first second third firstRelatedSecond secondRelatedThird
  exact firstRelatedSecond.trans secondRelatedThird
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
    {map : TypedMap Domain Codomain}
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
    {map : TypedMap Domain Codomain}
    {output : Codomain}
    (isFiber : IsFiberOf fiberSet map output) :
    SaturatedBy fiberSet map := by
  intro input fiberMate inputInFiber inputRelatedFiberMate
  exact (isFiber fiberMate).2 (inputRelatedFiberMate ▸ (isFiber input).1 inputInFiber)
end LRA.Map.Fiber
