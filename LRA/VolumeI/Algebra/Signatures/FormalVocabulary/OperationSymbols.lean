import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Arity

namespace LRA.Algebra.Signatures.FormalVocabulary

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

end LRA.Algebra.Signatures.FormalVocabulary
