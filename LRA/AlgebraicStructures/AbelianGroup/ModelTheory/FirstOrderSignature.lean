import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.AbelianGroup.ModelTheory

/-!
First-order signature for abelian groups in additive notation.

The abelian-group language has binary addition, unary negation, and the
distinguished zero constant. Commutativity is a law, not a symbol.
-/

inductive AbelianGroupFunctionSymbol where
  | add
  | neg

def AbelianGroupRelationSymbol : Type := Empty

inductive AbelianGroupConstantSymbol where
  | zero

def AbelianGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AbelianGroupFunctionSymbol
  arity
    | .add => 2
    | .neg => 1

def AbelianGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AbelianGroupRelationSymbol
  arity := Empty.elim

def AbelianGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := AbelianGroupFirstOrderFunctions
  Relations := AbelianGroupFirstOrderRelations
  Constants := AbelianGroupConstantSymbol

end LRA.AlgebraicStructures.AbelianGroup.ModelTheory
