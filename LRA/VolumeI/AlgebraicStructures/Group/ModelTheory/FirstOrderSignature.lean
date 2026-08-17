import LRA.VolumeI.AlgebraicStructures.Monoid.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.Group.ModelTheory

/-!
First-order signature for multiplicative groups.

This extends the monoid vocabulary by unary inverse.
-/

inductive GroupFunctionSymbol where
  | mul
  | inv

def GroupRelationSymbol : Type := Empty

abbrev GroupConstantSymbol :=
  LRA.AlgebraicStructures.Monoid.ModelTheory.MonoidConstantSymbol

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

end LRA.AlgebraicStructures.Group.ModelTheory
