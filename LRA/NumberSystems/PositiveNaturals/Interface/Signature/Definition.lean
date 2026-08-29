import LRA.NumberSystems.NaturalNumbers.Interface.Signature.Definition

namespace LRA.NumberSystems.PositiveNaturals.Interface.Signature

abbrev PositiveNaturalsFunctionSymbol :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersFunctionSymbol

abbrev PositiveNaturalsRelationSymbol :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersRelationSymbol

abbrev PositiveNaturalsConstantSymbol :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersConstantSymbol

def PositiveNaturalsFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersFirstOrderFunctions

def PositiveNaturalsFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersFirstOrderRelations

def PositiveNaturalsFirstOrderSignature : LRA.Logic.Signature :=
  LRA.NumberSystems.NaturalNumbers.Interface.Signature.NaturalNumbersFirstOrderSignature

end LRA.NumberSystems.PositiveNaturals.Interface.Signature
