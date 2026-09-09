import LRA.ModelTheory.Model

namespace LRA.NumberSystems.VonNeumann.Interface.Signature

/--
`VonNeumannFunctionSymbol` TODO

Predicate logic:

  inductive VonNeumannFunctionSymbol where
    | successor
    | addition
    | multiplication

Predicate logic (unfolded):

  inductive VonNeumannFunctionSymbol where
    | successor
    | addition
    | multiplication (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive VonNeumannFunctionSymbol where
  | successor
  | addition
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
inductive VonNeumannFunctionSymbol where
  | successor
  | addition
  | multiplication

/--
`VonNeumannRelationSymbol` TODO

Predicate logic:

  inductive VonNeumannRelationSymbol where
    | lessThan

Predicate logic (unfolded):

  inductive VonNeumannRelationSymbol where
    | lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive VonNeumannRelationSymbol where
  | lessThan
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
inductive VonNeumannRelationSymbol where
  | lessThan

/--
`VonNeumannConstantSymbol` TODO

Predicate logic:

  inductive VonNeumannConstantSymbol where
    | zero
    | one

Predicate logic (unfolded):

  inductive VonNeumannConstantSymbol where
    | zero
    | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive VonNeumannConstantSymbol where
  | zero
  | one
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
inductive VonNeumannConstantSymbol where
  | zero
  | one

/--
`VonNeumannFirstOrderFunctions` TODO

Predicate logic:

  def VonNeumannFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := VonNeumannFunctionSymbol
    arity
      | .successor => 1
      | .addition => 2
      | .multiplication => 2

Predicate logic (unfolded):

  def VonNeumannFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := VonNeumannFunctionSymbol
    arity
      | .successor => 1
      | .addition => 2
      | .multiplication => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2
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

Related proof moves: unfold

-/
def VonNeumannFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2
    | .multiplication => 2

/--
`VonNeumannFirstOrderRelations` TODO

Predicate logic:

  def VonNeumannFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := VonNeumannRelationSymbol
    arity
      | .lessThan => 2

Predicate logic (unfolded):

  def VonNeumannFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := VonNeumannRelationSymbol
    arity
      | .lessThan => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannRelationSymbol
  arity
    | .lessThan => 2
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
def VonNeumannFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannRelationSymbol
  arity
    | .lessThan => 2

/--
`VonNeumannFirstOrderSignature` TODO

Predicate logic:

  def VonNeumannFirstOrderSignature : LRA.Logic.Signature where
    Functions := VonNeumannFirstOrderFunctions
    Relations := VonNeumannFirstOrderRelations
    Constants := VonNeumannConstantSymbol

Predicate logic (unfolded):

  def VonNeumannFirstOrderSignature : LRA.Logic.Signature where
    Functions := VonNeumannFirstOrderFunctions
    Relations := VonNeumannFirstOrderRelations
    Constants := VonNeumannConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannFirstOrderSignature : LRA.Logic.Signature where
  Functions := VonNeumannFirstOrderFunctions
  Relations := VonNeumannFirstOrderRelations
  Constants := VonNeumannConstantSymbol
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
def VonNeumannFirstOrderSignature : LRA.Logic.Signature where
  Functions := VonNeumannFirstOrderFunctions
  Relations := VonNeumannFirstOrderRelations
  Constants := VonNeumannConstantSymbol

end LRA.NumberSystems.VonNeumann.Interface.Signature
