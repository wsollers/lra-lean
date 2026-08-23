import LRA.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.Logic.FirstOrder

   
              

                                                                           
                                                                   
                                                                            
                                                                       
                                                                      
                            
  

                                                                   

             

       
                                                           
                      
   
  
abbrev Automorphism {S : Signature} (M : Model S) : Type :=
  ModelIsomorphism M M

                                                                  
                                                                         
                                                                         
                                                                          
                                                                         

             

       
                                                                              
             
                                    
                              
                            
                                  
                                      
   
  
def Automorphism.identity {S : Signature} (M : Model S) : Automorphism M where
  toFun := id
  injective := Function.injective_id
  preservesFunction _ _ := rfl
  preservesConstant _ := rfl
  preservesRelation _ _ := Iff.rfl
  surjective := Function.surjective_id

end LRA.Logic.FirstOrder
