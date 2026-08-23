import LRA.Logic.Syntax.FirstOrder.Formula

namespace LRA.Logic.FirstOrder

   
           

                                                                
                                                                      
                                                                         
                                                                        
                                                                       
                                                                        
                                                                  
                                                                         
                                                                          
                                                   

                                                                        
                                                                        
                                                                         
                                                                       
                                                                     
                              

                                                                
                                                                        
                                                                          
                                                                        
      

                                                                     
                                                                         
                                   
  

   
                                                                            

             

       
                                                          
                                                    
                                                    
                                                                   
                                                                           
                                                                            
                                                                                           
                                        
                                                              
   
  
inductive IsSubformula {S : Signature} {Variable : Type} :
    Formula S Variable -> Formula S Variable -> Prop
  | refl (φ : Formula S Variable) : IsSubformula φ φ
  | negOf (φ : Formula S Variable) : IsSubformula φ (Formula.neg φ)
  | implLeft (φ ψ : Formula S Variable) : IsSubformula φ (Formula.impl φ ψ)
  | implRight (φ ψ : Formula S Variable) : IsSubformula ψ (Formula.impl φ ψ)
  | forallOf (v : Variable) (φ : Formula S Variable) : IsSubformula φ (Formula.forallQ v φ)
  | trans {φ ψ χ : Formula S Variable} :
      IsSubformula φ ψ -> IsSubformula ψ χ -> IsSubformula φ χ

end LRA.Logic.FirstOrder
