import LRA.VolumeI.Algebra.Signatures.Algebraic.GroupSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/-- A ring signature carries additive group and multiplicative monoid symbols. -/
structure RingSignature where
  ZeroSymbol : Type
  OneSymbol : Type
  AdditionSymbol : Type
  NegationSymbol : Type
  MultiplicationSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Algebraic
