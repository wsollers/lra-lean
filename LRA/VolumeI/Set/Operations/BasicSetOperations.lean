import LRA.VolumeI.Set.LRASet.LRASet

/-!
Basic typed-set operation facts.
-/

namespace LRA.VolumeI.Set.Operations.BasicSetOperations

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `A` and `B` be sets. An element belongs to `A ∪ B` exactly when it belongs
to `A` or belongs to `B`; equivalently, for every element `x`,
`x ∈ A ∪ B` iff `x ∈ A ∨ x ∈ B`. -/
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

/-- Let `A` and `B` be sets. An element belongs to `A ∩ B` exactly when it belongs
to both `A` and `B`; equivalently, for every element `x`,
`x ∈ A ∩ B` iff `x ∈ A ∧ x ∈ B`. -/
theorem IntersectionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Intersection Left Right) ↔
      Member Element Left ∧ Member Element Right := by
  constructor
  · intro elementInLIR
    exact ⟨elementInLIR.left, elementInLIR.right⟩
  · intro elementInRIL
    exact ⟨elementInRIL.left, elementInRIL.right⟩

/-- Let `A` be a set. An element belongs to the complement of `A` exactly when it
does not belong to `A`; equivalently, for every element `x`,
`x ∈ Aᶜ` iff `¬ x ∈ A`. -/
theorem ComplementMembershipIff {Alpha : LRACarrier}
    (Comp : LRASet Alpha) (Element : Alpha) :
    Member Element (Complement Comp) ↔
      ¬ Member Element Comp := by
  constructor
  · intro elementInComplement
    exact elementInComplement
  · intro elementNotInComp
    exact elementNotInComp

/-- Let `A` and `B` be sets. An element belongs to `A \ B` exactly when it belongs
to `A` and does not belong to `B`; equivalently, for every element `x`,
`x ∈ A \ B` iff `x ∈ A ∧ ¬ x ∈ B`. -/
theorem DifferenceMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Difference Left Right) ↔
      Member Element Left ∧ ¬ Member Element Right := by
  constructor
  · intro elementInDifference
    exact ⟨elementInDifference.left, elementInDifference.right⟩
  · intro elementInLeftNotInRight
    exact ⟨elementInLeftNotInRight.left, elementInLeftNotInRight.right⟩

/-- Let `A` and `B` be sets. If `A` is a subset of `B`, then every element of `A`
is an element of `B`; equivalently, `A ⊆ B` gives `∀ x, x ∈ A → x ∈ B`. -/
theorem SubsetMembershipImplication {Alpha : LRACarrier}
    (Left Right : LRASet Alpha)
    (LeftSubsetRight : Subset Left Right) :
    ∀ Element : Alpha, Member Element Left → Member Element Right := by
  intro Element elementInLeft
  exact LeftSubsetRight Element elementInLeft

end LRA.VolumeI.Set.Operations.BasicSetOperations
