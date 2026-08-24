import LRA.UniversalAlgebra.Signature.FormalVocabulary.RelationSymbols

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

/--
`PrimitiveRelationSymbol` TODO

Predicate logic:

  inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual

Predicate logic (unfolded):

  inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual
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
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual

/--
`PrimitiveRelationArity` TODO

Predicate logic:

  def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2

Predicate logic (unfolded):

  def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
