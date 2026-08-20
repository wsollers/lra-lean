import LRA.Set.NBG.Axioms.Pairing
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

theorem PairSetExists (x1 x2 : Set) : exists P : Set, IsPairSet x1 x2 P := by
  sorry


theorem PairSetIsUnique {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P) (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  sorry


theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 <-> w = x1 \/ w = x2 := by
  sorry

end LRA.Set.NBG
