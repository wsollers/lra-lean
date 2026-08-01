import LRA.VolumeI.Set.Operations.BasicSetOperations
import LRA.VolumeI.Set.Operations.Laws.Complement
import LRA.VolumeI.Set.Operations.Laws.Intersection

/-!
Difference laws for predicate-sets.
-/

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet
open LRA.VolumeI.Set.Operations.BasicSetOperations

/-- Set difference is intersection with complement. -/
theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  sorry

/-- Difference by the empty set is itself. -/
theorem DifferenceEmpty {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  sorry

/-- Difference from the empty set is empty. -/
theorem EmptyDifference {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  sorry

/-- Difference by the universal set is empty. -/
theorem DifferenceUniversal {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  sorry

/-- Difference from the universal set is complement. -/
theorem UniversalDifference {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  sorry

/-- Difference of a predicate-set from itself is empty. -/
theorem DifferenceSelf {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
