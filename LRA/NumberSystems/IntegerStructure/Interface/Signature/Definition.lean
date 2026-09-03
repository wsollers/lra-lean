
import LRA.ModelTheory.Model

namespace LRA.NumberSystems.IntegerStructure.Interface.Signature

/--
`IntegerFunctionSymbol` TODO

Predicate logic:

  inductive IntegerFunctionSymbol where
  | successor
  | predecessor

Predicate logic (unfolded):

  inductive IntegerFunctionSymbol where
  | successor
  | predecessor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive IntegerFunctionSymbol where
  | successor
  | predecessor
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
inductive IntegerFunctionSymbol where
  | successor
  | predecessor

/--
`IntegerRelationSymbol` TODO

Predicate logic:

  def IntegerRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def IntegerRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerRelationSymbol : Type := Empty
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
def IntegerRelationSymbol : Type := Empty

/--
`IntegerConstantSymbol` TODO

Predicate logic:

  inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne

Predicate logic (unfolded):

  inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne
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
inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne

/--
`IntegerFirstOrderFunctions` TODO

Predicate logic:

  def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1

Predicate logic (unfolded):

  def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1
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
def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1

/--
`IntegerFirstOrderRelations` TODO

Predicate logic:

  def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
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
def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
  arity := Empty.elim

/--
`IntegerFirstOrderSignature` TODO

Predicate logic:

  def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol

Predicate logic (unfolded):

  def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol
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
def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol

end LRA.NumberSystems.IntegerStructure.Interface.Signature
