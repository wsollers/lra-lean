import LRA.VolumeI.Map.Fiber.Relationships
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Relations.Equivalence.EquivalenceClass
import LRA.VolumeI.Relations.Equivalence.QuotientSet
import LRA.Function.Definition

namespace LRA.Map.Fiber

open scoped LRA.Set

universe u v w x

/--
The kernel relation of any typed map is an equivalence relation.
-/
theorem KernelRelationEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation map) := by
  sorry

/--
The fiber over `map representative` is exactly the equivalence class of
`representative` for the kernel relation of `map`.
-/
theorem AmbientFiberEqualsKernelEquivalenceClass
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.SeparationLaws Domain DomainSet]
    [LRA.Set.ExtensionalityLaw Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : LRA.Function Domain Codomain)
    (representative : Domain) :
    AmbientFiber ambientDomain map (map representative) =
      LRA.Relation.EquivalenceClass
        ambientDomain (KernelRelation map) representative := by
  sorry

/--
Predicate fiber membership over `map representative` is the same as kernel
relatedness to `representative`.
-/
theorem FiberOverValueIffKernelRelated
    {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (representative input : Domain) :
    Fiber map (map representative) input <->
      KernelRelation map input representative := by
  sorry

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
    (map : LRA.Function Domain Codomain)
    {left right : Domain}
    (related : KernelRelation map left right) :
    LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) left =
      LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) right := by
  sorry

/--
The relation-valued induced map from kernel classes to codomain values.

`KernelClassMapsTo ambient map classSet output` says that `classSet` is the
kernel class of some ambient representative and `output` is the map value of
that representative.
-/
def KernelClassMapsTo
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : LRA.Function Domain Codomain)
    (classSet : DomainSet)
    (output : Codomain) : Prop :=
  exists representative : Domain,
    representative ∈ ambientDomain /\
      classSet =
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) representative /\
        map representative = output

/--
Every ambient representative gives a class/value pair for the induced map.
-/
theorem KernelClassMapsTo.representative_value
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    {ambientDomain : DomainSet}
    (map : LRA.Function Domain Codomain)
    {representative : Domain}
    (representativeInAmbient : representative ∈ ambientDomain) :
    KernelClassMapsTo
      ambientDomain
      map
      (LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) representative)
      (map representative) := by
  sorry

/--
The induced map from kernel classes to codomain values is single-valued.
-/
theorem KernelClassMapsTo.output_unique
    {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.SeparationLaws Domain DomainSet]
    [LRA.Set.ExtensionalityLaw Domain DomainSet]
    {ambientDomain : DomainSet}
    {map : LRA.Function Domain Codomain}
    {classSet : DomainSet}
    {firstOutput secondOutput : Codomain}
    (firstMaps :
      KernelClassMapsTo ambientDomain map classSet firstOutput)
    (secondMaps :
      KernelClassMapsTo ambientDomain map classSet secondOutput) :
    firstOutput = secondOutput := by
  sorry

/--
The induced kernel-class map lands onto the represented range: every value in
the range has a kernel class mapping to it.
-/
theorem KernelClassMapsTo.exists_of_range_member
    {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w} {CodomainSet : Type x}
    [Membership Domain DomainSet]
    [Membership Codomain CodomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.HasSeparation Codomain CodomainSet]
    [LRA.Set.HasUniversal CodomainSet]
    [LRA.Set.SeparationLaws Codomain CodomainSet]
    {ambientDomain : DomainSet}
    (map : LRA.Function Domain Codomain)
    {output : Codomain}
    (outputInRange :
      output ∈
        (LRA.Map.Image.Range map ambientDomain : CodomainSet)) :
    exists classSet : DomainSet,
      KernelClassMapsTo ambientDomain map classSet output := by
  sorry

end LRA.Map.Fiber
