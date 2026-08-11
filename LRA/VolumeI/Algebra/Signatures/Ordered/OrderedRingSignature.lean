import LRA.VolumeI.Algebra.Signatures.Algebraic.RingSignature

namespace LRA.VolumeI.Algebra.Signatures.Ordered

/--
An ordered ring signature adds an order relation symbol to a ring language.

Logical form:

```lean
structure OrderedRingSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.RingSignature where
  OrderSymbol : Type
```
-/
structure OrderedRingSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.RingSignature where
  OrderSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Ordered
