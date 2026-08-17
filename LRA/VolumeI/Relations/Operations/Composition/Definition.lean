import LRA.VolumeI.Relations.Basic

namespace LRA.Relation

universe u v w

/-!
Relation composition.

The orientation is the standard function-composition orientation:
`RelationComposition R S x z` means there is an intermediate `y` with
`S x y` and `R y z`.
-/

/-- Composition of heterogeneous binary relations. -/
def RelationComposition
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightRelation : HeterogeneousBinaryRelation Beta Gamma)
    (leftRelation : HeterogeneousBinaryRelation Alpha Beta) :
    HeterogeneousBinaryRelation Alpha Gamma :=
  fun first third =>
    exists middle, leftRelation first middle /\ rightRelation middle third

end LRA.Relation
