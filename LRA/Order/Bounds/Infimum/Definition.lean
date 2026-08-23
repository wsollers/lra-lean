import LRA.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                        
def Infimum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum

end LRA.Order
