import LRA.VolumeI.UniversalAlgebra.Signatures.FormalVocabulary.Arity

namespace LRA.UniversalAlgebra.Signatures.FormalVocabulary

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

end LRA.UniversalAlgebra.Signatures.FormalVocabulary
