import LRA.VolumeI.UniversalAlgebra.Signature.FormalVocabulary.Notation

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

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

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
