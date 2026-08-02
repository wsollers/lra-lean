import LRA.VolumeI.Set.LRASet.LRASet

/-!
Basic typed-set operation facts.
-/

namespace LRA.VolumeI.Set.Operations.BasicSetOperations

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Union Left Right) ↔
      Member Element Left ∨ Member Element Right := by
    constructor
    · intro elementInLUR
      cases elementInLUR with
      | inl elementInLeft => exact Or.inl elementInLeft
      | inr elementInRight => exact Or.inr elementInRight
    · intro elementInRUL
      cases elementInRUL with
      | inl elementInLeft => exact Or.inl elementInLeft
      | inr elementInRight => exact Or.inr elementInRight

theorem IntersectionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Intersection Left Right) ↔
      Member Element Left ∧ Member Element Right := by
  constructor
  · intro elementInLIR
    exact ⟨elementInLIR.left, elementInLIR.right⟩
  · intro elementInRIL
    exact ⟨elementInRIL.left, elementInRIL.right⟩

theorem ComplementMembershipIff {Alpha : LRACarrier}
    (Comp : LRASet Alpha) (Element : Alpha) :
    Member Element (Complement Comp) ↔
      ¬ Member Element Comp := by
  constructor
  · intro elementInComplement
    exact elementInComplement
  · intro elementNotInComp
    exact elementNotInComp

theorem DifferenceMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Difference Left Right) ↔
      Member Element Left ∧ ¬ Member Element Right := by
  constructor
  · intro elementInDifference
    exact ⟨elementInDifference.left, elementInDifference.right⟩
  · intro elementInLeftNotInRight
    exact ⟨elementInLeftNotInRight.left, elementInLeftNotInRight.right⟩

theorem SubsetMembershipImplication {Alpha : LRACarrier}
    (Left Right : LRASet Alpha)
    (LeftSubsetRight : Subset Left Right) :
    ∀ Element : Alpha, Member Element Left → Member Element Right := by
  intro Element elementInLeft
  exact LeftSubsetRight Element elementInLeft

end LRA.VolumeI.Set.Operations.BasicSetOperations
