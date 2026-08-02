import LRA.VolumeI.Set.Operations.Laws.Complement
import LRA.VolumeI.Set.Operations.Laws.Intersection

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  sorry

theorem DifferenceEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  sorry

theorem EmptyDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  sorry

theorem DifferenceUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  sorry

theorem UniversalDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  sorry

theorem DifferenceSelf {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
