import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Notation

namespace LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

/-- Derived operation notation, not generally primitive signature data. -/
inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus

end LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage
