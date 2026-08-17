import LRA.Function.Operations.Inverse.Definition
import LRA.Function.Calculus.Definition

namespace LRA.Function

universe u v

/-- A bijective function followed by its inverse returns the original input. -/
theorem InverseAfterFunctionValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (bijective : Bijective function)
    (input : Domain) :
    Value (Inverse function bijective) (Value function input) = input := by
  sorry

/-- The inverse followed by the original bijection returns the original output. -/
theorem FunctionAfterInverseValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (bijective : Bijective function)
    (output : Codomain) :
    Value function (Value (Inverse function bijective) output) = output := by
  sorry

end LRA.Function
