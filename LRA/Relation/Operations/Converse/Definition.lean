import LRA.Relation.Definition

namespace LRA.Relation
universe u v

/-- Converse of a heterogeneous relation. -/
def Converse {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : HeterogeneousBinaryRelation β α :=
  fun y x => R x y

end LRA.Relation
