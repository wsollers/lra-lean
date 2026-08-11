import LRA.VolumeI.Set.Interface.Operations
import LRA.VolumeI.Set.Algebra.Closure

namespace LRA.VolumeI.Set.Algebra

open LRA.VolumeI.Set

universe u v

/-!
Rings of sets, relative to an ambient set, over the capability classes.

A ring of sets on an ambient set `X` is a collection of subsets of `X`
containing `∅` and closed under the backend's own finite operations. The
collection and its closure proofs are bundled -- a ring of sets is a
first-class object -- but the *operations* are the backend's, so
membership certificates and law certificates apply inside closure
arguments, and nothing is duplicated or untethered.
-/

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]

/-- A ring of sets on the ambient set `ambient`: a collection of subsets
of `ambient`, containing the empty set and closed under union,
intersection, difference, and symmetric difference. -/
structure RingOfSets (ambient : SetObject) where
  IsMember : SetObject → Prop
  MembersAreSubsets : ∀ A, IsMember A → A ⊆ ambient
  EmptyIsMember : IsMember (∅ : SetObject)
  UnionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∪ B)
  IntersectionIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∩ B)
  DifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A \ B)
  SymmetricDifferenceIsMember :
    ∀ A B, IsMember A → IsMember B → IsMember (A ∆ B)

end LRA.VolumeI.Set.Algebra
