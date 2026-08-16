import LRA.VolumeI.Map.Preimage.Definition
import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Identity.Definition
import LRA.VolumeI.Set.Interface.Indexed
import LRA.VolumeI.Identity.Model.Theory

namespace LRA.Map.Preimage

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ u₃ v₁ v₂ v₃

section Preimage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]
variable [HasComplement DomainSet]
variable [HasSymmDiff DomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]

/--
**[Theorem — PreimageMembershipIff]**

Membership in the constructed preimage is exactly membership of the value in
the target.

Logical form:

```lean
theorem PreimageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (input : DomainElement) :
    input ∈ (Preimage map target : DomainSet) <-> map input ∈ target
```
-/
theorem PreimageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (input : DomainElement) :
    input ∈ (Preimage map target : DomainSet) <-> map input ∈ target := by
  sorry

section Existence

variable [ExtensionalityLaw DomainElement DomainSet]

/--
**[Theorem — PreimageExists]**

For every target set, a preimage set exists.

Logical form:

```lean
theorem PreimageExists
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Exists
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageExists
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Exists
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

/--
**[Theorem — PreimageUnique]**

A preimage set is uniquely determined by its memberwise specification.

Logical form:

```lean
theorem PreimageUnique
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Unique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageUnique
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Unique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

/--
**[Theorem — PreimageExistsAndUnique]**

For every target set, there is exactly one preimage set.

Logical form:

```lean
theorem PreimageExistsAndUnique
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageExistsAndUnique
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

end Existence

section SetOperations

variable [Union DomainSet] [Inter DomainSet] [SDiff DomainSet]
variable [EmptyCollection DomainSet] [HasSubset DomainSet]
variable [Union CodomainSet] [Inter CodomainSet] [SDiff CodomainSet]
variable [EmptyCollection CodomainSet] [HasSubset CodomainSet]
variable [HasComplement CodomainSet] [HasUniversal CodomainSet]
variable [HasSymmDiff CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [MembershipLaws DomainElement DomainSet]
variable [MembershipLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]
variable [SymmDiffMembershipLaws DomainElement DomainSet]
variable [SymmDiffMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — PreimageUniversal]**

The preimage of the whole codomain is the whole domain.

Logical form:

```lean
theorem PreimageUniversal
    (map : TypedMap DomainElement CodomainElement) :
    (Preimage map (𝒰 : CodomainSet) : DomainSet) = (𝒰 : DomainSet)
```
-/
theorem PreimageUniversal
    (map : TypedMap DomainElement CodomainElement) :
    (Preimage map (𝒰 : CodomainSet) : DomainSet) = (𝒰 : DomainSet) := by
  sorry

/--
**[Theorem — PreimageEmpty]**

Preimage preserves the empty set.

Logical form:

```lean
theorem PreimageEmpty
    (map : TypedMap DomainElement CodomainElement) :
    (Preimage map (∅ : CodomainSet) : DomainSet) = ∅
```
-/
theorem PreimageEmpty
    (map : TypedMap DomainElement CodomainElement) :
    (Preimage map (∅ : CodomainSet) : DomainSet) = ∅ := by
  sorry

/--
**[Theorem — PreimageUnion]**

Preimage preserves binary union.

Logical form:

```lean
theorem PreimageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∪ right) : DomainSet) =
      Preimage map left ∪ Preimage map right
```
-/
theorem PreimageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∪ right) : DomainSet) =
      Preimage map left ∪ Preimage map right := by
  sorry

/--
**[Theorem — PreimageIntersection]**

Preimage preserves binary intersection.

Logical form:

```lean
theorem PreimageIntersection
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∩ right) : DomainSet) =
      Preimage map left ∩ Preimage map right
```
-/
theorem PreimageIntersection
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∩ right) : DomainSet) =
      Preimage map left ∩ Preimage map right := by
  sorry

/--
**[Theorem — PreimageDifference]**

Preimage preserves set difference.

Logical form:

```lean
theorem PreimageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left \ right) : DomainSet) =
      Preimage map left \ Preimage map right
```
-/
theorem PreimageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left \ right) : DomainSet) =
      Preimage map left \ Preimage map right := by
  sorry

/--
**[Theorem — PreimageComplement]**

Preimage preserves complement.

Logical form:

```lean
theorem PreimageComplement
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Preimage map targetᶜ : DomainSet) = (Preimage map target)ᶜ
```
-/
theorem PreimageComplement
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Preimage map targetᶜ : DomainSet) = (Preimage map target)ᶜ := by
  sorry

/--
**[Theorem — PreimageSymmetricDifference]**

Preimage preserves symmetric difference.

Logical form:

```lean
theorem PreimageSymmetricDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∆ right) : DomainSet) =
      Preimage map left ∆ Preimage map right
