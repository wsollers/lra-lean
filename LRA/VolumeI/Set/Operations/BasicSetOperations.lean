import LRA.VolumeI.Set.Set

/-!
Basic predicate-set operations.

This module is the proving home for the elementary operation-facing facts about
`LRASet`: membership unfoldings and the first reusable laws for union,
intersection, complement, difference, empty set, and universal set.
-/

namespace LRA.VolumeI.Set.Operations.BasicSetOperations

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Union Left Right) ↔
      Member Element Left ∨ Member Element Right := by
    constructor
    · intro ElementInUnion
      exact ElementInUnion
    · intro ElementInEitherSet
      exact ElementInEitherSet
      
theorem IntersectionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Intersection Left Right) ↔
      Member Element Left ∧ Member Element Right := by
    constructor
    · intro ElementInIntersection
      exact ElementInIntersection
    · intro ElementInBothSets
      exact ElementInBothSets

theorem ComplementMembershipIff {Alpha : LRACarrier}
    (Comp : LRASet Alpha) (Element : Alpha) :
    Member Element (Complement Comp) ↔
      ¬ Member Element Comp := by
    constructor
    · intro ElementInComplement
      exact ElementInComplement
    · intro ElementNotInComp
      exact ElementNotInComp

theorem DifferenceMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Difference Left Right) ↔
      Member Element Left ∧ ¬ Member Element Right := by
    constructor
    · intro ElementInDifference
      exact ElementInDifference
    · intro ElementInLeftNotInRight
      exact ElementInLeftNotInRight


theorem SubsetMembershipImplication {Alpha : LRACarrier}
    (Left Right : LRASet Alpha)
    (LeftSubsetRight : Subset Left Right) :
    ∀ Element : Alpha, Member Element Left → Member Element Right := by
  intro Element ElementInLeft
  exact LeftSubsetRight Element ElementInLeft

end LRA.VolumeI.Set.Operations.BasicSetOperations
