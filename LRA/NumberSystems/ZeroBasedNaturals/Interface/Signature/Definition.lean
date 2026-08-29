import LRA.NumberSystems.WholeNumbers.Interface.Signature.Definition

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature

abbrev ZeroBasedNaturalsFunctionSymbol :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersFunctionSymbol

abbrev ZeroBasedNaturalsRelationSymbol :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersRelationSymbol

abbrev ZeroBasedNaturalsConstantSymbol :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersConstantSymbol

def ZeroBasedNaturalsFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersFirstOrderFunctions

def ZeroBasedNaturalsFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersFirstOrderRelations

def ZeroBasedNaturalsFirstOrderSignature : LRA.Logic.Signature :=
  LRA.NumberSystems.WholeNumbers.Interface.Signature.WholeNumbersFirstOrderSignature

end LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature
