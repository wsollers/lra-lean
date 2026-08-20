import LRA.Set.NBG.Axioms.Foundation
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Pairing.Theorems

namespace LRA.Set.NBG

theorem FoundationWitnessExists (A : Set) (nonempty : exists w : Set, w ∈ A) :
    exists x : Set, IsFoundationWitness A x := by
  sorry


theorem NoSetIsMemberOfItself (A : Set) : A ∉ A := by
  sorry

end LRA.Set.NBG
