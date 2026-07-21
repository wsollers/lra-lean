namespace LRA.VolumeI.Logic

/-!
Arity-indexed symbol sets.

The recurring shape underlying arity-carrying vocabulary -- a first-order
signature's function and relation symbols, and any other object logic's
arity-indexed non-logical vocabulary -- is a type of symbols together with
a `Nat`-valued arity for each symbol. Naming this once here means no
consumer (`Signature` in `Language.FirstOrder`, or any future one) has to
restate the pairing by hand.
-/

structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

/-!
Nullary, unary, and binary symbols are common enough special cases to name
directly, rather than restating `arity symbol = 0 / 1 / 2` at every use
site.
-/

def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

end LRA.VolumeI.Logic
