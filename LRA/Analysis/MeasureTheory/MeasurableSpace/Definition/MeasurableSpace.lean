import Mathlib.MeasureTheory.MeasurableSpace.Basic

   
                                            

                                                                            
                                                                          
                                         
  

namespace LRA.Analysis.MeasureTheory.MeasurableSpaces

universe u

                                                                

                                                                             
                                                                

                                                                                    


             

       
                                                        
                                         
                             
                                     
                            
                                                       
                                                           
                                                                            
                                                                                   
   
  
structure MeasurableSpaceDefinitionOn (X : Type u) where
                                         
  IsMeasurable : Set X → Prop
                                     
  empty_mem : IsMeasurable ∅
                                                       
  compl_mem : ∀ A : Set X, IsMeasurable A → IsMeasurable Aᶜ
                                                                            
  iUnion_mem : ∀ A : ℕ → Set X, (∀ n, IsMeasurable (A n)) → IsMeasurable (⋃ n, A n)


                                          

                                                                     


             

       
                                         
                                
                  
                                                 
                                                      
   
  
structure MeasurableSpaceDefinition where
                                
  Carrier : Type u
                                                 
  measurableSets : MeasurableSpaceDefinitionOn Carrier

end LRA.Analysis.MeasureTheory.MeasurableSpaces

