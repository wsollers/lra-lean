import LRA.NumberSystems.Presburger.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.Presburger.Interface.UniversalAlgebra

open LRA.NumberSystems.Presburger.Interface.Signature

def PresburgerAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := PresburgerFunctionSymbol
  arity := PresburgerFirstOrderFunctions.arity
  ConstantSymbol := PresburgerConstantSymbol

end LRA.NumberSystems.Presburger.Interface.UniversalAlgebra
