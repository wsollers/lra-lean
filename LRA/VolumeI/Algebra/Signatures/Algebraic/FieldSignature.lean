import LRA.VolumeI.Algebra.Signatures.Algebraic.RingSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/--
A field signature adds multiplicative inverse notation to a ring signature.

Logical form:

```lean
structure FieldSignature extends RingSignature where
  InverseSymbol : Type
```
-/
structure FieldSignature extends RingSignature where
  InverseSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Algebraic
