import LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.Definition

namespace LRA.NumberSystems.NaturalNumbers.Interface.Signature

abbrev NaturalNumbersFunctionSymbol :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFunctionSymbol

abbrev NaturalNumbersRelationSymbol :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringRelationSymbol

abbrev NaturalNumbersConstantSymbol :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringConstantSymbol

def NaturalNumbersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderFunctions

def NaturalNumbersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderRelations

def NaturalNumbersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature

end LRA.NumberSystems.NaturalNumbers.Interface.Signature
