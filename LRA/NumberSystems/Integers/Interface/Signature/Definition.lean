import LRA.AlgebraicStructures.OrderedRing.Interface.Signature.Definition

namespace LRA.NumberSystems.Integers.Interface.Signature

abbrev IntegersFunctionSymbol :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingFunctionSymbol

abbrev IntegersRelationSymbol :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingRelationSymbol

abbrev IntegersConstantSymbol :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingConstantSymbol

def IntegersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingFirstOrderFunctions

def IntegersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingFirstOrderRelations

def IntegersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.OrderedRing.Interface.Signature.OrderedRingFirstOrderSignature

end LRA.NumberSystems.Integers.Interface.Signature
