namespace LRA.Logic

/--
`ArityIndexedSymbols` TODO

Predicate logic:

  structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

Predicate logic (unfolded):

  structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat
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
structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

/--
`ArityIndexedSymbols.IsNullary` TODO

Predicate logic:

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.Symbol), A.arity symbol = 0

Predicate logic (unfolded):

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.1), A.2 symbol = instOfNatNat 0.1

Logical form (Lean):

```lean
def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

/--
`ArityIndexedSymbols.IsUnary` TODO

Predicate logic:

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.Symbol), A.arity symbol = 1

Predicate logic (unfolded):

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.1), A.2 symbol = instOfNatNat 1.1

Logical form (Lean):

```lean
def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

/--
`ArityIndexedSymbols.IsBinary` TODO

Predicate logic:

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.Symbol), A.arity symbol = 2

Predicate logic (unfolded):

  ∀ (A : LRA.Logic.ArityIndexedSymbols) (symbol : A.1), A.2 symbol = instOfNatNat 2.1

Logical form (Lean):

```lean
def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

end LRA.Logic
