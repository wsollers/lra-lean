import LRA.AlgebraicStructures.Group.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.Signature

/--
`OrderedGroupFunctionSymbol` TODO

Predicate logic:

  abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFunctionSymbol

Predicate logic (unfolded):

  abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFunctionSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFunctionSymbol
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
abbrev OrderedGroupFunctionSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFunctionSymbol

/--
`OrderedGroupRelationSymbol` TODO

Predicate logic:

  inductive OrderedGroupRelationSymbol where
  | lt

Predicate logic (unfolded):

  inductive OrderedGroupRelationSymbol where
  | lt (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedGroupRelationSymbol where
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
inductive OrderedGroupRelationSymbol where
  | lt

/--
`OrderedGroupConstantSymbol` TODO

Predicate logic:

  abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupConstantSymbol

Predicate logic (unfolded):

  abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupConstantSymbol
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
abbrev OrderedGroupConstantSymbol :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupConstantSymbol

/--
`OrderedGroupFirstOrderFunctions` TODO

Predicate logic:

  def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFirstOrderFunctions

Predicate logic (unfolded):

  def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFirstOrderFunctions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFirstOrderFunctions
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
def OrderedGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Group.Interface.Signature.GroupFirstOrderFunctions

/--
`OrderedGroupFirstOrderRelations` TODO

Predicate logic:

  def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
  arity
    | .lt => 2

Predicate logic (unfolded):

  def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
  arity
    | .lt => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
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
def OrderedGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedGroupRelationSymbol
  arity
    | .lt => 2

/--
`OrderedGroupFirstOrderSignature` TODO

Predicate logic:

  def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol

Predicate logic (unfolded):

  def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol
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
def OrderedGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedGroupFirstOrderFunctions
  Relations := OrderedGroupFirstOrderRelations
  Constants := OrderedGroupConstantSymbol

end LRA.AlgebraicStructures.OrderedGroup.Interface.Signature
