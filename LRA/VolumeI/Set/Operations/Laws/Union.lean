import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionCommutative {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Union Left Right = Union Right Left := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInLUR
      have elementInRUL : Member Element (Union Right Left) := by
        cases elementInLUR with
        | inl elementInLeft => exact Or.inr elementInLeft
        | inr elementInRight => exact Or.inl elementInRight
      exact elementInRUL
    · intro elementInRUL
      have elementInLUR : Member Element (Union Left Right) := by
        cases elementInRUL with
        | inl elementInRight => exact Or.inr elementInRight
        | inr elementInLeft => exact Or.inl elementInLeft
      exact elementInLUR

theorem UnionAssociative {Alpha : LRACarrier}

    (Left Middle Right : LRASet Alpha) :
    Union (Union Left Middle) Right = Union Left (Union Middle Right) := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInLUM_UR
      cases elementInLUM_UR with
      | inl elementInLUM =>
        cases elementInLUM with
        | inl elementInLeft => exact Or.inl elementInLeft
        | inr elementInMiddle => exact Or.inr (Or.inl elementInMiddle)
      | inr elementInRight => exact Or.inr (Or.inr elementInRight)
    · intro elementInL_UMR
      cases elementInL_UMR with
      | inl elementInLeft => exact Or.inl (Or.inl elementInLeft)
      | inr elementInUMR =>
        cases elementInUMR with
        | inl elementInMiddle => exact Or.inl (Or.inr elementInMiddle)
        | inr elementInRight => exact Or.inr elementInRight


theorem UnionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Empty Alpha) = Left := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInLUE
      cases elementInLUE with
      | inl elementInLeft => exact elementInLeft
      | inr elementInEmpty => exact elementInEmpty.elim
    · intro elementInLeft
      exact Or.inl elementInLeft

theorem EmptyUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Empty Alpha) Right = Right := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInEU
      cases elementInEU with
      | inl elementInEmpty => exact elementInEmpty.elim
      | inr elementInRight => exact elementInRight
    · intro elementInRight
      exact Or.inr elementInRight

theorem UnionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Universal Alpha) = Universal Alpha := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInLUU
      have elementInUniversal : Member Element (Universal Alpha) := by
      exact elementInUniversal
    · intro elementInUniversal
      exact Or.inr elementInUniversal


theorem UnionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left Left = Left := by
    apply LRASet.Extensionality
    intro Element
    constructor
    · intro elementInLUL
      cases elementInLUL with
      | inl elementInLeft => exact elementInLeft
      | inr elementInLeft => exact elementInLeft
    · intro elementInLeft
      exact Or.inl elementInLeft


end LRA.VolumeI.Set.Operations.Laws
