import LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

/--
Relation symbols with assigned arities.

Logical form:

```lean
structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity
```
-/
structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity

end LRA.UniversalAlgebra.Signature.FormalVocabulary
