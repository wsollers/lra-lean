import LRA.Relation.Calculus.Classes.Definition

namespace LRA.Relation

universe u v

/-- Compatibility name for the backend-neutral domain class. -/
abbrev RelationDomain {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) := DomainClass R

/-- Compatibility name for the backend-neutral range class. -/
abbrev RelationRange {X : Type u} {Y : Type v}
    (R : HeterogeneousBinaryRelation X Y) := RangeClass R

end LRA.Relation
