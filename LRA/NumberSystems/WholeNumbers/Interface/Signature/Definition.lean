import LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.Definition

namespace LRA.NumberSystems.WholeNumbers.Interface.Signature

abbrev WholeNumbersFunctionSymbol :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFunctionSymbol

abbrev WholeNumbersRelationSymbol :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringRelationSymbol

abbrev WholeNumbersConstantSymbol :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringConstantSymbol

def WholeNumbersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderFunctions

def WholeNumbersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderRelations

def WholeNumbersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature

end LRA.NumberSystems.WholeNumbers.Interface.Signature
