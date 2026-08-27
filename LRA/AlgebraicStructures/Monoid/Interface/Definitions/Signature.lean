import LRA.AlgebraicStructures.Semigroup.Interface.Definitions.Signature

namespace LRA.AlgebraicStructures.Monoid.Interface.Signature

/-- A monoid's first-order signature: `Semigroup`'s function symbol (`mul`)
plus one constant symbol (`one`) for the identity element. -/
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
