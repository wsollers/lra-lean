import LRA.Relation.Operations.Composition.Characterizations
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u v w x

/-- Relation composition is associative. -/
theorem RelationComposition.associative
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w} {Delta : Type x}
    (firstRelation : HeterogeneousBinaryRelation Alpha Beta)
    (secondRelation : HeterogeneousBinaryRelation Beta Gamma)
    (thirdRelation : HeterogeneousBinaryRelation Gamma Delta) :
    RelationComposition thirdRelation
        (RelationComposition secondRelation firstRelation) =
      RelationComposition
        (RelationComposition thirdRelation secondRelation) firstRelation := by
  sorry

/-- The identity relation is a left unit for relation composition. -/
theorem RelationComposition.identity_left
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition (IdentityRelation Beta) relation = relation := by
  sorry

/-- The identity relation is a right unit for relation composition. -/
theorem RelationComposition.identity_right
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition relation (IdentityRelation Alpha) = relation := by
  sorry

/-- Converse reverses relation composition. -/
theorem Converse.relationComposition
    {Alpha : Type u}
    (leftRelation rightRelation : Endorelation Alpha) :
    Converse (RelationComposition rightRelation leftRelation) =
      RelationComposition (Converse leftRelation) (Converse rightRelation) := by
  sorry

end LRA.Relation
