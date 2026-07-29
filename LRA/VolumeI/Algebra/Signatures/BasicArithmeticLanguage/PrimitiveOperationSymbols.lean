import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.OperationSymbols

namespace LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

/-- Primitive operation symbols for the basic arithmetic language. -/
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication

/-- Arity assignment for primitive arithmetic operation symbols. -/
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2

end LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage
