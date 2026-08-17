import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Enderton

/-!
Membership-law certificates for Enderton sets.

Unlike the algebraic families (`Laws/Union.lean`, ...), almost nothing
here needs a fresh theorem: the certificate fields delegate directly to
the chapter's own membership theorems (`TheUnionMembership`,
`TheSeparatedSubsetIsSeparatedSubset`, ...) and to the Extensionality
axiom -- the shapes match definitionally, since `∪`, `∩`, `\`, `∅`, `∆`
and the separation/powerset capabilities are registered against exactly
those witnesses.

No `UniversalMembershipLaws` instance, ever: no `𝒰`, no `ᶜ` (Russell's
paradox).
-/

/--
`SubsetIffAllMembers` states subset iff all members.

Logical form:

```lean
theorem SubsetIffAllMembers :
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B
```
-/
theorem SubsetIffAllMembers :
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B := by
  sorry

/-- Registration: extensionality, straight from the axiom. -/
instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => Extensionality A B h

/-- Registration: membership readings for the core operations. Pure
delegation to the chapter's own membership theorems and axiom. -/
instance : MembershipLaws Set Set where
  EmptyMembership := TheEmptySetIsEmpty
  UnionMembership := TheUnionMembership
  IntersectionMembership := TheIntersectionMembership
  DifferenceMembership := TheRelativeComplementMembership
  SubsetIffAllMembers := LRA.Set.Enderton.SubsetIffAllMembers

/-- Registration: membership reading for separation. -/
instance : SeparationLaws Set Set where
  SeparationMembership := TheSeparatedSubsetIsSeparatedSubset

/-- Registration: membership reading for symmetric difference. -/
instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := TheSymmetricDifferenceMembership

/-- Registration: membership reading for the power set. -/
instance : PowersetMembershipLaws Set Set where
  PowersetMembership := ThePowerSetIsPowerSetOf

/-- Registration: collection union/intersection membership readings --
delegation to the Union axiom's own characterization and to the derived
`TheIntersectionOverMembership` (conditioned on nonemptiness, as the
certificate requires: this backend has no universal set for `⋂₀ ∅`).
No indexed/countable certificates: an arbitrary Lean-indexed family is
class-sized for a ZF-style backend. -/
instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    TheIntersectionOverMembership C x h

end LRA.Set.Enderton
