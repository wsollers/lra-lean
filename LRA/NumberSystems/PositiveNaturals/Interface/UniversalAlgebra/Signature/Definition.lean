import LRA.NumberSystems.PositiveNaturals.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.PositiveNaturals.Interface.UniversalAlgebra

open LRA.NumberSystems.PositiveNaturals.Interface.Signature

def PositiveNaturalsAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := PositiveNaturalsFunctionSymbol
  arity := PositiveNaturalsFirstOrderFunctions.arity
  ConstantSymbol := PositiveNaturalsConstantSymbol

end LRA.NumberSystems.PositiveNaturals.Interface.UniversalAlgebra
