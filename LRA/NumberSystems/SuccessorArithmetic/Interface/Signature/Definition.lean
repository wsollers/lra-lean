import LRA.ModelTheory.Model

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.Signature

inductive SuccessorArithmeticFunctionSymbol where
  | successor

def SuccessorArithmeticRelationSymbol : Type := Empty

inductive SuccessorArithmeticConstantSymbol where
  | zero

def SuccessorArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticFunctionSymbol
  arity
    | .successor => 1

def SuccessorArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SuccessorArithmeticRelationSymbol
  arity := Empty.elim

def SuccessorArithmeticFirstOrderSignature : LRA.Logic.Signature where
  Functions := SuccessorArithmeticFirstOrderFunctions
  Relations := SuccessorArithmeticFirstOrderRelations
  Constants := SuccessorArithmeticConstantSymbol

end LRA.NumberSystems.SuccessorArithmetic.Interface.Signature
