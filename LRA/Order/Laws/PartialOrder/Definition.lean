namespace LRA.Order

   
                                                                            
                                                                             
                                                                            
                                                
  

universe u

                                                                     
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c

section Wrappers

variable {R : Type u}

theorem LeRefl [LE R] [PartialOrderLaws R] : forall a : R, a <= a := by
  sorry


theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    forall a b : R, a <= b -> b <= a -> a = b := by
  sorry


theorem LeTrans [LE R] [PartialOrderLaws R] :
    forall a b c : R, a <= b -> b <= c -> a <= c := by
  sorry

end Wrappers

end LRA.Order
