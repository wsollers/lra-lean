import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  exact  EmptySet

end LRA.Set.Constructions.ZFCSet.Axioms
