import LRA.Set.ZFC.Axioms.Infinity
import LRA.Set.ZFC.Definitions

/-!
Existence of an inductive set.

Unlike Empty Set, Pairing, Union, and Power Set, Infinity does not pin down a
unique object: many inductive sets exist, so there is no chosen witness or
uniqueness theorem here.
-/

namespace LRA.Set.ZFC

/-- There exists an inductive set. This is the Axiom of Infinity restated
using the named `IsInductiveSet` predicate. -/
theorem InductiveSetExists :
    ∃ A : Set, IsInductiveSet A := by
  sorry

end LRA.Set.ZFC
