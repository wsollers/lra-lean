import LRA.VolumeI.Map.Image.Definition

namespace LRA.Map.Image

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

section Image

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]
variable [HasComplement CodomainSet]
variable [SeparationLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]

/--
Membership in the constructed direct image is exactly being hit by a source
member.
-/
theorem ImageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) <->
      exists input : DomainElement, input ∈ source /\ map input = output := by
  sorry

section SetOperations

variable [Union DomainSet] [Inter DomainSet] [SDiff DomainSet]
variable [EmptyCollection DomainSet] [HasSubset DomainSet]
variable [Union CodomainSet] [Inter CodomainSet] [SDiff CodomainSet]
variable [EmptyCollection CodomainSet] [HasSubset CodomainSet]
variable [ExtensionalityLaw CodomainElement CodomainSet]
variable [MembershipLaws DomainElement DomainSet]
variable [MembershipLaws CodomainElement CodomainSet]

/--
Direct image distributes over binary union.
-/
theorem ImageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∪ right) : CodomainSet) =
      Image map left ∪ Image map right := by
  sorry

/--
The image of an intersection is contained in the intersection of the images.
-/
theorem ImageIntersectionSubsetIntersectionImages
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) ⊆
      Image map left ∩ Image map right := by
  sorry

end SetOperations

end Image

end LRA.Map.Image
