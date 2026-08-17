import LRA.VolumeI.Logic.Model.Model

namespace LRA.AlgebraicStructures.Semigroup.ModelTheory

/-!
First-order signature for semigroups.

The semigroup language has one binary multiplication symbol and no constants
or relation symbols.
-/

inductive SemigroupFunctionSymbol where
  | mul

def SemigroupRelationSymbol : Type := Empty
def SemigroupConstantSymbol : Type := Empty

def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
    | .mul => 2

def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
  arity := Empty.elim

def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol

end LRA.AlgebraicStructures.Semigroup.ModelTheory
