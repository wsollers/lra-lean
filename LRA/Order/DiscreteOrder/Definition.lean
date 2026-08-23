namespace LRA.Order

universe u

   
                                                                     
         

                                                                       
                                 
  

class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)

section Wrappers

variable {R : Type u}

theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1) := by
  sorry

end Wrappers

end LRA.Order
