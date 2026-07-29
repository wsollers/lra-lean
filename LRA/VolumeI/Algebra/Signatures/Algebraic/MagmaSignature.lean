import LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/-- A magma signature has one binary operation symbol. -/
structure MagmaSignature where
  operationSymbol : Type
  operationArityIsBinary : operationSymbol -> Prop

end LRA.VolumeI.Algebra.Signatures.Algebraic
