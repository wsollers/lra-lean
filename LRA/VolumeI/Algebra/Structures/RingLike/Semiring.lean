import LRA.VolumeI.Operations

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- A semiring-like structure with addition, multiplication, zero, and one. -/
structure Semiring where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : carrier
  one : carrier
  add : LRA.VolumeI.Operations.BinaryOperation carrier
  mul : LRA.VolumeI.Operations.BinaryOperation carrier
  addAssociative : LRA.VolumeI.Operations.Associative add
  addCommutative : LRA.VolumeI.Operations.Commutative add
  zeroAddIdentity : LRA.VolumeI.Operations.Identity add zero
  mulAssociative : LRA.VolumeI.Operations.Associative mul
  oneMulIdentity : LRA.VolumeI.Operations.Identity mul one
  mulDistributesOverAdd : LRA.VolumeI.Operations.Distributive mul add
  zeroMulAbsorbing : LRA.VolumeI.Operations.Absorbing mul zero

end LRA.VolumeI.Algebra.Structures.RingLike
