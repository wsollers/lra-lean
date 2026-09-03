import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem PairSetExists (A B : Set) :
    ∃ P : Set, IsPairSet A B P := by

  rcases Pairing A B with ⟨C, hypothesis⟩
  refine ⟨C, ?_⟩
  intro x
  constructor
  . -- -> mp
    intro hypo
    rw [hypothesis] at hypo
    exact hypo
  . -- <- mpr
    intro hypo
    rw [hypothesis]
    exact hypo






end LRA.Set.Constructions.ZFCSet.Axioms
