import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x

theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
