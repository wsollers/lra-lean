import LRA.NumberSystems.Arithmetic.Model.FirstOrderSignature

namespace LRA.NumberSystems.GaussianIntegers.Interface.Signature

abbrev GaussianIntegersFunctionSymbol :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingFunctionSymbol

abbrev GaussianIntegersRelationSymbol :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingRelationSymbol

abbrev GaussianIntegersConstantSymbol :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingConstantSymbol

def GaussianIntegersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingFirstOrderFunctions

def GaussianIntegersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingFirstOrderRelations

def GaussianIntegersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.NumberSystems.Arithmetic.Model.ArithmeticRingFirstOrderSignature

end LRA.NumberSystems.GaussianIntegers.Interface.Signature
