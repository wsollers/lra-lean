import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- Order-level spelling of the canonical relation-theoretic maximal-element predicate. -/
abbrev MaximalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  LRA.Relation.MaximalElement strictRelation subset maximal

end LRA.Order
