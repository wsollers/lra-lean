import LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

/--
`RelationSymbols` TODO

Predicate logic:

  structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity

Predicate logic (unfolded):

  structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity

end LRA.UniversalAlgebra.Signature.FormalVocabulary
