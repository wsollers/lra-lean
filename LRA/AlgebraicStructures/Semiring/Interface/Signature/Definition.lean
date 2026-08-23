import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.Semiring.Interface.Signature

inductive SemiringFunctionSymbol where
  | add
  | mul

def SemiringRelationSymbol : Type := Empty

inductive SemiringConstantSymbol where
  | zero
  | one

def SemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def SemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemiringRelationSymbol
  arity := Empty.elim

def SemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemiringFirstOrderFunctions
  Relations := SemiringFirstOrderRelations
  Constants := SemiringConstantSymbol

end LRA.AlgebraicStructures.Semiring.Interface.Signature
