import LRA.VolumeI.Algebra.Signatures.Algebraic.FieldSignature

namespace LRA.VolumeI.Algebra.Signatures.Ordered

/--
An ordered field signature adds an order relation symbol to a field language.

Logical form:

```lean
structure OrderedFieldSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.FieldSignature where
  OrderSymbol : Type
```
-/
structure OrderedFieldSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.FieldSignature where
  OrderSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Ordered
