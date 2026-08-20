import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/-- Zermelo choice for pairwise-disjoint families of nonempty sets. -/
axiom Choice (A : TGSet) :
  (forall B : TGSet, B ∈ A -> exists x : TGSet, x ∈ B) ->
  (forall B C : TGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : TGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : TGSet,
      forall B : TGSet, B ∈ A ->
        exists x : TGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : TGSet,
            (other ∈ B /\ other ∈ choiceSet) -> other = x

end LRA.Set.TG
