import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Foundation.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem FoundationWitnessExists
    (A : Set) (nonempty : ∃ w : Set, w ∈ A) :
    ∃ x : Set, IsFoundationWitness A x := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
