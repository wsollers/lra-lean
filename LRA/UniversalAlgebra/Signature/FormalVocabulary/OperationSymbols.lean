import LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

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

end LRA.UniversalAlgebra.Signature.FormalVocabulary
