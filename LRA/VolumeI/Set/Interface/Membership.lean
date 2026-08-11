import LRA.VolumeI.Set.Interface.Operations

namespace LRA.VolumeI.Set

universe u v

/-!
Membership-characterization laws as law-carrying typeclasses.

Where the one-sorted families (`UnionLaws`, ...) state *algebraic* facts
(`A ∪ B = B ∪ A`), the certificates here state what membership *means*
for each operation (`x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B`). They are two-sorted
(`Element`, `SetObject`) because membership is, and they exist so that the
`Functions` and `Relations` chapters can be stated once, generically,
against any backend -- exactly the role the retired
`PublicSetOperationLaws`/`ComprehensionSetInterfaceLaws` record bundles
used to play, now resolved by instance search instead of threading.

The split follows capability, as everywhere else in this interface:
`MembershipLaws` needs only what every backend has;
`SeparationLaws`/`PowersetMembershipLaws` need the corresponding
operation capability; `UniversalMembershipLaws` needs `𝒰`/`ᶜ` and is
therefore forever unavailable to Enderton (Russell's paradox).
-/

class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B

class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A

class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A

section Wrappers

variable {Element : Type u} {SetObject : Type v}

/-- Sets with the same members are equal. Its own certificate, requiring
only `Membership`: it is the single most-used law downstream (`Functions`,
`Relations`), and demanding the full operation vocabulary just to cite
extensionality would be a false capability requirement. -/
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B :=
  ExtensionalityLaw.SetExtensionality sameMembers

/-- Nothing is a member of the empty set. -/
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject) :=
  MembershipLaws.EmptyMembership

/-- Membership in a union. -/
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B :=
  MembershipLaws.UnionMembership

/-- Membership in an intersection. -/
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B :=
  MembershipLaws.IntersectionMembership

/-- Membership in a difference. -/
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B :=
  MembershipLaws.DifferenceMembership

/-- Subset means every member carries over. -/
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B :=
  MembershipLaws.SubsetIffAllMembers

/-- Membership in a separated subset. -/
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x :=
  SeparationLaws.SeparationMembership

/-- Everything is a member of the universal set. -/
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject) :=
  UniversalMembershipLaws.UniversalMembership

/-- Membership in a complement. -/
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A :=
  UniversalMembershipLaws.ComplementMembership

/-- Membership in a symmetric difference. -/
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) :=
  SymmDiffMembershipLaws.SymmetricDifferenceMembership

/-- Membership in a power set is being a subset. -/
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A :=
  PowersetMembershipLaws.PowersetMembership

end Wrappers

end LRA.VolumeI.Set
