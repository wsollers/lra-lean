import LRA.AlgebraicStructures.Semigroup.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.Monoid.Interface.Signature

/--
`MonoidFunctionSymbol` TODO

Predicate logic:

  abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFunctionSymbol

Predicate logic (unfolded):

  abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFunctionSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFunctionSymbol
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
abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFunctionSymbol

/--
`MonoidRelationSymbol` TODO

Predicate logic:

  def MonoidRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def MonoidRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MonoidRelationSymbol : Type := Empty
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
def MonoidRelationSymbol : Type := Empty

/--
`MonoidConstantSymbol` TODO

Predicate logic:

  inductive MonoidConstantSymbol where
  | one

Predicate logic (unfolded):

  inductive MonoidConstantSymbol where
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MonoidConstantSymbol where
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
inductive MonoidConstantSymbol where
  | one

/--
`MonoidFirstOrderFunctions` TODO

Predicate logic:

  def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFirstOrderFunctions

Predicate logic (unfolded):

  def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFirstOrderFunctions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFirstOrderFunctions
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
def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFirstOrderFunctions

/--
`MonoidFirstOrderRelations` TODO

Predicate logic:

  def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
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
def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

/--
`MonoidFirstOrderSignature` TODO

Predicate logic:

  def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol

Predicate logic (unfolded):

  def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol
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
def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol

end LRA.AlgebraicStructures.Monoid.Interface.Signature
