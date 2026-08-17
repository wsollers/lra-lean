import LRA.VolumeI.AlgebraicStructures.Field.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.OrderedField.ModelTheory

/-!
First-order signature for ordered fields.

The operation vocabulary is exactly the field operation vocabulary; the
ordered-field language enriches it by one binary strict-order relation.
-/

abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.ModelTheory.FieldFunctionSymbol

inductive OrderedFieldRelationSymbol where
  | lt

abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.ModelTheory.FieldConstantSymbol

def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.ModelTheory.FieldFirstOrderFunctions

def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

end LRA.AlgebraicStructures.OrderedField.ModelTheory
