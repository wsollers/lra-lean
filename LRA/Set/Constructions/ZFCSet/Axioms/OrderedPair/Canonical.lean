import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

end LRA.Set.Constructions.ZFCSet.Axioms
