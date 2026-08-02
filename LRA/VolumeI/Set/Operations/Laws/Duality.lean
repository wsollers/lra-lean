import LRA.VolumeI.Set.Operations.Laws.Difference
import LRA.VolumeI.Set.Operations.Laws.Union

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem DeMorganUnion {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Union Left Right) =
      Intersection (Complement Left) (Complement Right) := by
  sorry

theorem DeMorganIntersection {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Intersection Left Right) =
      Union (Complement Left) (Complement Right) := by
  sorry

theorem AbsorptionUnionIntersection {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Union Left (Intersection Left Right) = Left := by
  sorry

theorem AbsorptionIntersectionUnion {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left (Union Left Right) = Left := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
