import LRA.Logic.Model.Model

namespace LRA.NumberSystems.Arithmetic.Model

/-!
First-order arithmetic-ring vocabulary used by concrete Volume II
constructions that expose only `0`, `1`, addition, and multiplication.
-/

inductive ArithmeticRingFunctionSymbol where
  | add
  | mul

def ArithmeticRingRelationSymbol : Type := Empty

inductive ArithmeticRingConstantSymbol where
  | zero
  | one

def ArithmeticRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def ArithmeticRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := ArithmeticRingRelationSymbol
  arity := Empty.elim

def ArithmeticRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := ArithmeticRingFirstOrderFunctions
  Relations := ArithmeticRingFirstOrderRelations
  Constants := ArithmeticRingConstantSymbol

end LRA.NumberSystems.Arithmetic.Model
