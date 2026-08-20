import LRA.Set.TG.Axioms.Foundation
import LRA.Set.TG.Definitions
import LRA.Set.TG.Pairing.Theorems

namespace LRA.Set.TG

theorem FoundationWitnessExists (A : Set) (nonempty : exists w : Set, w ∈ A) :
    exists x : Set, IsFoundationWitness A x := by
  sorry


theorem NoSetIsMemberOfItself (A : Set) : A ∉ A := by
  sorry

end LRA.Set.TG
