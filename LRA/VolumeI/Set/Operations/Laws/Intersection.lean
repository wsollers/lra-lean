import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem IntersectionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left Right = Intersection Right Left := by
  sorry

theorem IntersectionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection (Intersection Left Middle) Right =
      Intersection Left (Intersection Middle Right) := by
  sorry

theorem IntersectionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Empty Alpha) = Empty Alpha := by
  sorry

theorem EmptyIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Empty Alpha) Right = Empty Alpha := by
  sorry

theorem IntersectionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Universal Alpha) = Left := by
  sorry

theorem UniversalIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Universal Alpha) Right = Right := by
  sorry

theorem IntersectionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left Left = Left := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
