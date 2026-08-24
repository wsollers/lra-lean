import LRA.UniversalAlgebra.Signature.FormalVocabulary.Notation

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

/--
`DerivedOperationNotation` TODO

Predicate logic:

  inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus

Predicate logic (unfolded):

  inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive DerivedOperationNotation where
  | subtraction
  | division
  | power
  | modulus

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
