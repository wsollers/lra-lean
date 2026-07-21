import LRA.VolumeI.Logic.Language.Symbols.Signature

namespace LRA.VolumeI.Logic

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

structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

/-- `FirstOrderLanguage` is exactly `Signature` -- see the module doc for
why both names are kept. -/
abbrev FirstOrderLanguage := Signature

abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

abbrev Signature.ConstantSymbol (S : Signature) : Type :=
  S.Constants

def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

/-!
Nullary, unary, and binary function/relation symbols are common enough
special cases to name directly, rather than restating
`arity symbol = 0 / 1 / 2` at every use site.
-/

def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.VolumeI.Logic
