import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Set.SetClass.Operations

   
                                                        

                                                          
                                                                           
                                                                                
                                                          
  

namespace LRA.Function

open LRA.Set
universe u v

                                                                          

             

       
                                                    
                                             
                                        
                          
                                                             
                                                                
   
  
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source

                                                                            

             

       
                                                      
                                             
                                          
                   
                                                                    
                                                                
   
  
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target

                                                                              
                                                                          

                                                                             
                                                                              
                                                                  
                                                               

             

       
                                        
                                         
                                                       
                      
                                                                
                                              
   
  
def EmptyIndexedIntersectionImageFailure
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧
    ImageClass function (SetClass.Universal : SetClass Domain) ≠
      (SetClass.Universal : SetClass Codomain)

                                                                             
                                                                         

                                                                             
                                                                              
                                 

             

       
                                                                   
                                                                
   
  
theorem SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure :
    EmptyIndexedIntersectionImageFailure (fun n : Nat => some n) := by
  sorry

end LRA.Function
