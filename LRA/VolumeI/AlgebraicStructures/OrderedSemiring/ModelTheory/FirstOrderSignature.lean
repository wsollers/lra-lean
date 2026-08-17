import LRA.VolumeI.Logic.Model.Model

namespace LRA.AlgebraicStructures.OrderedSemiring.ModelTheory

/-!
First-order signature for ordered semirings.

This file owns the ordinary first-order ordered-semiring vocabulary: constants
`0`, `1`, binary addition and multiplication, and the strict order relation.
-/

inductive OrderedSemiringFunctionSymbol where
  | add
  | mul

inductive OrderedSemiringRelationSymbol where
  | lt

inductive OrderedSemiringConstantSymbol where
  | zero
  | one

def OrderedSemiringFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringFunctionSymbol
  arity
    | .add => 2
    | .mul => 2

def OrderedSemiringFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedSemiringRelationSymbol
  arity
    | .lt => 2

def OrderedSemiringFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedSemiringFirstOrderFunctions
  Relations := OrderedSemiringFirstOrderRelations
  Constants := OrderedSemiringConstantSymbol

end LRA.AlgebraicStructures.OrderedSemiring.ModelTheory
