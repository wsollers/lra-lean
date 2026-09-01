import LRA.Logic.Model.Model

namespace LRA.NumberSystems.PeanoSystem.Interface.Signature

/--
`PeanoFunctionSymbol` TODO

Predicate logic:

  inductive PeanoFunctionSymbol where
  | successor

Predicate logic (unfolded):

  inductive PeanoFunctionSymbol where
  | successor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PeanoFunctionSymbol where
  | successor
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
inductive PeanoFunctionSymbol where
  | successor

/--
`PeanoRelationSymbol` TODO

Predicate logic:

  def PeanoRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def PeanoRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PeanoRelationSymbol : Type := Empty
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
def PeanoRelationSymbol : Type := Empty

/--
`PeanoConstantSymbol` TODO

Predicate logic:

  inductive PeanoConstantSymbol where
  | one

Predicate logic (unfolded):

  inductive PeanoConstantSymbol where
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PeanoConstantSymbol where
  | base
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
inductive PeanoConstantSymbol where
  | one

/--
`PeanoFirstOrderFunctions` TODO

Predicate logic:

  def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

Predicate logic (unfolded):

  def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1
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
def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

/--
`PeanoFirstOrderRelations` TODO

Predicate logic:

  def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
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
def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

/--
`PeanoFirstOrderSignature` TODO

Predicate logic:

  def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

Predicate logic (unfolded):

  def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol
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
def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

end LRA.NumberSystems.PeanoSystem.Interface.Signature
