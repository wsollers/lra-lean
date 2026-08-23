import Mathlib.Logic.Equiv.Basic
import LRA.Logic.Model.Comparison.ModelIsomorphism

namespace LRA.Logic.FirstOrder

   
                         

                                                                    
                                                                       
                                                                        
                                                                      
                                                                          
                                                                   
                                                                       
                                              

                                                                          
                                                                          
                                                                            
                                                                     
                                                                        
                                                                        
                                 

                                                                             
                                                                          
                                                                    
                                                                           
                                                                           
                                                                           
                                                                      
  

                                                                           
                                                                         
            

             

       
                                          
                                                                      
                            
                                           
   
  
noncomputable def ModelIsomorphism.toEquiv
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    M₁.Domain ≃ M₂.Domain :=
  Equiv.ofBijective iso.toFun iso.bijective

                                                                           
                                                                  
           

             

       
                                      
                                                                                      
                               
   
  
theorem ModelIsomorphism.toEquiv_apply
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) (x : M₁.Domain) :
    iso.toEquiv x = iso.toFun x := rfl

                                                                     
                                                                      
                                                                        
                                                                       
                     

             

       
                                                   
                                                                      
                              
       
   
  
noncomputable def ModelIsomorphism.inverseEmbedding
    {S : Signature} {M₁ M₂ : Model S} (iso : ModelIsomorphism M₁ M₂) :
    ModelEmbedding M₂ M₁ where
  toFun := iso.toEquiv.symm
  injective := iso.toEquiv.symm.injective
  preservesFunction f args := by
    have h := iso.preservesFunction f (fun i => iso.toEquiv.symm (args i))
    have hargs : (fun i => iso.toFun (iso.toEquiv.symm (args i))) = args := by
      funext i
      exact iso.toEquiv.apply_symm_apply (args i)
    rw [hargs] at h
                                                                               
    rw [← iso.toEquiv_apply] at h
                                                                                 
    have heq := congrArg iso.toEquiv.symm h
    rw [iso.toEquiv.symm_apply_apply] at heq
                                                                                        
                                             
    exact heq.symm
  preservesConstant c := by
    have h := iso.preservesConstant c
    rw [← iso.toEquiv_apply] at h
    have heq := congrArg iso.toEquiv.symm h
    rw [iso.toEquiv.symm_apply_apply] at heq
    exact heq.symm
  preservesRelation r args := by
    have h := iso.preservesRelation r (fun i => iso.toEquiv.symm (args i))
    have hargs : (fun i => iso.toFun (iso.toEquiv.symm (args i))) = args := by
      funext i
      exact iso.toEquiv.apply_symm_apply (args i)
    rw [hargs] at h
    exact h.symm

end LRA.Logic.FirstOrder
