import LRA.Logic

namespace LRA.ModelTheoryTheory.SetRings

/--
`SetRingFunctionSymbol` TODO

Predicate logic:

  inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference

Predicate logic (unfolded):

  inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference
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
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference

/--
`SetRingRelationSymbol` TODO

Predicate logic:

  def SetRingRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def SetRingRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SetRingRelationSymbol : Type := Empty
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
def SetRingRelationSymbol : Type := Empty

/--
`SetRingConstantSymbol` TODO

Predicate logic:

  inductive SetRingConstantSymbol where
  | zero

Predicate logic (unfolded):

  inductive SetRingConstantSymbol where
  | zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SetRingConstantSymbol where
  | zero
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
inductive SetRingConstantSymbol where
  | zero

/--
`SetRingFirstOrderFunctions` TODO

Predicate logic:

  def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2

Predicate logic (unfolded):

  def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2
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
def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2

/--
`SetRingFirstOrderRelations` TODO

Predicate logic:

  def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim
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
def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim

/--
`SetRingFirstOrderSignature` TODO

Predicate logic:

  def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol

Predicate logic (unfolded):

  def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol
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
def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol

end LRA.ModelTheoryTheory.SetRings
