import LRA.VolumeI.Map.Image.Theorems
import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Image

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

/--
Members of the source map into any set satisfying the image predicate.
-/
theorem ImageContainsValueOfSourceMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {input : DomainElement}
    (inputInSource : input ∈ source) :
    map input ∈ imageSet :=
  (isImage (map input)).mpr ⟨input, inputInSource, rfl⟩

/--
Membership in an image predicate gives a source witness.
-/
theorem ExistsSourceMemberOfImageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {output : CodomainElement}
    (outputInImage : output ∈ imageSet) :
    exists input : DomainElement, input ∈ source /\ map input = output :=
  (isImage output).mp outputInImage

/--
If an image of an ambient source contains every codomain element, then the map
is surjective.
-/
theorem SurjectiveOfImageCoversCodomain
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {ambientDomain : DomainSet}
    (isImage : IsImageOf imageSet map ambientDomain)
    (coversCodomain : forall output : CodomainElement, output ∈ imageSet) :
    LRA.Map.Surjective.Surjective map := by
  intro output
  obtain ⟨input, _inputInAmbient, mapsToOutput⟩ :=
    ExistsSourceMemberOfImageMember isImage (coversCodomain output)
  exact ⟨input, mapsToOutput⟩

/--
For an injective map, two source witnesses for the same image member are equal.
-/
theorem ImageWitnessUniqueOfInjective
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁}
    [Membership DomainElement DomainSet]
    {map : TypedMap DomainElement CodomainElement}
    (injective : LRA.Map.Injective.Injective map)
    {source : DomainSet}
    {output : CodomainElement}
    {input₁ input₂ : DomainElement}
    (_firstInSource : input₁ ∈ source)
    (_secondInSource : input₂ ∈ source)
    (firstMaps : map input₁ = output)
    (secondMaps : map input₂ = output) :
    input₁ = input₂ :=
  injective input₁ input₂ (firstMaps.trans secondMaps.symm)

end LRA.Map.Image
