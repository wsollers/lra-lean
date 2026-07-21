namespace LRA.VolumeI.Logic

/-!
Model-theoretic signatures for Volume I.

A signature is the non-logical vocabulary of an object logic: its relation
symbols, function symbols, and constant symbols. This is deliberately
language-neutral in the model-theoretic sense -- it says nothing about
connectives, binders, or how formulas are built. Connectives, quantifiers,
and punctuation are fixed notation shared across (almost) every object logic
built on a signature, not per-signature data; they belong in a separate
notation layer, not here.

`R`, `F`, and `C` (relation symbols, function symbols, constant symbols) are
three mutually disjoint sets, per the alphabet definition: constants are not
represented as arity-0 function symbols here. They are their own kind of
symbol, carrying no arity at all, because a constant simply denotes a fixed
element -- there is no argument count to attach a map to.

First-order logic is the first consumer, but any object logic with an
arity-indexed non-logical vocabulary -- many-sorted logic, second-order logic,
algebraic signatures for universal algebra -- can reuse `Signature` instead of
re-declaring the symbol/arity pairing by hand.
-/

/-!
Arity-indexed symbol sets.

The recurring shape underlying both function symbols and relation symbols is
a type of symbols together with a `Nat`-valued arity for each symbol. Naming
this once means `Signature` does not have to restate the pairing twice.
Constant symbols do not use this shape -- see the note on `Signature` above.
-/

structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

/-!
Signatures.

A signature consists of three mutually disjoint sets: relation symbols,
function symbols, and constant symbols. Relation and function symbols carry
an arity; constant symbols do not, since a constant is understood to denote
a single fixed element, not to be applied to arguments.
-/

structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols
  Constants : Type

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
Nullary, unary, and binary symbols are common enough special cases to name
directly, rather than restating `arity symbol = 0 / 1 / 2` at every use site.
These apply to `Functions` and `Relations` only -- `Constants` has no arity
map to state such a predicate about.
-/

def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.VolumeI.Logic
