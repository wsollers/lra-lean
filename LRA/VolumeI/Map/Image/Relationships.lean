import LRA.VolumeI.Map.Image.Theorems
import LRA.VolumeI.Map.Image.Definition
import LRA.Function.Definition
import LRA.Function.Properties.Definition

namespace LRA.Map.Image

open LRA.Set

universe u₁ u₂ v₁ v₂

/--
**[Theorem — ImageContainsValueOfSourceMember]**

Members of the source map into any set satisfying the image predicate.

Logical form:

```lean
theorem ImageContainsValueOfSourceMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {input : DomainElement}
    (inputInSource : input ∈ source) :
    map input ∈ imageSet
```
-/
theorem ImageContainsValueOfSourceMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {input : DomainElement}
    (inputInSource : input ∈ source) :
    map input ∈ imageSet := by
  sorry
/--
**[Theorem — ExistsSourceMemberOfImageMember]**

Membership in an image predicate gives a source witness.

Logical form:

```lean
theorem ExistsSourceMemberOfImageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {output : CodomainElement}
    (outputInImage : output ∈ imageSet) :
    exists input : DomainElement, input ∈ source /\ map input = output
```
-/
theorem ExistsSourceMemberOfImageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {source : DomainSet}
    (isImage : IsImageOf imageSet map source)
    {output : CodomainElement}
    (outputInImage : output ∈ imageSet) :
    exists input : DomainElement, input ∈ source /\ map input = output := by
  sorry
/--
**[Theorem — SurjectiveOfImageCoversCodomain]**

If an image of an ambient source contains every codomain element, then the map
is surjective.

Logical form:

```lean
theorem SurjectiveOfImageCoversCodomain
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {ambientDomain : DomainSet}
    (isImage : IsImageOf imageSet map ambientDomain)
    (coversCodomain : forall output : CodomainElement, output ∈ imageSet) :
    LRA.Function.Surjective map
```
-/
theorem SurjectiveOfImageCoversCodomain
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {imageSet : CodomainSet}
    {map : LRA.Function DomainElement CodomainElement}
    {ambientDomain : DomainSet}
    (isImage : IsImageOf imageSet map ambientDomain)
    (coversCodomain : forall output : CodomainElement, output ∈ imageSet) :
    LRA.Function.Surjective map := by
  sorry
/--
**[Theorem — ImageWitnessUniqueOfInjective]**

For an injective map, two source witnesses for the same image member are equal.

Logical form:

```lean
theorem ImageWitnessUniqueOfInjective
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁}
    [Membership DomainElement DomainSet]
    {map : LRA.Function DomainElement CodomainElement}
    (injective : LRA.Function.Injective map)
    {source : DomainSet}
    {output : CodomainElement}
    {input₁ input₂ : DomainElement}
    (_firstInSource : input₁ ∈ source)
    (_secondInSource : input₂ ∈ source)
    (firstMaps : map input₁ = output)
    (secondMaps : map input₂ = output) :
    input₁ = input₂
```
-/
theorem ImageWitnessUniqueOfInjective
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁}
    [Membership DomainElement DomainSet]
    {map : LRA.Function DomainElement CodomainElement}
    (injective : LRA.Function.Injective map)
    {source : DomainSet}
    {output : CodomainElement}
    {input₁ input₂ : DomainElement}
    (_firstInSource : input₁ ∈ source)
    (_secondInSource : input₂ ∈ source)
    (firstMaps : map input₁ = output)
    (secondMaps : map input₂ = output) :
    input₁ = input₂ := by
  sorry
end LRA.Map.Image
