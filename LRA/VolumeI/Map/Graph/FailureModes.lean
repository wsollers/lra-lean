import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

universe u v

/--
**[Definition — ProperlyPartial]**

A relation is properly partial when it is single-valued but not total over its
domain.

Logical form:

```lean
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop
```
-/
def ProperlyPartial
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  SingleValued relation /\ ¬ TotalOverDomain relation

/--
**[Definition — ProperlyMultivalued]**

A relation is properly multivalued when it is total but not single-valued.

Logical form:

```lean
def ProperlyMultivalued
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop
```
-/
def ProperlyMultivalued
    {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  TotalOverDomain relation /\ ¬ SingleValued relation

/--
**[Theorem — EmptyRelationSingleValued]**

The empty relation is single-valued for vacuous reasons.

Logical form:

```lean
theorem EmptyRelationSingleValued
    {Domain : Type u} {Codomain : Type v} :
    SingleValued
      (fun _input : Domain => fun _output : Codomain => False)
```
-/
theorem EmptyRelationSingleValued
    {Domain : Type u} {Codomain : Type v} :
    SingleValued
      (fun _input : Domain => fun _output : Codomain => False) := by
  sorry
end LRA.Map.Graph
