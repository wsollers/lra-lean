import LRA.Set.Constructions.NBGSet.Axioms.Common

namespace LRA.Set.Constructions.NBGSet.Axioms

def IsEmptySet (A : Set) : Prop :=
  forall x : Set, x ∉ A

end LRA.Set.Constructions.NBGSet.Axioms
