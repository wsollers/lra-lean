import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x

end LRA.Set.Constructions.ZFCSet.Axioms
