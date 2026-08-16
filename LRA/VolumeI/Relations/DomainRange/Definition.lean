import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Relation

universe u v

/-!
Domain and range predicates for arbitrary heterogeneous relations.
-/

/--
**[Definition - RelationDomain]**

The domain predicate of a heterogeneous relation.
-/
def RelationDomain {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousRelation Domain Codomain) :
    Domain -> Prop :=
  fun input => exists output, relation input output

/--
**[Definition - RelationRange]**

The range predicate of a heterogeneous relation.
-/
def RelationRange {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousRelation Domain Codomain) :
    Codomain -> Prop :=
  fun output => exists input, relation input output

end LRA.Relation
