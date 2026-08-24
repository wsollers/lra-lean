import LRA.UniversalAlgebra.Signature.FormalVocabulary.OperationSymbols

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

/--
`PrimitiveOperationSymbol` TODO

Predicate logic:

  inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication

Predicate logic (unfolded):

  inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication
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
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication

/--
`PrimitiveOperationArity` TODO

Predicate logic:

  def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2

Predicate logic (unfolded):

  def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2
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
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
