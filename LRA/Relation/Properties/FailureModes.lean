import LRA.Relation.Properties.Definition

/-!
Negative shape predicates for a heterogeneous relation.

These name the two ways a relation fails to be a function: it may be
single-valued without being total, or total without being single-valued.
They are relation vocabulary, not function vocabulary — a function has neither
failure by construction — so they belong here rather than in `LRA.Function`.
-/

namespace LRA.Relation

universe u v

/-- A relation is properly partial when it is single-valued but not total. -/
def ProperlyPartial {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation ∧ ¬ LeftTotal relation

/-- A relation is properly multivalued when it is total but not single-valued. -/
def ProperlyMultivalued {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LeftTotal relation ∧ ¬ RightUnique relation

end LRA.Relation
