import LRA.AlgebraicStructures.Semigroup.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.Monoid.Interface.Signature

   
                                  

                                                                             
  

abbrev MonoidFunctionSymbol :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFunctionSymbol

def MonoidRelationSymbol : Type := Empty

inductive MonoidConstantSymbol where
  | one

def MonoidFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Semigroup.Interface.Signature.SemigroupFirstOrderFunctions

def MonoidFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

def MonoidFirstOrderSignature : LRA.Logic.Signature where
  Functions := MonoidFirstOrderFunctions
  Relations := MonoidFirstOrderRelations
  Constants := MonoidConstantSymbol

end LRA.AlgebraicStructures.Monoid.Interface.Signature
