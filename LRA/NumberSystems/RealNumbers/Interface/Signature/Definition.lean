import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition

namespace LRA.NumberSystems.RealNumbers.Interface.Signature

abbrev RealNumbersFunctionSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFunctionSymbol

abbrev RealNumbersRelationSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldRelationSymbol

abbrev RealNumbersConstantSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldConstantSymbol

def RealNumbersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderFunctions

def RealNumbersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderRelations

def RealNumbersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature

end LRA.NumberSystems.RealNumbers.Interface.Signature
