import LRA.Set.ZFC.Axioms.Foundation
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Pairing.Theorems

/-!
The Axiom of Foundation restated with a named predicate, plus its classic
immediate corollary.
-/

namespace LRA.Set.ZFC

/-- Every nonempty set has a Foundation witness: a member disjoint from it. -/
theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x := by
  sorry

/-- No set is a member of itself. -/
theorem NoSetIsMemberOfItself (A : Set) :
    A ∉ A := by
  sorry

end LRA.Set.ZFC
