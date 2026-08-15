import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Set

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

/--
`ExtensionalityLaw` packages the class contract for extensionality law.

Logical form:

```lean
class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B
```
-/
class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

/--
`MembershipLaws` packages the class contract for membership laws.

Logical form:

```lean
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
```
-/
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

/--
`SeparationLaws` packages the class contract for separation laws.

Logical form:

```lean
class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x
```
-/
class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

/--
`UniversalMembershipLaws` packages the class contract for universal membership laws.

Logical form:

```lean
class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A
```
-/
class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A

/--
`SymmDiffMembershipLaws` packages the class contract for symm diff membership laws.

Logical form:

```lean
class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```
-/
class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/--
`PowersetMembershipLaws` packages the class contract for powerset membership laws.

Logical form:

```lean
class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A
```
-/
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
extensionality would be a false capability requirement.

Logical form:

```lean
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B
```
-/
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B :=
  ExtensionalityLaw.SetExtensionality sameMembers

/-- Nothing is a member of the empty set.

Logical form:

```lean
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject)
```
-/
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject) :=
  MembershipLaws.EmptyMembership

/-- Membership in a union.

Logical form:

```lean
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
```
-/
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B :=
  MembershipLaws.UnionMembership

/-- Membership in an intersection.

Logical form:

```lean
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
```
-/
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B :=
  MembershipLaws.IntersectionMembership

/-- Membership in a difference.

Logical form:

```lean
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
```
-/
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B :=
  MembershipLaws.DifferenceMembership

/-- Subset means every member carries over.

Logical form:

```lean
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B
```
-/
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B :=
  MembershipLaws.SubsetIffAllMembers

/-- Membership in a separated subset.

Logical form:

```lean
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x
```
-/
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x :=
  SeparationLaws.SeparationMembership

/-- Everything is a member of the universal set.

Logical form:

```lean
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject)
```
-/
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject) :=
  UniversalMembershipLaws.UniversalMembership

/-- Membership in a complement.

Logical form:

```lean
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A
```
-/
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A :=
  UniversalMembershipLaws.ComplementMembership

/-- Membership in a symmetric difference.

Logical form:

```lean
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```
-/
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) :=
  SymmDiffMembershipLaws.SymmetricDifferenceMembership

/-- Membership in a power set is being a subset.

Logical form:

```lean
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A
```
-/
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A :=
  PowersetMembershipLaws.PowersetMembership

end Wrappers

end LRA.Set
