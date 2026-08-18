import LRA.Function.Canonical.Identity.Definition

namespace LRA.Function

universe u

/-- The identity function evaluates to its input. -/
theorem IdentityFunctionValue
    {Carrier : Type u} (input : Carrier) :
    IdentityFunction Carrier input = input := by
  sorry

end LRA.Function
