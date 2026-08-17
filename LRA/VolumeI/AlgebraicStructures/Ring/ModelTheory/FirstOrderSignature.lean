import LRA.VolumeI.Logic.Model.Model

namespace LRA.AlgebraicStructures.Ring.ModelTheory

/-!
First-order signature for rings.

The ring language has constants `0` and `1`, binary addition and
multiplication, and unary negation.
-/

inductive RingFunctionSymbol where
  | add
  | mul
  | neg

def RingRelationSymbol : Type := Empty

inductive RingConstantSymbol where
  | zero
  | one

def RingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := RingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

def RingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := RingRelationSymbol
  arity := Empty.elim

def RingFirstOrderSignature : LRA.Logic.Signature where
  Functions := RingFirstOrderFunctions
  Relations := RingFirstOrderRelations
  Constants := RingConstantSymbol

end LRA.AlgebraicStructures.Ring.ModelTheory
