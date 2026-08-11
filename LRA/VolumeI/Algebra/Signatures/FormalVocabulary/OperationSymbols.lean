import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Arity

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

/--
Operation symbols with assigned arities.

Logical form:

```lean
structure OperationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity
```
-/
structure OperationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
