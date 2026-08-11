import LRA.VolumeI.Algebra.Signatures.Algebraic.MagmaSignature

namespace LRA.VolumeI.Algebra.Signatures.Ordered

/--
An ordered magma signature adds an order relation symbol.

Logical form:

```lean
structure OrderedMagmaSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.MagmaSignature where
  OrderSymbol : Type
```
-/
structure OrderedMagmaSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.MagmaSignature where
  OrderSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Ordered
