import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature

inductive CommutativeSemiringWithoutZeroFunctionSymbol where
  | add
  | mul

def CommutativeSemiringWithoutZeroRelationSymbol : Type := Empty

inductive CommutativeSemiringWithoutZeroConstantSymbol where
  | one

def CommutativeSemiringWithoutZeroFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := CommutativeSemiringWithoutZeroFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def CommutativeSemiringWithoutZeroFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := CommutativeSemiringWithoutZeroRelationSymbol
  arity := Empty.elim

def CommutativeSemiringWithoutZeroFirstOrderSignature : LRA.Logic.Signature where
  Functions := CommutativeSemiringWithoutZeroFirstOrderFunctions
  Relations := CommutativeSemiringWithoutZeroFirstOrderRelations
  Constants := CommutativeSemiringWithoutZeroConstantSymbol

end LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Signature
