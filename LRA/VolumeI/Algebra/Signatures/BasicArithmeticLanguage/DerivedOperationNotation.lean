import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Notation

namespace LRA.Algebra.Signatures.BasicArithmeticLanguage

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

end LRA.Algebra.Signatures.BasicArithmeticLanguage
