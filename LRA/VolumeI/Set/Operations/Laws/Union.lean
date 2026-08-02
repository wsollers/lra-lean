import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionCommutative {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Union Left Right = Union Right Left := by
  apply Extensionality
  intro x
  constructor <;> intro h
  · exact Or.elim h Or.inr Or.inl
  · exact Or.elim h Or.inr Or.inl

theorem UnionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Union (Union Left Middle) Right = Union Left (Union Middle Right) := by
  apply Extensionality
  intro x
  constructor
  · rintro ((hx | hx) | hx)
    · exact Or.inl hx
    · exact Or.inr (Or.inl hx)
    · exact Or.inr (Or.inr hx)
  · rintro (hx | hx | hx)
    · exact Or.inl (Or.inl hx)
    · exact Or.inl (Or.inr hx)
    · exact Or.inr hx

theorem UnionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Empty Alpha) = Left := by
  apply Extensionality
  intro x
  constructor
  · rintro (hx | hx)
    · exact hx
    · contradiction
  · exact Or.inl

theorem EmptyUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Empty Alpha) Right = Right := by
  rw [UnionCommutative, UnionEmpty]

theorem UnionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Universal Alpha) = Universal Alpha := by
  apply Extensionality
  intro x
  constructor
  · intro _; trivial
  · intro _; exact Or.inr trivial

theorem UniversalUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Universal Alpha) Right = Universal Alpha := by
  rw [UnionCommutative, UnionUniversal]

theorem UnionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left Left = Left := by
  apply Extensionality
  intro x
  constructor
  · rintro (hx | hx) <;> exact hx
  · exact Or.inl

end LRA.VolumeI.Set.Operations.Laws
