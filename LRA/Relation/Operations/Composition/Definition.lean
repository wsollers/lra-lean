import LRA.Relation.Definition

namespace LRA.Relation

universe u v w

/-- Composition of heterogeneous binary relations. The orientation matches
function composition: `RelationComposition R S x z` means some `y` satisfies
`S x y` and `R y z`. -/
def RelationComposition
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightRelation : HeterogeneousBinaryRelation Beta Gamma)
    (leftRelation : HeterogeneousBinaryRelation Alpha Beta) :
    HeterogeneousBinaryRelation Alpha Gamma :=
  fun first third =>
    ∃ middle, leftRelation first middle ∧ rightRelation middle third

end LRA.Relation
