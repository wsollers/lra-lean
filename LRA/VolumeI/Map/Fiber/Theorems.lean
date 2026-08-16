import LRA.VolumeI.Map.Fiber.Alias

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v w

/--
The British-spelled `Fibre` alias has the same membership condition as
`Fiber`.
-/
theorem FibreMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    Fibre map output input <-> map input = output := by
  rfl

/--
A level set is the fiber over the selected value.
-/
theorem LevelSetMembership
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain)
    (input : Domain) :
    LevelSet map output input <-> map input = output := by
  rfl

/--
The kernel relation is reflexive.
-/
theorem KernelRelationReflexive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall input : Domain, KernelRelation map input input := by
  intro input
  rfl

/--
The kernel relation is symmetric.
-/
theorem KernelRelationSymmetric
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall left right : Domain,
      KernelRelation map left right ->
      KernelRelation map right left := by
  intro left right sameValue
  exact sameValue.symm

/--
The kernel relation is transitive.
-/
theorem KernelRelationTransitive
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    forall first second third : Domain,
      KernelRelation map first second ->
      KernelRelation map second third ->
      KernelRelation map first third := by
  intro first second third firstSecond secondThird
  exact firstSecond.trans secondThird

/--
Every fiber is saturated by the kernel relation of its map.
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
  intro input fiberMate inputInFiber sameValue
  exact (isFiber fiberMate).mpr (sameValue.symm.trans ((isFiber input).mp inputInFiber))

end LRA.Map.Fiber
