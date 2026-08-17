import LRA.VolumeI.AlgebraicStructures.Semigroup.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.Monoid.ModelTheory

/-!
First-order signature for monoids.

This extends the semigroup vocabulary by one distinguished identity constant.
-/

abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.ModelTheory.SemigroupFunctionSymbol

def MonoidRelationSymbol : Type := Empty

inductive MonoidConstantSymbol where
  | one

def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.ModelTheory.SemigroupFirstOrderFunctions

def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol

end LRA.AlgebraicStructures.Monoid.ModelTheory
