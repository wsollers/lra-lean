import LRA.VolumeI.Relations.Operations.Composition.Characterizations

namespace LRA.Relation

universe u v w x

/-! Consequences of relation composition. -/

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
  funext first fourth
  apply propext
  constructor
  · intro composed
    rcases composed with ⟨third, secondComposedFirst, thirdRelatedFourth⟩
    rcases secondComposedFirst with ⟨second, firstRelatedSecond, secondRelatedThird⟩
    exact ⟨second, firstRelatedSecond, third, secondRelatedThird, thirdRelatedFourth⟩
  · intro composed
    rcases composed with ⟨second, firstRelatedSecond, third, secondRelatedThird, thirdRelatedFourth⟩
    exact ⟨third, ⟨second, firstRelatedSecond, secondRelatedThird⟩, thirdRelatedFourth⟩

/-- The identity relation is a left unit for relation composition. -/
theorem RelationComposition.identity_left
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition (IdentityRelation Beta) relation = relation := by
  funext first second
  apply propext
  constructor
  · intro composed
    rcases composed with ⟨middle, firstRelatedMiddle, middleEqualsSecond⟩
    rwa [middleEqualsSecond] at firstRelatedMiddle
  · intro firstRelatedSecond
    exact ⟨second, firstRelatedSecond, rfl⟩

/-- The identity relation is a right unit for relation composition. -/
theorem RelationComposition.identity_right
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RelationComposition relation (IdentityRelation Alpha) = relation := by
  funext first second
  apply propext
  constructor
  · intro composed
    rcases composed with ⟨middle, firstEqualsMiddle, middleRelatedSecond⟩
    rwa [← firstEqualsMiddle] at middleRelatedSecond
  · intro firstRelatedSecond
    exact ⟨first, rfl, firstRelatedSecond⟩

/-- Converse reverses relation composition. -/
theorem Converse.relationComposition
    {Alpha : Type u}
    (leftRelation rightRelation : Endorelation Alpha) :
    Converse (RelationComposition rightRelation leftRelation) =
      RelationComposition (Converse leftRelation) (Converse rightRelation) := by
  funext first third
  apply propext
  constructor
  · intro composed
    rcases composed with ⟨middle, thirdRelatedMiddle, middleRelatedFirst⟩
    exact ⟨middle, middleRelatedFirst, thirdRelatedMiddle⟩
  · intro composed
    rcases composed with ⟨middle, middleRelatedFirst, thirdRelatedMiddle⟩
    exact ⟨middle, thirdRelatedMiddle, middleRelatedFirst⟩

end LRA.Relation
