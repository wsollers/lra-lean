import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                               
axiom Infinity :
  exists A : TGSet,
    (exists empty : TGSet, empty ∈ A /\ forall w : TGSet, w ∉ empty) /\
    forall x : TGSet, x ∈ A ->
      exists successor : TGSet,
        successor ∈ A /\
        forall w : TGSet, w ∈ successor <-> w ∈ x \/ w = x

end LRA.Set.TG
