import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                                          
abbrev MinimalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  LRA.Relation.MinimalElement strictRelation subset minimal

end LRA.Order
