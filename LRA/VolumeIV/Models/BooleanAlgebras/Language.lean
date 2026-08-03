import LRA.VolumeI.Logic

namespace LRA.VolumeIV.Models.BooleanAlgebras

/-!
First-order language for Boolean algebras.
-/

/-- Function symbols for the Boolean-algebra language `(0, 1, ∨, ∧, ¬)`. -/
inductive BooleanAlgebraFunctionSymbol where
  | join
  | meet
  | complement

/-- Boolean algebras have no primitive relation symbols in this language. -/
def BooleanAlgebraRelationSymbol : Type := Empty

/-- Constant symbols for the Boolean-algebra language. -/
inductive BooleanAlgebraConstantSymbol where
  | zero
  | one

/-- Arity assignment for Boolean-algebra function symbols. -/
def BooleanAlgebraFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

/-- Arity assignment for Boolean-algebra relation symbols. -/
def BooleanAlgebraFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim

/-- The first-order Boolean-algebra language `(0, 1, ∨, ∧, ¬)`. -/
def BooleanAlgebraFirstOrderLanguage : LRA.VolumeI.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol

end LRA.VolumeIV.Models.BooleanAlgebras
