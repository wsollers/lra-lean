import LRA.Function.Examples.Canonical
import LRA.Function.Properties.FailureModes

/-!
The two canonical failures, witnessed at concrete carriers.

`collapse` shows that a function can have a collision, and so fail injectivity;
`shift` shows that a function can miss a value, and so fail surjectivity. These
are the worked instances of `HasCollision` and `MissesValue`.
-/

namespace LRA.Function.Examples

/-- Collapsing both Booleans to one value is a collision. -/
theorem CollapseHasCollision : HasCollision collapse := by
  sorry

/-- Collapsing both Booleans to one value is therefore not injective. -/
theorem CollapseNotInjective : ¬ Injective collapse := by
  sorry

/-- Successor never returns zero. -/
theorem ShiftMissesZero : MissesValue shift := by
  sorry

/-- Successor is therefore not surjective. -/
theorem ShiftNotSurjective : ¬ Surjective shift := by
  sorry

end LRA.Function.Examples
