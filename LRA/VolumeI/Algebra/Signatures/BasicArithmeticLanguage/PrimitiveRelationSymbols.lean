import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.RelationSymbols

namespace LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

/-- Primitive relation symbols for arithmetic languages. -/
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual

/-- Arity assignment for primitive arithmetic relation symbols. -/
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2

end LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage
