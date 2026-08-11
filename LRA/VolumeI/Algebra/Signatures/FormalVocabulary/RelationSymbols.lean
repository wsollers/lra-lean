import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Arity

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

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

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
