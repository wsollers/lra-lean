import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.Semigroup.Interface.Signature

/--
`SemigroupFunctionSymbol` TODO

Predicate logic:

  inductive SemigroupFunctionSymbol where
  | mul

Predicate logic (unfolded):

  inductive SemigroupFunctionSymbol where
  | mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive SemigroupFunctionSymbol where
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
inductive SemigroupFunctionSymbol where
  | mul

/--
`SemigroupRelationSymbol` TODO

Predicate logic:

  def SemigroupRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def SemigroupRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemigroupRelationSymbol : Type := Empty
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
def SemigroupRelationSymbol : Type := Empty

/--
`SemigroupConstantSymbol` TODO

Predicate logic:

  def SemigroupConstantSymbol : Type := Empty

Predicate logic (unfolded):

  def SemigroupConstantSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemigroupConstantSymbol : Type := Empty
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
def SemigroupConstantSymbol : Type := Empty

/--
`SemigroupFirstOrderFunctions` TODO

Predicate logic:

  def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
    | .mul => 2

Predicate logic (unfolded):

  def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
    | .mul => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
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
def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
    | .mul => 2

/--
`SemigroupFirstOrderRelations` TODO

Predicate logic:

  def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
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
def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
  arity := Empty.elim

/--
`SemigroupFirstOrderSignature` TODO

Predicate logic:

  def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol

Predicate logic (unfolded):

  def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol
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
def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol

end LRA.AlgebraicStructures.Semigroup.Interface.Signature
