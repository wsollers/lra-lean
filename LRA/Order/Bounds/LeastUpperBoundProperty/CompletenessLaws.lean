import LRA.Order.Bounds.LeastUpperBoundProperty.Definition

namespace LRA.Order

   
                                                                           
                                                                     
                                                                         
  

universe u v

                                                                            
class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)

section Wrappers

variable {R : Type u} {SetObject : Type v}

theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b) := by
  sorry

end Wrappers

end LRA.Order
