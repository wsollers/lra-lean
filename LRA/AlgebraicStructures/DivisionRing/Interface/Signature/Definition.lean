import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.DivisionRing.Interface.Signature

/--
`DivisionRingFunctionSymbol` TODO

Predicate logic:

  inductive DivisionRingFunctionSymbol where
  | add
  | mul
  | neg
  | inv

Predicate logic (unfolded):

  inductive DivisionRingFunctionSymbol where
  | add
  | mul
  | neg
  | inv (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive DivisionRingFunctionSymbol where
  | add
  | mul
  | neg
  | inv
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
inductive DivisionRingFunctionSymbol where
  | add
  | mul
  | neg
  | inv

/--
`DivisionRingRelationSymbol` TODO

Predicate logic:

  def DivisionRingRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def DivisionRingRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DivisionRingRelationSymbol : Type := Empty
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
def DivisionRingRelationSymbol : Type := Empty

/--
`DivisionRingConstantSymbol` TODO

Predicate logic:

  inductive DivisionRingConstantSymbol where
  | zero
  | one

Predicate logic (unfolded):

  inductive DivisionRingConstantSymbol where
  | zero
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive DivisionRingConstantSymbol where
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
inductive DivisionRingConstantSymbol where
  | zero
  | one

/--
`DivisionRingFirstOrderFunctions` TODO

Predicate logic:

  def DivisionRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

Predicate logic (unfolded):

  def DivisionRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DivisionRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1
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
def DivisionRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

/--
`DivisionRingFirstOrderRelations` TODO

Predicate logic:

  def DivisionRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def DivisionRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DivisionRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingRelationSymbol
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
def DivisionRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingRelationSymbol
  arity := Empty.elim

/--
`DivisionRingFirstOrderSignature` TODO

Predicate logic:

  def DivisionRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := DivisionRingFirstOrderFunctions
  Relations := DivisionRingFirstOrderRelations
  Constants := DivisionRingConstantSymbol

Predicate logic (unfolded):

  def DivisionRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := DivisionRingFirstOrderFunctions
  Relations := DivisionRingFirstOrderRelations
  Constants := DivisionRingConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DivisionRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := DivisionRingFirstOrderFunctions
  Relations := DivisionRingFirstOrderRelations
  Constants := DivisionRingConstantSymbol
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
def DivisionRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := DivisionRingFirstOrderFunctions
  Relations := DivisionRingFirstOrderRelations
  Constants := DivisionRingConstantSymbol

end LRA.AlgebraicStructures.DivisionRing.Interface.Signature
