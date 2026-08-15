import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Notation

namespace LRA.Algebra.Signatures.BasicArithmeticLanguage

/--
Derived relation notation, usually defined from primitive operations.

Logical form:

```lean
inductive DerivedRelationNotation where
  | divisibility
```
-/
inductive DerivedRelationNotation where
  | divisibility

end LRA.Algebra.Signatures.BasicArithmeticLanguage
