import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionCommutative {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Union Left Right = Union Right Left := by
  sorry

theorem UnionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Union (Union Left Middle) Right = Union Left (Union Middle Right) := by
  sorry

theorem UnionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Empty Alpha) = Left := by
  sorry

theorem EmptyUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Empty Alpha) Right = Right := by
  sorry

theorem UnionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Universal Alpha) = Universal Alpha := by
  sorry

theorem UniversalUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Universal Alpha) Right = Universal Alpha := by
  sorry

theorem UnionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left Left = Left := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
