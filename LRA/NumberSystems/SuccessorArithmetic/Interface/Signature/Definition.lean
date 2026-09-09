import LRA.ModelTheory.Model

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.Signature

/--
`SuccessorArithmeticFunctionSymbol` TODO

Predicate logic:

  inductive SuccessorArithmeticFunctionSymbol where
    | successor

Predicate logic (unfolded):

  inductive SuccessorArithmeticFunctionSymbol where
    | successor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SuccessorArithmeticFunctionSymbol where
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
inductive SuccessorArithmeticFunctionSymbol where
  | successor

/--
`SuccessorArithmeticRelationSymbol` TODO

Predicate logic:

  def SuccessorArithmeticRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def SuccessorArithmeticRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticRelationSymbol : Type := Empty
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
def SuccessorArithmeticRelationSymbol : Type := Empty

/--
`SuccessorArithmeticConstantSymbol` TODO

Predicate logic:

  inductive SuccessorArithmeticConstantSymbol where
    | zero

Predicate logic (unfolded):

  inductive SuccessorArithmeticConstantSymbol where
    | zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SuccessorArithmeticConstantSymbol where
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
inductive SuccessorArithmeticConstantSymbol where
  | zero

/--
`SuccessorArithmeticFirstOrderFunctions` TODO

Predicate logic:

  def SuccessorArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := SuccessorArithmeticFunctionSymbol
    arity
      | .successor => 1

Predicate logic (unfolded):

  def SuccessorArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := SuccessorArithmeticFunctionSymbol
    arity
      | .successor => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticFunctionSymbol
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
def SuccessorArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticFunctionSymbol
  arity
    | .successor => 1

/--
`SuccessorArithmeticFirstOrderRelations` TODO

Predicate logic:

  def SuccessorArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := SuccessorArithmeticRelationSymbol
    arity := Empty.elim

Predicate logic (unfolded):

  def SuccessorArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := SuccessorArithmeticRelationSymbol
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticRelationSymbol
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
def SuccessorArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticRelationSymbol
  arity := Empty.elim

/--
`SuccessorArithmeticFirstOrderSignature` TODO

Predicate logic:

  def SuccessorArithmeticFirstOrderSignature : LRA.Logic.Signature where
    Functions := SuccessorArithmeticFirstOrderFunctions
    Relations := SuccessorArithmeticFirstOrderRelations
    Constants := SuccessorArithmeticConstantSymbol

Predicate logic (unfolded):

  def SuccessorArithmeticFirstOrderSignature : LRA.Logic.Signature where
    Functions := SuccessorArithmeticFirstOrderFunctions
    Relations := SuccessorArithmeticFirstOrderRelations
    Constants := SuccessorArithmeticConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticFirstOrderSignature : LRA.Logic.Signature where
  Functions := SuccessorArithmeticFirstOrderFunctions
  Relations := SuccessorArithmeticFirstOrderRelations
  Constants := SuccessorArithmeticConstantSymbol
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
def SuccessorArithmeticFirstOrderSignature : LRA.Logic.Signature where
  Functions := SuccessorArithmeticFirstOrderFunctions
  Relations := SuccessorArithmeticFirstOrderRelations
  Constants := SuccessorArithmeticConstantSymbol

end LRA.NumberSystems.SuccessorArithmetic.Interface.Signature
