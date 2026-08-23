import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition

namespace LRA.NumberSystems.RationalNumbers.Interface.Signature

abbrev RationalNumbersFunctionSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFunctionSymbol

abbrev RationalNumbersRelationSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldRelationSymbol

abbrev RationalNumbersConstantSymbol :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldConstantSymbol

def RationalNumbersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderFunctions

def RationalNumbersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderRelations

def RationalNumbersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature

end LRA.NumberSystems.RationalNumbers.Interface.Signature
