import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem IntersectionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left Right = Intersection Right Left := by
  apply Extensionality
  intro x
  constructor <;> rintro ⟨hLeft, hRight⟩ <;> exact ⟨hRight, hLeft⟩

theorem IntersectionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection (Intersection Left Middle) Right =
      Intersection Left (Intersection Middle Right) := by
  apply Extensionality
  intro x
  constructor
  · rintro ⟨⟨hLeft, hMiddle⟩, hRight⟩
    exact ⟨hLeft, hMiddle, hRight⟩
  · rintro ⟨hLeft, hMiddle, hRight⟩
    exact ⟨⟨hLeft, hMiddle⟩, hRight⟩

theorem IntersectionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Empty Alpha) = Empty Alpha := by
  apply Extensionality
  intro x
  constructor
  · rintro ⟨_, hx⟩; exact hx
  · intro hx; contradiction

theorem EmptyIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Empty Alpha) Right = Empty Alpha := by
  rw [IntersectionCommutative, IntersectionEmpty]

theorem IntersectionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Universal Alpha) = Left := by
  apply Extensionality
  intro x
  constructor
  · exact And.left
  · intro hx; exact ⟨hx, trivial⟩

theorem UniversalIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Universal Alpha) Right = Right := by
  rw [IntersectionCommutative, IntersectionUniversal]

theorem IntersectionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left Left = Left := by
  apply Extensionality
  intro x
  constructor
  · exact And.left
  · intro hx; exact ⟨hx, hx⟩

end LRA.VolumeI.Set.Operations.Laws
