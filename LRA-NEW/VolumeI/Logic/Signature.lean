namespace LRA.VolumeI.Logic

/-!
Model-theoretic signatures for Volume I.

A signature is the non-logical vocabulary of an object logic: its function
symbols and relation symbols, each carrying an arity. This is deliberately
language-neutral in the model-theoretic sense -- it says nothing about
connectives, binders, or how formulas are built. `LogicalLanguage` (in
`Core.lean`) is the sibling notion for *logical* vocabulary (connectives);
`Signature` is for *non-logical* vocabulary (functions and relations).

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
-/

structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

/-!
Signatures.

A signature pairs an arity-indexed set of function symbols with an
arity-indexed set of relation symbols. Either component may be trivial
(`Empty`-symboled) for object logics that do not need it -- for instance, a
relational-only signature has no function symbols, and a purely equational
signature has no relation symbols beyond equality (which is treated as
logical, not part of the signature, in the usual first-order treatment).
-/

structure Signature where
  Functions : ArityIndexedSymbols
  Relations : ArityIndexedSymbols

abbrev Signature.FunctionSymbol (S : Signature) : Type :=
  S.Functions.Symbol

abbrev Signature.RelationSymbol (S : Signature) : Type :=
  S.Relations.Symbol

def Signature.functionArity (S : Signature) : S.FunctionSymbol -> Nat :=
  S.Functions.arity

def Signature.relationArity (S : Signature) : S.RelationSymbol -> Nat :=
  S.Relations.arity

/-!
Nullary, unary, and binary symbols are common enough special cases to name
directly, rather than restating `arity symbol = 0 / 1 / 2` at every use site.
-/

def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

def Signature.IsConstantSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsNullary symbol

def Signature.IsUnaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsUnary symbol

def Signature.IsBinaryFunctionSymbol (S : Signature) (symbol : S.FunctionSymbol) : Prop :=
  S.Functions.IsBinary symbol

def Signature.IsUnaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsUnary symbol

def Signature.IsBinaryRelationSymbol (S : Signature) (symbol : S.RelationSymbol) : Prop :=
  S.Relations.IsBinary symbol

end LRA.VolumeI.Logic
