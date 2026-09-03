import LRA.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedRing.Interface.Signature

/--
`OrderedRingFunctionSymbol` TODO

Predicate logic:

  inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

Predicate logic (unfolded):

  inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg
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
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/--
`OrderedRingRelationSymbol` TODO

Predicate logic:

  inductive OrderedRingRelationSymbol where
  | lt

Predicate logic (unfolded):

  inductive OrderedRingRelationSymbol where
  | lt (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingRelationSymbol where
  | lt
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
inductive OrderedRingRelationSymbol where
  | lt

/--
`OrderedRingConstantSymbol` TODO

Predicate logic:

  inductive OrderedRingConstantSymbol where
  | zero
  | one

Predicate logic (unfolded):

  inductive OrderedRingConstantSymbol where
  | zero
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingConstantSymbol where
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
inductive OrderedRingConstantSymbol where
  | zero
  | one

/--
`OrderedRingFirstOrderFunctions` TODO

Predicate logic:

  def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

Predicate logic (unfolded):

  def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
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
def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

/--
`OrderedRingFirstOrderRelations` TODO

Predicate logic:

  def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

Predicate logic (unfolded):

  def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2
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
def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/--
`OrderedRingFirstOrderSignature` TODO

Predicate logic:

  def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol

Predicate logic (unfolded):

  def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol
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
def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol

end LRA.AlgebraicStructures.OrderedRing.Interface.Signature
