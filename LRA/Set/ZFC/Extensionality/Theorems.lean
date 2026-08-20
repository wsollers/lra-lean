import LRA.Identity.Axioms
import LRA.Set.ZFC.Axioms.Extensionality

/-!
The textbook biconditional form of set extensionality.
-/

namespace LRA.Set.ZFC

/-- Two sets are equal if and only if they have the same members.

The forward direction is identity substitution. The reverse direction is the
Axiom of Extensionality.
-/
theorem SetEqualityIffSameMembers (A B : LRA.Set.ZFCSet) :
    A = B ↔ ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B := by
  sorry

end LRA.Set.ZFC
