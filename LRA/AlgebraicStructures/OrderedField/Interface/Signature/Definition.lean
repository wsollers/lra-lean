import LRA.AlgebraicStructures.Field.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.OrderedField.Interface.Signature

/-!
First-order signature for ordered fields.

The operation vocabulary is exactly the field operation vocabulary; the
ordered-field language enriches it by one binary strict-order relation.
-/

abbrev OrderedFieldFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol

inductive OrderedFieldRelationSymbol where
  | lt

abbrev OrderedFieldConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol

def OrderedFieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions

def OrderedFieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedFieldRelationSymbol
  arity
    | .lt => 2

def OrderedFieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedFieldFirstOrderFunctions
  Relations := OrderedFieldFirstOrderRelations
  Constants := OrderedFieldConstantSymbol

end LRA.AlgebraicStructures.OrderedField.Interface.Signature
