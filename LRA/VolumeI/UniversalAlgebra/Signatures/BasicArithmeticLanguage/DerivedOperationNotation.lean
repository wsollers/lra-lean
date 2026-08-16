import LRA.VolumeI.UniversalAlgebra.Signatures.FormalVocabulary.Notation

namespace LRA.UniversalAlgebra.Signatures.BasicArithmeticLanguage

/--
Derived operation notation, not generally primitive signature data.

Logical form:

```lean
inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus
```
-/
inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus

end LRA.UniversalAlgebra.Signatures.BasicArithmeticLanguage
