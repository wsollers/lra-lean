import LRA.VolumeI.Map.Fiber.Relationships
import LRA.VolumeI.Relations.Equivalence.EquivalenceClass
import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v w

/--
The kernel relation of any typed map is an equivalence relation.
-/
theorem KernelRelationEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation map) := by
  exact
    ⟨KernelRelationReflexive map,
      KernelRelationSymmetric map,
      KernelRelationTransitive map⟩

/--
The fiber over `map representative` is exactly the equivalence class of
`representative` for the kernel relation of `map`.
-/
theorem AmbientFiberEqualsKernelEquivalenceClass
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : TypedMap Domain Codomain)
    (representative : Domain) :
    AmbientFiber ambientDomain map (map representative) =
      LRA.Relation.EquivalenceClass
        ambientDomain (KernelRelation map) representative := by
  rfl

/--
Predicate fiber membership over `map representative` is the same as kernel
relatedness to `representative`.
-/
theorem FiberOverValueIffKernelRelated
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (representative input : Domain) :
    Fiber map (map representative) input <->
      KernelRelation map input representative := by
  rfl

/--
Kernel-related inputs have the same quotient projection under the kernel
relation.
-/
theorem KernelQuotientProjectionWellDefined
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.SeparationLaws Domain DomainSet]
    [LRA.Set.ExtensionalityLaw Domain DomainSet]
    {ambientDomain : DomainSet}
    (map : TypedMap Domain Codomain)
    {left right : Domain}
    (related : KernelRelation map left right) :
    LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) left =
      LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) right :=
  LRA.Relation.QuotientProjectionWellDefined
    (KernelRelationEquivalenceRelation map)
    related

end LRA.Map.Fiber
