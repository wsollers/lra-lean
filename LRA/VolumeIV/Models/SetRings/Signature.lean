import LRA.VolumeI.Algebra.Signatures.OperationBundles

namespace LRA.Logic.ModelTheory.SetRings

/-!
Source-facing signature for rings of sets.

The abstract distinguished element is named `zero`; concrete powerset models
will interpret `zero` as the empty set. A set ring is not required to have a
distinguished `one`, because the ambient universe need not belong to the ring.
-/

/-- A set-ring signature names the carrier of set-objects, the distinguished
zero object, and the finite set operations used by rings of sets; equivalently,
in powerset models `zero` is `∅`, `join` is union, `meet` is intersection,
`difference` is relative complement, and `add` is symmetric difference.

Logical form:

```lean
structure SetRingSignature extends LRA.Algebra.Signatures.CarrierSignature where
  zero : carrier
  add : LRA.Algebra.Operation.BinaryOperation carrier
  join : LRA.Algebra.Operation.BinaryOperation carrier
  meet : LRA.Algebra.Operation.BinaryOperation carrier
  difference : LRA.Algebra.Operation.BinaryOperation carrier
```
-/
structure SetRingSignature extends LRA.Algebra.Signatures.CarrierSignature where
  zero : carrier
  add : LRA.Algebra.Operation.BinaryOperation carrier
  join : LRA.Algebra.Operation.BinaryOperation carrier
  meet : LRA.Algebra.Operation.BinaryOperation carrier
  difference : LRA.Algebra.Operation.BinaryOperation carrier

end LRA.Logic.ModelTheory.SetRings
