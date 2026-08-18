import LRA.Function.Canonical.Identity.Definition
import LRA.Function.Properties.Definition
import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u

/-- The identity function evaluates to its input. -/
theorem IdentityFunctionValue
    {Carrier : Type u} (input : Carrier) :
    IdentityFunction Carrier input = input := by
  sorry

/-- The identity function is injective. -/
theorem IdentityFunctionInjective {Carrier : Type u} :
    Injective (IdentityFunction Carrier) := by
  sorry

/-- The identity function is surjective. -/
theorem IdentityFunctionSurjective {Carrier : Type u} :
    Surjective (IdentityFunction Carrier) := by
  sorry

/-- The identity function is bijective. -/
theorem IdentityFunctionBijective {Carrier : Type u} :
    Bijective (IdentityFunction Carrier) := by
  sorry

/-- The identity function is its own two-sided inverse. -/
theorem IdentityFunctionTwoSidedInverse (Carrier : Type u) :
    TwoSidedInverse (IdentityFunction Carrier) (IdentityFunction Carrier) := by
  sorry

end LRA.Function