```
-/
theorem PreimageSymmetricDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet) :
    (Preimage map (left ∆ right) : DomainSet) =
      Preimage map left ∆ Preimage map right := by
  sorry

/--
**[Theorem — PreimageSubsetUniversal]**

A preimage is a subset of the domain universe.

Logical form:

```lean
theorem PreimageSubsetUniversal
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Preimage map target : DomainSet) ⊆ (𝒰 : DomainSet)
```
-/
theorem PreimageSubsetUniversal
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Preimage map target : DomainSet) ⊆ (𝒰 : DomainSet) := by
  sorry

/--
**[Theorem — PreimageMonotone]**

Preimage is monotone with respect to target inclusion.

Logical form:

```lean
theorem PreimageMonotone
    (map : TypedMap DomainElement CodomainElement)
    {left right : CodomainSet}
    (subset : left ⊆ right) :
    (Preimage map left : DomainSet) ⊆ Preimage map right
```
-/
theorem PreimageMonotone
    (map : TypedMap DomainElement CodomainElement)
    {left right : CodomainSet}
    (subset : left ⊆ right) :
    (Preimage map left : DomainSet) ⊆ Preimage map right := by
  sorry

/--
**[Theorem — PreimageCongrFunction]**

Pointwise equal maps have equal preimages of every target set.

Logical form:

```lean
theorem PreimageCongrFunction
    (leftMap rightMap : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (sameValues : forall input, leftMap input = rightMap input) :
    (Preimage leftMap target : DomainSet) = Preimage rightMap target
```
-/
theorem PreimageCongrFunction
    (leftMap rightMap : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (sameValues : forall input, leftMap input = rightMap input) :
    (Preimage leftMap target : DomainSet) = Preimage rightMap target := by
  sorry

/--
**[Theorem — PreimageCongrSet]**

Equal target sets have equal preimages.

Logical form:

```lean
theorem PreimageCongrSet
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet)
    (sameSet : left = right) :
    (Preimage map left : DomainSet) = Preimage map right
```
-/
theorem PreimageCongrSet
    (map : TypedMap DomainElement CodomainElement)
    (left right : CodomainSet)
    (sameSet : left = right) :
    (Preimage map left : DomainSet) = Preimage map right := by
  sorry

/--
**[Theorem — PreimageDifferenceUnion]**

A mixed preimage drill combining difference and union.

Logical form:

```lean
theorem PreimageDifferenceUnion
    (map : TypedMap DomainElement CodomainElement)
    (left middle right : CodomainSet) :
    (Preimage map (left \ (middle ∪ right)) : DomainSet) =
      Preimage map left \
        (Preimage map middle ∪ Preimage map right)
```
-/
theorem PreimageDifferenceUnion
    (map : TypedMap DomainElement CodomainElement)
    (left middle right : CodomainSet) :
    (Preimage map (left \ (middle ∪ right)) : DomainSet) =
      Preimage map left \
        (Preimage map middle ∪ Preimage map right) := by
  sorry

end SetOperations

section IndexedSetOperations

variable {Index : Type u₃}
variable [HasIndexedUnion DomainSet] [HasIndexedIntersection DomainSet]
variable [HasIndexedUnion CodomainSet] [HasIndexedIntersection CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [IndexedMembershipLaws DomainElement DomainSet]
variable [IndexedMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — PreimageIndexedUnion]**

Preimage preserves arbitrary indexed unions.

Logical form:

```lean
theorem PreimageIndexedUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → CodomainSet) :
    (Preimage map (HasIndexedUnion.indexedUnion family) : DomainSet) =
      HasIndexedUnion.indexedUnion
        (fun index : Index => (Preimage map (family index) : DomainSet))
