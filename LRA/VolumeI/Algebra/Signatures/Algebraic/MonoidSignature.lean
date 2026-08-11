import LRA.VolumeI.Algebra.Signatures.Algebraic.MagmaSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/--
A monoid signature adds a nullary identity symbol to a magma signature.

Logical form:

```lean
structure MonoidSignature extends MagmaSignature where
  IdentitySymbol : Type
  IdentityArityIsNullary : IdentitySymbol -> Prop
```
-/
structure MonoidSignature extends MagmaSignature where
  IdentitySymbol : Type
  IdentityArityIsNullary : IdentitySymbol -> Prop

end LRA.VolumeI.Algebra.Signatures.Algebraic
