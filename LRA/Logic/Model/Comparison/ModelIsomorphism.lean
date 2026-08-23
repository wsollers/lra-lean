import LRA.Logic.Model.Comparison.ModelEmbedding

namespace LRA.Logic.FirstOrder

   
                   

                                                                           
                                                                       
                                                                        
                                                        

                                                                          
                                                                         
                                                                          
                                                                      
                                                       

                                                                     
                                                                   
                                                                   
                                                                        
                                                                         
                                                                       
                                                                              
                                                               
  

                                                                          
                                                                          
          

             

       
                                                                    
                              
                                        
   
  
structure ModelIsomorphism {S : Signature} (M₁ M₂ : Model S) extends
    ModelEmbedding M₁ M₂ where
  surjective : Function.Surjective toFun

                                                                            
                                                                        

             

       
                                  
                                                                      
                                
   
  
theorem ModelIsomorphism.bijective
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    Function.Bijective iso.toFun :=
  ⟨iso.injective, iso.surjective⟩

end LRA.Logic.FirstOrder
