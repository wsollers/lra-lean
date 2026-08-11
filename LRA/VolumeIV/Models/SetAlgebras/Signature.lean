import LRA.VolumeIV.Models.SetRings.Signature

namespace LRA.VolumeIV.Models.SetAlgebras

/-!
Source-facing signature for algebras of sets.

The abstract distinguished elements are named `zero` and `one`; concrete
powerset models will interpret `zero` as the empty set and `one` as the
ambient universe.
-/

/-- A set-algebra signature is a set-ring signature with a distinguished `one`
and a complement operation; equivalently, in powerset models `zero` is `∅`,
`one` is `U`, `join` is union, `meet` is intersection, and `complement` is set
complement relative to `U`.

Logical form:

```lean
structure SetAlgebraSignature extends LRA.VolumeIV.Models.SetRings.SetRingSignature where
  one : carrier
  complement : LRA.VolumeI.Operations.UnaryOperation carrier
```
-/
structure SetAlgebraSignature extends LRA.VolumeIV.Models.SetRings.SetRingSignature where
  one : carrier
  complement : LRA.VolumeI.Operations.UnaryOperation carrier

end LRA.VolumeIV.Models.SetAlgebras
