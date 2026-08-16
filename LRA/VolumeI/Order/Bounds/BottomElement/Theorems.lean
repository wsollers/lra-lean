import LRA.VolumeI.Order.Bounds.BottomElement.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]
variable [LRA.Set.HasComplement SetObject]
variable [LRA.Set.UniversalMembershipLaws Element SetObject]

/-- A bottom element is exactly an element related to every carrier element. -/
theorem BottomElementIffRelationToEvery
    {relation : LRA.Relation.Endorelation Element}
    {bottom : Element} :
    BottomElement (SetObject := SetObject) relation bottom <->
      forall element : Element, relation bottom element := by
  constructor
  · intro bottomElement element
    exact bottomElement.2 element (LRA.Set.UniversalMembership element)
  · intro belowEveryElement
    exact
      ⟨LRA.Set.UniversalMembership bottom,
        fun element _ => belowEveryElement element⟩

end LRA.Order
