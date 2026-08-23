import LRA.AlgebraicStructures.Field.Interface.Signature.Definition

namespace LRA.NumberSystems.ComplexNumbers.Interface.Signature

abbrev ComplexNumbersFunctionSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFunctionSymbol

abbrev ComplexNumbersRelationSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldRelationSymbol

abbrev ComplexNumbersConstantSymbol :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldConstantSymbol

def ComplexNumbersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderFunctions

def ComplexNumbersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderRelations

def ComplexNumbersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature

end LRA.NumberSystems.ComplexNumbers.Interface.Signature
