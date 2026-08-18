import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic

/-!
Model-theoretic signatures for Volume I.

A signature is the non-logical vocabulary of a first-order-style object
logic: its relation symbols, function symbols, and constant symbols. This
is deliberately language-neutral in the model-theoretic sense -- it says
nothing about connectives, binders, or how formulas are built. Connectives,
quantifiers, and punctuation are fixed notation shared across (almost)
every object logic built on a signature, not per-signature data; they
belong in a separate notation layer, not here.

`R`, `F`, and `C` (relation symbols, function symbols, constant symbols) are
three mutually disjoint sets, per the alphabet definition: constants are not
represented as arity-0 function symbols here. They are their own kind of
symbol, carrying no arity at all, because a constant simply denotes a fixed
element -- there is no argument count to attach a map to.

`Signature` and `FirstOrderLanguage` name exactly the same structure --
some sources call this data a language, others a signature. Both names are
kept, as an explicit record of that terminological variance across sources,
rather than picking one and losing the correspondence to books that use the
other term.

Second-order logic (monadic, Henkin semantics) reuses this same
`Signature`/`FirstOrderLanguage` unchanged -- second-order quantification
adds a new *syntactic* category (relation/set variables) on top of a
formula language, and touches nothing about the fixed, non-logical
vocabulary a theory already has. A second-order language accordingly
aliases the same `Signature`, purely for documentation at call sites (see
`Language.SecondOrderMonadic`), not because it carries different data.
-/

/--
`Signature` packages the data and laws for signature.

Logical form:

```lean
structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type
```
-/
structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

/-- `FirstOrderLanguage` is exactly `Signature` -- see the module doc for
why both names are kept.

Logical form:

```lean
abbrev FirstOrderLanguage := Signature
```
-/
abbrev FirstOrderLanguage := Signature

/--
`Signature.FunctionSymbol` abbreviates the displayed type or object for function symbol.

Logical form:

```lean
abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol
```
-/
abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

/--
`Signature.RelationSymbol` abbreviates the displayed type or object for relation symbol.

Logical form:

```lean
abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol
```
-/
abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

/--
`Signature.ConstantSymbol` abbreviates the displayed type or object for constant symbol.

Logical form:

```lean
abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants
```
-/
abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants

/--
`Signature.functionArity` defines the displayed object for function arity.

Logical form:

```lean
def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity
```
-/
def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

/--
`Signature.relationArity` defines the displayed object for relation arity.

Logical form:

```lean
def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity
```
-/
def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

/-!
Nullary, unary, and binary function/relation symbols are common enough
special cases to name directly, rather than restating
`arity symbol = 0 / 1 / 2` at every use site.
-/

/--
`Signature.IsUnaryFunctionSymbol` defines the displayed object for is unary function symbol.

Logical form:

```lean
def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol
```
-/
def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

/--
`Signature.IsBinaryFunctionSymbol` defines the displayed object for is binary function symbol.

Logical form:

```lean
def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol
```
-/
def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

/--
`Signature.IsUnaryRelationSymbol` defines the displayed object for is unary relation symbol.

Logical form:

```lean
def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol
```
-/
def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

/--
`Signature.IsBinaryRelationSymbol` defines the displayed object for is binary relation symbol.

Logical form:

```lean
def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol
```
-/
def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.Logic
