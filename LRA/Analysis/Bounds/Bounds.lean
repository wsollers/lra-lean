                                  
                                                              

import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Order.Bounds.Defs

open scoped Pointwise

namespace LRA.Analysis.Bounds
open scoped Pointwise

   
                                          
                                
                                                                   

                                                                    
                           
  

variable {F : Type*}

                                                               

             

       
                                                     
                           
   
  
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> x <= u

                                                              

             

       
                                                     
                           
   
  
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> l <= x

                                                      

             

       
                                               
                            
   
  
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  exists u, IsUpperBound u A

                                                     

             

       
                                               
                            
   
  
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  exists l, IsLowerBound l A

                                                        

             

       
                                          
                                      
   
  
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A /\ IsBoundedBelow A

                                                        

             

       
                                                  
                           
   
  
def IsMaximum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsUpperBound m A

                                                       

             

       
                                                  
                           
   
  
def IsMinimum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsLowerBound m A

                                      

             

       
                                                         
                                                          
   
  
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A /\ forall u, IsUpperBound u A -> s <= u

                                         

             

       
                                                        
                                                          
   
  
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A /\ forall l, IsLowerBound l A -> l <= i

                                                                                                 
                 

             

       
                                                          
                                                         
   
  
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (maximum_hypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry

                                                                                               
                                                

             

       
                                                             
                                    
                                             
   
  
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_supremum : IsSupremum s A)
    (right_supremum : IsSupremum t A) : s = t := by
  sorry

                                                                                             
                                              

             

       
                                                            
                                  
                                           
   
  
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_infimum : IsInfimum s A)
    (right_infimum : IsInfimum t A) : s = t := by
  sorry

                                                                                        

             

       
                                                           
                                
   
  
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A <-> IsLUB A s := by
  sorry

end LRA.Analysis.Bounds
namespace LRA.Analysis.Bounds.Algebra
open scoped Pointwise

variable {F : Type*} [Field F] [LinearOrder F] [IsStrictOrderedRing F]

                                                                                               
                                                                                               
               

             

       
                                               
                             
                             
                                     
                                        
                                
   
  
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

                                                                                               
                                                                                                
         

             

       
                                              
                             
                             
                                   
                                      
                               
   
  
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_infimum : IsInfimum iA A)
    (right_infimum : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

                                                                                              
                                                                                          

             

       
                                                     
                             
                            
                                            
                                              
   
  
theorem SupremumOfPositiveScale {a s : F} {A : Set F}
    (A_nonempty : A.Nonempty)
    (scale_positive : 0 < a)
    (supremum_hypothesis : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A) := by
  sorry

                                                                               

             

       
                                                          
                                          
   
  
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A <-> IsInfimum (-s) (-A) := by
  sorry

                                                                                                  
                                                               

             

       
                                                  
                               
                                     
                                        
            
   
  
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (subset_hypothesis : A ⊆ B)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    sA <= sB := by
  sorry

end LRA.Analysis.Bounds.Algebra
namespace LRA.Analysis.Bounds
open scoped Pointwise

end LRA.Analysis.Bounds
