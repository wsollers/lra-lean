import LRA.Logic.Syntax.FirstOrder.IsSubstitutable
import LRA.Logic.Syntax.FirstOrder.SubstituteInTerm

namespace LRA.Logic.FirstOrder

   
                           

                                                                          
                                                                  
                                                                 
                                                                         
                                                             
                                                                         
                                              

                                                        

                                                                      
                                                                    
                                                       
                                                                     
                                                                        
                                                                      
                                                                 
                                                           
  

                                                                          
                                                  

             

       
              
                                                            
                                                                                   
                                                                                   
                                                                                     
                                            
                                                                   
                                                                                               
   
  
def substitute
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Formula S Variable -> Formula S Variable
  | .relation r args => Formula.relation r (fun i => substituteInTerm x t (args i))
  | .equal t₁ t₂ => Formula.equal (substituteInTerm x t t₁) (substituteInTerm x t t₂)
  | .neg φ => Formula.neg (substitute x t φ)
  | .impl φ ψ => Formula.impl (substitute x t φ) (substitute x t ψ)
  | .forallQ v φ => if v = x then Formula.forallQ v φ else Formula.forallQ v (substitute x t φ)

end LRA.Logic.FirstOrder
