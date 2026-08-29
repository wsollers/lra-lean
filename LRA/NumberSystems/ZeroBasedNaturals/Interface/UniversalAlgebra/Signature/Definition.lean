import LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.UniversalAlgebra

open LRA.NumberSystems.ZeroBasedNaturals.Interface.Signature

def ZeroBasedNaturalsAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := ZeroBasedNaturalsFunctionSymbol
  arity := ZeroBasedNaturalsFirstOrderFunctions.arity
  ConstantSymbol := ZeroBasedNaturalsConstantSymbol

end LRA.NumberSystems.ZeroBasedNaturals.Interface.UniversalAlgebra
