import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.DivisionRing.ModelTheory

/-!
First-order signature for division rings.

The division-ring language has constants `0` and `1`, binary addition and
multiplication, unary negation, and totalized unary inverse.
-/

inductive DivisionRingFunctionSymbol where
  | add
  | mul
  | neg
  | inv

def DivisionRingRelationSymbol : Type := Empty

inductive DivisionRingConstantSymbol where
  | zero
  | one

def DivisionRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def DivisionRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := DivisionRingRelationSymbol
  arity := Empty.elim

def DivisionRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := DivisionRingFirstOrderFunctions
  Relations := DivisionRingFirstOrderRelations
  Constants := DivisionRingConstantSymbol

end LRA.AlgebraicStructures.DivisionRing.ModelTheory
