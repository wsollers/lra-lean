import LRA.ModelTheory.Model

namespace LRA.NumberSystems.Presburger.Interface.Signature

/--
`PresburgerFunctionSymbol` TODO

Predicate logic:

  inductive PresburgerFunctionSymbol where
    | successor
    | addition

Predicate logic (unfolded):

  inductive PresburgerFunctionSymbol where
    | successor
    | addition (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerFunctionSymbol where
  | successor
  | addition
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
inductive PresburgerFunctionSymbol where
  | successor
  | addition

/--
`PresburgerRelationSymbol` TODO

Predicate logic:

  inductive PresburgerRelationSymbol where
    | lessThan

Predicate logic (unfolded):

  inductive PresburgerRelationSymbol where
    | lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerRelationSymbol where
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
inductive PresburgerRelationSymbol where
  | lessThan

/--
`PresburgerConstantSymbol` TODO

Predicate logic:

  inductive PresburgerConstantSymbol where
    | zero

Predicate logic (unfolded):

  inductive PresburgerConstantSymbol where
    | zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerConstantSymbol where
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
inductive PresburgerConstantSymbol where
  | zero

/--
`PresburgerFirstOrderFunctions` TODO

Predicate logic:

  def PresburgerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := PresburgerFunctionSymbol
    arity
      | .successor => 1
      | .addition => 2

Predicate logic (unfolded):

  def PresburgerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := PresburgerFunctionSymbol
    arity
      | .successor => 1
      | .addition => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2
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
def PresburgerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

/--
`PresburgerFirstOrderRelations` TODO

Predicate logic:

  def PresburgerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := PresburgerRelationSymbol
    arity
      | .lessThan => 2

Predicate logic (unfolded):

  def PresburgerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := PresburgerRelationSymbol
    arity
      | .lessThan => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
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
def PresburgerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

/--
`PresburgerFirstOrderSignature` TODO

Predicate logic:

  def PresburgerFirstOrderSignature : LRA.Logic.Signature where
    Functions := PresburgerFirstOrderFunctions
    Relations := PresburgerFirstOrderRelations
    Constants := PresburgerConstantSymbol

Predicate logic (unfolded):

  def PresburgerFirstOrderSignature : LRA.Logic.Signature where
    Functions := PresburgerFirstOrderFunctions
    Relations := PresburgerFirstOrderRelations
    Constants := PresburgerConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerFirstOrderSignature : LRA.Logic.Signature where
  Functions := PresburgerFirstOrderFunctions
  Relations := PresburgerFirstOrderRelations
  Constants := PresburgerConstantSymbol
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
def PresburgerFirstOrderSignature : LRA.Logic.Signature where
  Functions := PresburgerFirstOrderFunctions
  Relations := PresburgerFirstOrderRelations
  Constants := PresburgerConstantSymbol

end LRA.NumberSystems.Presburger.Interface.Signature
