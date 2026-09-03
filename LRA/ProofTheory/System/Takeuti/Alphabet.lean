namespace LRA.ProofTheory.System.Takeuti

/--
`Alphabet` TODO

Predicate logic:

  structure Alphabet where
  FreeVar : Type
  BoundVar : Type
  FunctionSymbol : Nat -> Type
  PredicateSymbol : Nat -> Type

Predicate logic (unfolded):

  structure Alphabet where
  FreeVar : Type
  BoundVar : Type
  FunctionSymbol : Nat -> Type
  PredicateSymbol : Nat -> Type (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Alphabet where
  FreeVar : Type
  BoundVar : Type
  FunctionSymbol : Nat -> Type
  PredicateSymbol : Nat -> Type
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
structure Alphabet where
  FreeVar : Type
  BoundVar : Type
  FunctionSymbol : Nat -> Type
  PredicateSymbol : Nat -> Type

end LRA.ProofTheory.System.Takeuti
