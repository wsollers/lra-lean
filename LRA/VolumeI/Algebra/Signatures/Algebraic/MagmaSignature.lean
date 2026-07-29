import LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/-- A magma signature has one binary operation symbol. -/
structure MagmaSignature where
  OperationSymbol : Type
  OperationArityIsBinary : OperationSymbol -> Prop

end LRA.VolumeI.Algebra.Signatures.Algebraic
