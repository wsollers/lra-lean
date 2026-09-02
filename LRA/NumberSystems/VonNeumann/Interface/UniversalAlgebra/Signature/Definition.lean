import LRA.NumberSystems.VonNeumann.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra

open LRA.NumberSystems.VonNeumann.Interface.Signature

def VonNeumannAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := VonNeumannFunctionSymbol
  arity := VonNeumannFirstOrderFunctions.arity
  ConstantSymbol := VonNeumannConstantSymbol

end LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra
