import LRA.VolumeI.Logic

namespace LRA.VolumeIV.Models.SetRings

/-!
First-order language for rings of sets.
-/

/-- Function symbols for the set-ring language `(0, ∪, ∩, \)`. -/
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference

/-- Set rings have no primitive relation symbols in this language. -/
def SetRingRelationSymbol : Type := Empty

/-- Constant symbols for the set-ring language. -/
inductive SetRingConstantSymbol where
  | zero

/-- Arity assignment for set-ring function symbols. -/
def SetRingFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2

/-- Arity assignment for set-ring relation symbols. -/
def SetRingFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim

/-- The first-order set-ring language `(0, ∪, ∩, \)`. -/
def SetRingFirstOrderLanguage : LRA.VolumeI.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol

end LRA.VolumeIV.Models.SetRings
