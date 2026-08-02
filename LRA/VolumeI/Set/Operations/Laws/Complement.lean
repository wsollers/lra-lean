import LRA.VolumeI.Set.Operations.BasicSetOperations

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem DoubleComplement {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Complement (Complement Left) = Left := by
  sorry

theorem ComplementEmpty {Alpha : LRACarrier} :
    Complement (Empty Alpha) = Universal Alpha := by
  sorry

theorem ComplementUniversal {Alpha : LRACarrier} :
    Complement (Universal Alpha) = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
