import LRA.VolumeI.Map.Fiber.Alias

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v w

/--
**[Theorem — FibreMembership]**

The British-spelled `Fibre` alias has the same membership condition as
`Fiber`.

Logical form:

```lean
theorem FibreMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fibre map output input <-> map input = output
```
-/
theorem FibreMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fibre map output input <-> map input = output := by
  sorry
/--
**[Theorem — LevelSetMembership]**

A level set is the fiber over the selected value.

Logical form:

```lean
theorem LevelSetMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    LevelSet map output input <-> map input = output
```
-/
theorem LevelSetMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    LevelSet map output input <-> map input = output := by
  sorry
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
  sorry
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
  sorry
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
  sorry
end LRA.Map.Fiber
