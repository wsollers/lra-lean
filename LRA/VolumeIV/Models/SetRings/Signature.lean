import LRA.VolumeI.Algebra.Signatures.OperationBundles

namespace LRA.VolumeIV.Models.SetRings

/-!
Source-facing signature for rings of sets.

The abstract distinguished element is named `zero`; concrete powerset models
will interpret `zero` as the empty set. A set ring is not required to have a
distinguished `one`, because the ambient universe need not belong to the ring.
-/

/-- A set-ring signature names the carrier of set-objects, the distinguished
zero object, and the finite set operations used by rings of sets; equivalently,
in powerset models `zero` is `∅`, `join` is union, `meet` is intersection,
`difference` is relative complement, and `add` is symmetric difference. -/
structure SetRingSignature extends LRA.VolumeI.Algebra.Signatures.CarrierSignature where
  zero : carrier
  add : LRA.VolumeI.Operations.BinaryOperation carrier
  join : LRA.VolumeI.Operations.BinaryOperation carrier
  meet : LRA.VolumeI.Operations.BinaryOperation carrier
  difference : LRA.VolumeI.Operations.BinaryOperation carrier

end LRA.VolumeIV.Models.SetRings
