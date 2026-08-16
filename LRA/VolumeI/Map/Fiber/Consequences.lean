import LRA.VolumeI.Map.Fiber.Relationships
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Relations.Equivalence.EquivalenceClass
import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.Map.Fiber

open scoped LRA.Set
open LRA.Map.Typed

universe u v w x

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
    (map : TypedMap Domain Codomain)
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
    (map : TypedMap Domain Codomain)
    {representative : Domain}
    (representativeInAmbient : representative ∈ ambientDomain) :
    KernelClassMapsTo
      ambientDomain
      map
      (LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) representative)
      (map representative) :=
  ⟨representative, representativeInAmbient, rfl, rfl⟩

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
    {map : TypedMap Domain Codomain}
    {classSet : DomainSet}
    {firstOutput secondOutput : Codomain}
    (firstMaps :
      KernelClassMapsTo ambientDomain map classSet firstOutput)
    (secondMaps :
      KernelClassMapsTo ambientDomain map classSet secondOutput) :
    firstOutput = secondOutput := by
  rcases firstMaps with
    ⟨firstRepresentative, firstInAmbient, firstClass, firstValue⟩
  rcases secondMaps with
    ⟨secondRepresentative, _secondInAmbient, secondClass, secondValue⟩
  have firstInOwnClass :
      firstRepresentative ∈
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) firstRepresentative := by
    change firstRepresentative ∈
      LRA.Relation.EquivalenceClass
        ambientDomain (KernelRelation map) firstRepresentative
    exact
      (LRA.Relation.EquivalenceClassMembershipIff
        ambientDomain
        (KernelRelation map)
        firstRepresentative
        firstRepresentative).mpr
        ⟨firstInAmbient, rfl⟩
  have firstInSecondClass :
      firstRepresentative ∈
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) secondRepresentative := by
    rw [← firstClass] at firstInOwnClass
    rw [secondClass] at firstInOwnClass
    exact firstInOwnClass
  have related :
      KernelRelation map firstRepresentative secondRepresentative := by
    have membership :=
      (LRA.Relation.EquivalenceClassMembershipIff
        ambientDomain
        (KernelRelation map)
        secondRepresentative
        firstRepresentative).mp firstInSecondClass
    exact membership.2
  calc
    firstOutput = map firstRepresentative := firstValue.symm
    _ = map secondRepresentative := related
    _ = secondOutput := secondValue

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
    (map : TypedMap Domain Codomain)
    {output : Codomain}
    (outputInRange :
      output ∈
        (LRA.Map.Image.Range map ambientDomain : CodomainSet)) :
    exists classSet : DomainSet,
      KernelClassMapsTo ambientDomain map classSet output := by
  unfold LRA.Map.Image.Range LRA.Map.Image.Image at outputInRange
  have rangeMembership :=
    (LRA.Set.SeparationMembership
      (𝒰 : CodomainSet)
      (fun candidate : Codomain =>
        exists input : Domain,
          input ∈ ambientDomain /\ map input = candidate)
      output).mp outputInRange
  rcases rangeMembership with
    ⟨_, representative, representativeInAmbient, mapsToOutput⟩
  exact
    ⟨LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) representative,
      representative,
      representativeInAmbient,
      rfl,
      mapsToOutput⟩

end LRA.Map.Fiber
