import LRA.Order.Bounds.BottomElement.Definition
import LRA.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]
variable [LRA.Set.HasComplement SetObject]
variable [LRA.Set.UniversalMembershipLaws Element SetObject]

                                                                               
theorem BottomElementIffRelationToEvery
    {relation : LRA.Relation.Endorelation Element}
    {bottom : Element} :
    BottomElement (SetObject := SetObject) relation bottom <->
      forall element : Element, relation bottom element := by
  sorry

end LRA.Order
