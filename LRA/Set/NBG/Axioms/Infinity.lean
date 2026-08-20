import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- An inductive set exists. -/
axiom Infinity :
  exists A : NBGSet,
    (exists empty : NBGSet, empty ∈ A /\ forall w : NBGSet, w ∉ empty) /\
    forall x : NBGSet, x ∈ A ->
      exists successor : NBGSet,
        successor ∈ A /\
        forall w : NBGSet, w ∈ successor <-> w ∈ x \/ w = x

end LRA.Set.NBG
