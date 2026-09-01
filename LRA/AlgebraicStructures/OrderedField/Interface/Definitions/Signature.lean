import LRA.AlgebraicStructures.Field.Interface.Definitions.Signature

namespace LRA.AlgebraicStructures.OrderedField.Interface.Signature

/--
`OrderedFieldFunctionSymbol` TODO

Predicate logic:

  abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol

Predicate logic (unfolded):

  abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol
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
abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol

/--
`OrderedFieldRelationSymbol` TODO

Predicate logic:

  inductive OrderedFieldRelationSymbol where
  | lt

Predicate logic (unfolded):

  inductive OrderedFieldRelationSymbol where
  | lt (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedFieldRelationSymbol where
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
inductive OrderedFieldRelationSymbol where
  | lt

/--
`OrderedFieldConstantSymbol` TODO

Predicate logic:

  abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol

Predicate logic (unfolded):

  abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol
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
abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol

/--
`OrderedFieldFirstOrderFunctions` TODO

Predicate logic:

  def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions

Predicate logic (unfolded):

  def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions
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
def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions

/--
`OrderedFieldFirstOrderRelations` TODO

Predicate logic:

  def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

Predicate logic (unfolded):

  def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
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
def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

/--
`OrderedFieldFirstOrderSignature` TODO

Predicate logic:

  def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

Predicate logic (unfolded):

  def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol
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
def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

end LRA.AlgebraicStructures.OrderedField.Interface.Signature
