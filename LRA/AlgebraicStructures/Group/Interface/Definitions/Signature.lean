import LRA.AlgebraicStructures.Monoid.Interface.Definitions.Signature

namespace LRA.AlgebraicStructures.Group.Interface.Signature

/-- A group's first-order signature: `Monoid`'s function symbol (`mul`) plus
one more for the unary inverse operation (`inv`). -/
inductive GroupFunctionSymbol where
  | mul
  | inv

def GroupRelationSymbol : Type := Empty

/-- Reuses `Monoid`'s constant symbol — a group still has just the one
constant, `one`. -/
abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.Interface.Signature.MonoidConstantSymbol

def GroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupFunctionSymbol
  arity
    | .mul => 2
    | .inv => 1

def GroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := GroupRelationSymbol
  arity := Empty.elim

def GroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := GroupFirstOrderFunctions
  Relations := GroupFirstOrderRelations
  Constants := GroupConstantSymbol

end LRA.AlgebraicStructures.Group.Interface.Signature
