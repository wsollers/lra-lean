import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem PairSetIsUnique
    {A B P G : Set}
    (PIsPairSet : IsPairSet A B P)
    (GIsPairSet : IsPairSet A B G) :
    G = P := by

  have p := Pairing A B
  have g := Pairing A B



  sorry

theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
