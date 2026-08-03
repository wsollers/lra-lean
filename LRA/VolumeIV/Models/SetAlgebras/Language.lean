import LRA.VolumeI.Logic

namespace LRA.VolumeIV.Models.SetAlgebras

/-!
First-order language for algebras of sets.
-/

/-- Function symbols for the set-algebra language `(0, 1, ∪, ∩, complement)`. -/
inductive SetAlgebraFunctionSymbol where
  | join
  | meet
  | complement

/-- Set algebras have no primitive relation symbols in this language. -/
def SetAlgebraRelationSymbol : Type := Empty

/-- Constant symbols for the set-algebra language. -/
inductive SetAlgebraConstantSymbol where
  | zero
  | one

/-- Arity assignment for set-algebra function symbols. -/
def SetAlgebraFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

/-- Arity assignment for set-algebra relation symbols. -/
def SetAlgebraFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraRelationSymbol
  arity := Empty.elim

/-- The first-order set-algebra language `(0, 1, ∪, ∩, complement)`. -/
def SetAlgebraFirstOrderLanguage : LRA.VolumeI.Logic.Signature where
  Functions := SetAlgebraFirstOrderFunctions
  Relations := SetAlgebraFirstOrderRelations
  Constants := SetAlgebraConstantSymbol

end LRA.VolumeIV.Models.SetAlgebras
