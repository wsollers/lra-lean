import LRA.VolumeI.UniversalAlgebra.Signatures.FormalVocabulary.Arity

namespace LRA.UniversalAlgebra.Signatures.FormalVocabulary

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

end LRA.UniversalAlgebra.Signatures.FormalVocabulary
