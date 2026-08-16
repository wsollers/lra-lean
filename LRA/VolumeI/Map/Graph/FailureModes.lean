import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

universe u v

/--
A relation is properly partial when it is single-valued but not total over its
domain.
-/
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  SingleValued relation /\ ¬ TotalOverDomain relation

/--
A relation is properly multivalued when it is total but not single-valued.
-/
def ProperlyMultivalued
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain relation /\ ¬ SingleValued relation

/--
The empty relation is single-valued for vacuous reasons.
-/
theorem EmptyRelationSingleValued
    {Domain : Type u} {Codomain : Type v} :
    SingleValued
      (fun _input : Domain => fun _output : Codomain => False) := by
  intro _input _firstOutput _secondOutput firstHit _secondHit
  cases firstHit

end LRA.Map.Graph
