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
    [LRA.Set.SeparationLaws Domain DomainSet]
    [LRA.Set.ExtensionalityLaw Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : TypedMap Domain Codomain)
    (representative : Domain) :
    AmbientFiber ambientDomain map (map representative) =
      LRA.Relation.EquivalenceClass
        ambientDomain (KernelRelation map) representative := by
  apply LRA.Set.SetExtensionality
  intro input
  constructor
  · intro inputInFiber
    rcases
      (LRA.Set.SeparationMembership
        ambientDomain
        (fun input : Domain => map input = map representative)
        input).1 inputInFiber with
      ⟨inputInAmbient, inputMapsToRepresentativeValue⟩
    exact
      (LRA.Set.SeparationMembership
        ambientDomain
        (fun input : Domain => KernelRelation map input representative)
        input).2
        ⟨inputInAmbient, inputMapsToRepresentativeValue⟩
  · intro inputInClass
    rcases
      (LRA.Set.SeparationMembership
        ambientDomain
        (fun input : Domain => KernelRelation map input representative)
        input).1 inputInClass with
      ⟨inputInAmbient, inputKernelRelated⟩
    exact
      (LRA.Set.SeparationMembership
        ambientDomain
        (fun input : Domain => map input = map representative)
        input).2
        ⟨inputInAmbient, inputKernelRelated⟩

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
        ambientDomain (KernelRelation map) right := by
  exact
    LRA.Relation.QuotientProjectionWellDefined
      (KernelRelationEquivalenceRelation map) related

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
      (map representative) := by
  exact ⟨representative, representativeInAmbient, rfl, rfl⟩

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
    ⟨firstRepresentative,
      firstRepresentativeInAmbient,
      firstClassEq,
      firstValueEq⟩
  rcases secondMaps with
    ⟨secondRepresentative,
      _secondRepresentativeInAmbient,
      secondClassEq,
      secondValueEq⟩
  have projectedClassesEq :
      LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) firstRepresentative =
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) secondRepresentative :=
    firstClassEq.symm.trans secondClassEq
  have firstRepresentativeInOwnClass :
      firstRepresentative ∈
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) firstRepresentative := by
    exact
      (LRA.Set.SeparationMembership
        ambientDomain
        (fun candidate : Domain =>
          KernelRelation map candidate firstRepresentative)
        firstRepresentative).2
        ⟨firstRepresentativeInAmbient, rfl⟩
  have firstRepresentativeInSecondClass :
      firstRepresentative ∈
        LRA.Relation.QuotientProjection
          ambientDomain (KernelRelation map) secondRepresentative := by
    simpa [projectedClassesEq] using firstRepresentativeInOwnClass
  have representativesRelated :
      KernelRelation map firstRepresentative secondRepresentative := by
    exact
      ((LRA.Set.SeparationMembership
        ambientDomain
        (fun candidate : Domain =>
          KernelRelation map candidate secondRepresentative)
        firstRepresentative).1 firstRepresentativeInSecondClass).2
  calc
    firstOutput = map firstRepresentative := firstValueEq.symm
    _ = map secondRepresentative := representativesRelated
    _ = secondOutput := secondValueEq

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
  rcases
    (LRA.Set.SeparationMembership
      (𝒰 : CodomainSet)
      (fun output : Codomain =>
        exists input : Domain, input ∈ ambientDomain /\ map input = output)
      output).1 outputInRange with
    ⟨_, input, inputInAmbient, inputMapsToOutput⟩
  exact
    ⟨LRA.Relation.QuotientProjection
        ambientDomain (KernelRelation map) input,
      input,
      inputInAmbient,
      rfl,
      inputMapsToOutput⟩

end LRA.Map.Fiber
