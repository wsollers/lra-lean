                                                 
                                                                   
                                             

import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interop.Mathlib.ZFSet.Pairing
import LRA.Set.Interface.RelationSets

namespace LRA.Set.MathlibZFSet

open LRA.Set

   
                                           
                                              
                                                               

                                                               
                                                             
                                                                     
                                                                 
                                                                  
                                                     
                                                              
                                                                     

                                                                     
                                                                  
  

                                                                  
                                                            

             

       
                                                              
                                                                      
   
  
theorem RelatesIffPairMember (relation input output : ZFSet) :
    Relates relation input output ↔
      ZFSet.pair input output ∈ relation := by
  sorry

                                          

                                                                   

             

       
                                                                 
                                                      
                                   
   
  
theorem IsPairwiseOfSubsetProd {domain codomain relation : ZFSet}
    (inside : relation ⊆ ZFSet.prod domain codomain) :
    IsPairwise ZFSet ZFSet relation := by
  sorry

                                          

                                                                    
                                                                     
                                                           

             

       
                                                                 
                                                      
                                       
   
  
theorem IsSingleValuedOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsSingleValued ZFSet ZFSet relation := by
  sorry

                                       

                                                                
                                                                 
                                  

             

       
                                                                
                                           
                                             
                                       
                                         
   
  
theorem IsFuncIffFunctional (domain codomain relation : ZFSet) :
    ZFSet.IsFunc domain codomain relation ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

                                             

                                                                   
                                                                      
                                                                  
          

             

       
                                                                      
                                           
                                             
                                       
                                         
   
  
theorem MemberOfFunsIffFunctional (domain codomain relation : ZFSet) :
    relation ∈ ZFSet.funs domain codomain ↔
      relation ⊆ ZFSet.prod domain codomain ∧
      IsTotalOn ZFSet relation domain ∧
      IsSingleValued ZFSet ZFSet relation := by
  sorry

                                           

                                                                      
              

             

       
                                                                  
                                                      
                                        
   
  
theorem IsFunctionalSetOfIsFunc {domain codomain relation : ZFSet}
    (isFunc : ZFSet.IsFunc domain codomain relation) :
    IsFunctionalSet ZFSet ZFSet relation := by
  sorry

                                 

                                                                   
                                                                     
                                        

             

       
                                                              
                                 
                                             
                                     
   
  
theorem RelatesMapIff (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over input output : ZFSet) :
    Relates (ZFSet.map f over) input output ↔
      input ∈ over ∧ f input = output := by
  sorry

                                      

                                                                   
                                               

             

       
                                                                   
                    
                                                  
   
  
theorem MapIsFunctionalSet (f : ZFSet → ZFSet) [ZFSet.Definable₁ f]
    (over : ZFSet) :
    IsFunctionalSet ZFSet ZFSet (ZFSet.map f over) := by
  sorry

end LRA.Set.MathlibZFSet
