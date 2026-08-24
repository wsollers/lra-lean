import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic

/--
`Signature` TODO

Predicate logic:

  structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

Predicate logic (unfolded):

  structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type
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
structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

/--
`FirstOrderLanguage` TODO

Predicate logic:

  abbrev FirstOrderLanguage := Signature

Predicate logic (unfolded):

  abbrev FirstOrderLanguage := Signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FirstOrderLanguage := Signature
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
abbrev FirstOrderLanguage := Signature

/--
`Signature.FunctionSymbol` TODO

Predicate logic:

  abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

Predicate logic (unfolded):

  abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol
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
abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

/--
`Signature.RelationSymbol` TODO

Predicate logic:

  abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

Predicate logic (unfolded):

  abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol
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
abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

/--
`Signature.ConstantSymbol` TODO

Predicate logic:

  abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants

Predicate logic (unfolded):

  abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants
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
abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants

/--
`Signature.functionArity` TODO

Predicate logic:

  def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

Predicate logic (unfolded):

  def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

/--
`Signature.relationArity` TODO

Predicate logic:

  def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

Predicate logic (unfolded):

  def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

/--
`Signature.IsUnaryFunctionSymbol` TODO

Predicate logic:

  ∀ (S : LRA.Logic.Signature) (symbol : S.FunctionSymbol), S.Functions.arity symbol = 1

Predicate logic (unfolded):

  ∀ (S : LRA.Logic.Signature) (symbol : S.Functions.1), S.Functions.2 symbol = instOfNatNat 1.1

Logical form (Lean):

```lean
def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol
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
def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

/--
`Signature.IsBinaryFunctionSymbol` TODO

Predicate logic:

  ∀ (S : LRA.Logic.Signature) (symbol : S.FunctionSymbol), S.Functions.arity symbol = 2

Predicate logic (unfolded):

  ∀ (S : LRA.Logic.Signature) (symbol : S.Functions.1), S.Functions.2 symbol = instOfNatNat 2.1

Logical form (Lean):

```lean
def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol
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
def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

/--
`Signature.IsUnaryRelationSymbol` TODO

Predicate logic:

  ∀ (S : LRA.Logic.Signature) (symbol : S.RelationSymbol), S.Relations.arity symbol = 1

Predicate logic (unfolded):

  ∀ (S : LRA.Logic.Signature) (symbol : S.Relations.1), S.Relations.2 symbol = instOfNatNat 1.1

Logical form (Lean):

```lean
def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol
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
def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

/--
`Signature.IsBinaryRelationSymbol` TODO

Predicate logic:

  ∀ (S : LRA.Logic.Signature) (symbol : S.RelationSymbol), S.Relations.arity symbol = 2

Predicate logic (unfolded):

  ∀ (S : LRA.Logic.Signature) (symbol : S.Relations.1), S.Relations.2 symbol = instOfNatNat 2.1

Logical form (Lean):

```lean
def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol
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
def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.Logic
