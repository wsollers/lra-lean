import LRA.AlgebraicStructures.Monoid.Interface.Definitions.Signature

namespace LRA.AlgebraicStructures.Group.Interface.Signature

/--
`GroupFunctionSymbol` TODO

Predicate logic:

  inductive GroupFunctionSymbol where
  | mul
  | inv

Predicate logic (unfolded):

  inductive GroupFunctionSymbol where
  | mul
  | inv (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive GroupFunctionSymbol where
  | mul
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
inductive GroupFunctionSymbol where
  | mul
  | inv

/--
`GroupRelationSymbol` TODO

Predicate logic:

  def GroupRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def GroupRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GroupRelationSymbol : Type := Empty
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
def GroupRelationSymbol : Type := Empty

/--
`GroupConstantSymbol` TODO

Predicate logic:

  abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.Interface.Signature.MonoidConstantSymbol

Predicate logic (unfolded):

  abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.Interface.Signature.MonoidConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.Interface.Signature.MonoidConstantSymbol
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
abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.Interface.Signature.MonoidConstantSymbol

/--
`GroupFirstOrderFunctions` TODO

Predicate logic:

  def GroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupFunctionSymbol
  arity
    | .mul => 2
    | .inv => 1

Predicate logic (unfolded):

  def GroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupFunctionSymbol
  arity
    | .mul => 2
    | .inv => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupFunctionSymbol
  arity
    | .mul => 2
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
def GroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupFunctionSymbol
  arity
    | .mul => 2
    | .inv => 1

/--
`GroupFirstOrderRelations` TODO

Predicate logic:

  def GroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def GroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupRelationSymbol
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
def GroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupRelationSymbol
  arity := Empty.elim

/--
`GroupFirstOrderSignature` TODO

Predicate logic:

  def GroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := GroupFirstOrderFunctions
  Relations := GroupFirstOrderRelations
  Constants := GroupConstantSymbol

Predicate logic (unfolded):

  def GroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := GroupFirstOrderFunctions
  Relations := GroupFirstOrderRelations
  Constants := GroupConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def GroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := GroupFirstOrderFunctions
  Relations := GroupFirstOrderRelations
  Constants := GroupConstantSymbol
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
def GroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := GroupFirstOrderFunctions
  Relations := GroupFirstOrderRelations
  Constants := GroupConstantSymbol

end LRA.AlgebraicStructures.Group.Interface.Signature
