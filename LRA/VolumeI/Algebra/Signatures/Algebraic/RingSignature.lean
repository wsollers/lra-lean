import LRA.VolumeI.Algebra.Signatures.Algebraic.GroupSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/-- A ring signature carries additive group and multiplicative monoid symbols. -/
structure RingSignature where
  zeroSymbol : Type
  oneSymbol : Type
  additionSymbol : Type
  negationSymbol : Type
  multiplicationSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Algebraic
