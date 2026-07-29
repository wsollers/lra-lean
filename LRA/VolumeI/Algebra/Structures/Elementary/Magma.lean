import LRA.VolumeI.Operations

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A carrier equipped with one binary operation. -/
structure Magma where
  carrier : LRA.VolumeI.Set.LRACarrier
  operation : LRA.VolumeI.Operations.BinaryOperation carrier

end LRA.VolumeI.Algebra.Structures.Elementary
