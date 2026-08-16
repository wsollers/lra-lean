import LRA.VolumeI.Map.Preimage.Definition

namespace LRA.Map.Preimage

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

section Preimage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]
variable [HasComplement DomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]

/--
Membership in the constructed preimage is exactly membership of the value in
the target.
-/
theorem PreimageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (input : DomainElement) :
    input ∈ (Preimage map target : DomainSet) <-> map input ∈ target := by
  sorry

section SetOperations

variable [Union DomainSet] [Inter DomainSet] [SDiff DomainSet]
variable [EmptyCollection DomainSet] [HasSubset DomainSet]
variable [Union CodomainSet] [Inter CodomainSet] [SDiff CodomainSet]
variable [EmptyCollection CodomainSet] [HasSubset CodomainSet]
variable [HasComplement CodomainSet] [HasUniversal CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [MembershipLaws DomainElement DomainSet]
variable [MembershipLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]

/--
Preimage preserves binary union.
-/
theorem PreimageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∪ right) : DomainSet) =
      Preimage map left ∪ Preimage map right := by
  sorry

/--
Preimage preserves binary intersection.
-/
theorem PreimageIntersection
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∩ right) : DomainSet) =
      Preimage map left ∩ Preimage map right := by
  sorry

/--
Preimage preserves set difference.
-/
theorem PreimageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left \ right) : DomainSet) =
      Preimage map left \ Preimage map right := by
  sorry

/--
Preimage preserves complement.
-/
theorem PreimageComplement
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Preimage map targetᶜ : DomainSet) = (Preimage map target)ᶜ := by
  sorry

end SetOperations

end Preimage

end LRA.Map.Preimage
