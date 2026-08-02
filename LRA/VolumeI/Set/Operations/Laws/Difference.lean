import LRA.VolumeI.Set.Operations.Laws.Complement
import LRA.VolumeI.Set.Operations.Laws.Intersection

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  rfl

theorem DifferenceEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  rw [DifferenceAsIntersectionComplement, ComplementEmpty, IntersectionUniversal]

theorem EmptyDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  rw [DifferenceAsIntersectionComplement, EmptyIntersection]

theorem DifferenceUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  rw [DifferenceAsIntersectionComplement, ComplementUniversal, IntersectionEmpty]

theorem UniversalDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  rw [DifferenceAsIntersectionComplement, UniversalIntersection]

theorem DifferenceSelf {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  apply Extensionality
  intro x
  constructor
  · rintro ⟨hx, hNot⟩
    exact hNot hx
  · intro hx
    contradiction

end LRA.VolumeI.Set.Operations.Laws
