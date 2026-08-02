import LRA.VolumeI.Set.Operations.Laws.Difference
import LRA.VolumeI.Set.Operations.Laws.Union

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem DeMorganUnion {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Union Left Right) =
      Intersection (Complement Left) (Complement Right) := by
  apply Extensionality
  intro x
  constructor
  · intro h
    exact ⟨fun hx => h (Or.inl hx), fun hx => h (Or.inr hx)⟩
  · rintro ⟨hLeft, hRight⟩
    rintro (hx | hx)
    · exact hLeft hx
    · exact hRight hx

theorem DeMorganIntersection {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Intersection Left Right) =
      Union (Complement Left) (Complement Right) := by
  apply Extensionality
  intro x
  constructor
  · intro h
    by_cases hLeft : Member x Left
    · exact Or.inr (fun hRight => h ⟨hLeft, hRight⟩)
    · exact Or.inl hLeft
  · rintro (hLeft | hRight) ⟨hxLeft, hxRight⟩
    · exact hLeft hxLeft
    · exact hRight hxRight

theorem AbsorptionUnionIntersection {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Union Left (Intersection Left Right) = Left := by
  apply Extensionality
  intro x
  constructor
  · rintro (hx | ⟨hx, _⟩) <;> exact hx
  · exact Or.inl

theorem AbsorptionIntersectionUnion {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left (Union Left Right) = Left := by
  apply Extensionality
  intro x
  constructor
  · exact And.left
  · intro hx; exact ⟨hx, Or.inl hx⟩

end LRA.VolumeI.Set.Operations.Laws
