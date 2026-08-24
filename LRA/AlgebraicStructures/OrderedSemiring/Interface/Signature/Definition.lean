import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature

/--
`OrderedSemiringFunctionSymbol` TODO

Predicate logic:

  inductive OrderedSemiringFunctionSymbol where
  | add
  | mul

Predicate logic (unfolded):

  inductive OrderedSemiringFunctionSymbol where
  | add
  | mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedSemiringFunctionSymbol where
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
inductive OrderedSemiringFunctionSymbol where
  | add
  | mul

/--
`OrderedSemiringRelationSymbol` TODO

Predicate logic:

  inductive OrderedSemiringRelationSymbol where
  | lt

Predicate logic (unfolded):

  inductive OrderedSemiringRelationSymbol where
  | lt (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedSemiringRelationSymbol where
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
inductive OrderedSemiringRelationSymbol where
  | lt

/--
`OrderedSemiringConstantSymbol` TODO

Predicate logic:

  inductive OrderedSemiringConstantSymbol where
  | zero
  | one

Predicate logic (unfolded):

  inductive OrderedSemiringConstantSymbol where
  | zero
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedSemiringConstantSymbol where
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
inductive OrderedSemiringConstantSymbol where
  | zero
  | one

/--
`OrderedSemiringFirstOrderFunctions` TODO

Predicate logic:

  def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

Predicate logic (unfolded):

  def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
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
def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

/--
`OrderedSemiringFirstOrderRelations` TODO

Predicate logic:

  def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

Predicate logic (unfolded):

  def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
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
def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

/--
`OrderedSemiringFirstOrderSignature` TODO

Predicate logic:

  def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol

Predicate logic (unfolded):

  def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol
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
def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol

end LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature
