import LRA.ModelTheory.Model

namespace LRA.NumberSystems.Arithmetic.Model

/--
`ArithmeticRingFunctionSymbol` TODO

Predicate logic:

  inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

Predicate logic (unfolded):

  inductive ArithmeticRingFunctionSymbol where
  | add
  | mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive ArithmeticRingFunctionSymbol where
  | add
  | mul
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
inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

/--
`ArithmeticRingRelationSymbol` TODO

Predicate logic:

  def ArithmeticRingRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def ArithmeticRingRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ArithmeticRingRelationSymbol : Type := Empty
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
def ArithmeticRingRelationSymbol : Type := Empty

/--
`ArithmeticRingConstantSymbol` TODO

Predicate logic:

  inductive ArithmeticRingConstantSymbol where
  | zero
  | one

Predicate logic (unfolded):

  inductive ArithmeticRingConstantSymbol where
  | zero
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive ArithmeticRingConstantSymbol where
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
inductive ArithmeticRingConstantSymbol where
  | zero
  | one

/--
`ArithmeticRingFirstOrderFunctions` TODO

Predicate logic:

  def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

Predicate logic (unfolded):

  def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
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
def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

/--
`ArithmeticRingFirstOrderRelations` TODO

Predicate logic:

  def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
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
def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

/--
`ArithmeticRingFirstOrderSignature` TODO

Predicate logic:

  def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

Predicate logic (unfolded):

  def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol
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
def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

end LRA.NumberSystems.Arithmetic.Model
