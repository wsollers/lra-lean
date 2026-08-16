import LRA.VolumeI.Order.Bounds.TopElement.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]
variable [LRA.Set.HasComplement SetObject]
variable [LRA.Set.UniversalMembershipLaws Element SetObject]

/-- A top element is exactly an element every carrier element is related to. -/
theorem TopElementIffEveryRelationTo
    {relation : LRA.Relation.Endorelation Element}
    {top : Element} :
    TopElement (SetObject := SetObject) relation top <->
      forall element : Element, relation element top := by
  sorry

end LRA.Order
