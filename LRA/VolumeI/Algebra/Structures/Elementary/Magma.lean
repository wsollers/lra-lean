import LRA.VolumeI.Operations

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A carrier equipped with one binary operation. -/
structure Magma where
  Carrier : Type u
  Operation : LRA.VolumeI.Operations.BinaryOperation Carrier

end LRA.VolumeI.Algebra.Structures.Elementary
