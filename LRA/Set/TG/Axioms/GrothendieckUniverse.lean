import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                                               
axiom GrothendieckUniverse (A : TGSet) :
  exists U : TGSet,
    A ∈ U /\
    (forall x : TGSet, x ∈ U -> forall y : TGSet, y ∈ x -> y ∈ U) /\
    (forall x : TGSet, x ∈ U -> exists P : TGSet,
      P ∈ U /\ forall y : TGSet, y ∈ P <-> forall z : TGSet, z ∈ y -> z ∈ x) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists image : TGSet,
            image ∈ U /\
            forall y : TGSet, y ∈ image <-> exists i : TGSet, i ∈ I /\ y = family i) /\
    (forall I : TGSet, I ∈ U ->
      forall family : TGSet -> TGSet,
        (forall i : TGSet, i ∈ I -> family i ∈ U) ->
          exists union : TGSet,
            union ∈ U /\
            forall x : TGSet, x ∈ union <-> exists i : TGSet, i ∈ I /\ x ∈ family i)

end LRA.Set.TG