```
-/
theorem PreimageIndexedUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → CodomainSet) :
    (Preimage map (HasIndexedUnion.indexedUnion family) : DomainSet) =
      HasIndexedUnion.indexedUnion
        (fun index : Index => (Preimage map (family index) : DomainSet)) := by
  sorry

/--
**[Theorem — PreimageIndexedIntersection]**

Preimage preserves arbitrary indexed intersections.

Logical form:

```lean
theorem PreimageIndexedIntersection
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → CodomainSet) :
    (Preimage map (HasIndexedIntersection.indexedIntersection family) :
      DomainSet) =
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Preimage map (family index) : DomainSet))
```
-/
theorem PreimageIndexedIntersection
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → CodomainSet) :
    (Preimage map (HasIndexedIntersection.indexedIntersection family) :
      DomainSet) =
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Preimage map (family index) : DomainSet)) := by
  sorry

end IndexedSetOperations

section CountableSetOperations

variable [HasCountableUnion DomainSet] [HasCountableIntersection DomainSet]
variable [HasCountableUnion CodomainSet] [HasCountableIntersection CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [CountableMembershipLaws DomainElement DomainSet]
variable [CountableMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — PreimageCountableUnion]**

Preimage preserves countable unions.

Logical form:

```lean
theorem PreimageCountableUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → CodomainSet) :
    (Preimage map (HasCountableUnion.countableUnion family) : DomainSet) =
      HasCountableUnion.countableUnion
        (fun index : Nat => (Preimage map (family index) : DomainSet))
```
-/
theorem PreimageCountableUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → CodomainSet) :
    (Preimage map (HasCountableUnion.countableUnion family) : DomainSet) =
      HasCountableUnion.countableUnion
        (fun index : Nat => (Preimage map (family index) : DomainSet)) := by
  sorry

/--
**[Theorem — PreimageCountableIntersection]**

Preimage preserves countable intersections.

Logical form:

```lean
theorem PreimageCountableIntersection
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → CodomainSet) :
    (Preimage map (HasCountableIntersection.countableIntersection family) :
      DomainSet) =
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Preimage map (family index) : DomainSet))
```
-/
theorem PreimageCountableIntersection
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → CodomainSet) :
    (Preimage map (HasCountableIntersection.countableIntersection family) :
      DomainSet) =
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Preimage map (family index) : DomainSet)) := by
  sorry

end CountableSetOperations

end Preimage

section SameBackend

variable {Element : Type u₁} {SetObject : Type v₁}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject]
variable [HasComplement SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]

/--
**[Theorem — PreimageIdentity]**

Preimage under the identity map is the original set.

Logical form:

```lean
theorem PreimageIdentity
    (subset : SetObject) :
    (Preimage (LRA.Map.Identity.IdentityMap Element) subset : SetObject) =
      subset
```
-/
theorem PreimageIdentity
    (subset : SetObject) :
    (Preimage (LRA.Map.Identity.IdentityMap Element) subset : SetObject) =
      subset := by
  sorry

end SameBackend

section Composition

variable {FirstElement : Type u₁}
variable {MiddleElement : Type u₂}
variable {ThirdElement : Type u₃}
variable {FirstSet : Type v₁}
variable {MiddleSet : Type v₂}
variable {ThirdSet : Type v₃}
variable [Membership FirstElement FirstSet]
variable [Membership MiddleElement MiddleSet]
variable [Membership ThirdElement ThirdSet]
variable [HasSeparation FirstElement FirstSet]
variable [HasUniversal FirstSet]
variable [HasSeparation MiddleElement MiddleSet]
variable [HasUniversal MiddleSet]

/--
**[Theorem — PreimageComposition]**

Pulling back along a composite is the same as pulling back in two steps.

Logical form:

```lean
theorem PreimageComposition
    [ExtensionalityLaw FirstElement FirstSet]
    [SeparationLaws FirstElement FirstSet]
    [SeparationLaws MiddleElement MiddleSet]
    [HasComplement FirstSet] [HasComplement MiddleSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    [UniversalMembershipLaws MiddleElement MiddleSet]
    (secondMap : TypedMap MiddleElement ThirdElement)
    (firstMap : TypedMap FirstElement MiddleElement)
    (target : ThirdSet) :
    (Preimage (LRA.Map.Composition.Compose secondMap firstMap) target :
      FirstSet) =
      Preimage firstMap ((Preimage secondMap target : MiddleSet))
```
-/
theorem PreimageComposition
    [ExtensionalityLaw FirstElement FirstSet]
    [SeparationLaws FirstElement FirstSet]
    [SeparationLaws MiddleElement MiddleSet]
    [HasComplement FirstSet] [HasComplement MiddleSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    [UniversalMembershipLaws MiddleElement MiddleSet]
    (secondMap : TypedMap MiddleElement ThirdElement)
    (firstMap : TypedMap FirstElement MiddleElement)
    (target : ThirdSet) :
    (Preimage (LRA.Map.Composition.Compose secondMap firstMap) target :
      FirstSet) =
      Preimage firstMap ((Preimage secondMap target : MiddleSet)) := by
  sorry

end Composition

end LRA.Map.Preimage
