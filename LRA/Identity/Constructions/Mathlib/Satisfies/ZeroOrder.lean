import LRA.Identity.Interface.ZeroOrder

namespace LRA.Identity.Constructions.Mathlib

/-- Native equality satisfies the pure-syntax identity interface. -/
theorem SatisfiesZeroOrderIdentity
    (L : LRA.Identity.Interface.ZeroOrder.LStructure)
    (M : LRA.Identity.Interface.ZeroOrder.Model L) :
    LRA.Identity.Interface.ZeroOrder.Theory L M := by
  sorry

end LRA.Identity.Constructions.Mathlib
