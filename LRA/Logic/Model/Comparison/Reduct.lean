import LRA.Logic.Model.Model
import LRA.Logic.Model.Comparison.SignatureEmbedding

namespace LRA.Logic.FirstOrder

   
        

                                                                          
                                                                          
                                                                        
                                                                           
                                                                     
                                                            
  

                                                                          
                                                                      
                

             

       
                
                                                                                    
                     
                                     
                             
                                            
                                                      
                             
                                            
                                                      
                        
                                            
   
  
def Model.reduct
    {S S' : Signature} (e : SignatureEmbedding S S') (M' : Model S') : Model S where
  Domain := M'.Domain
  domainNonempty := M'.domainNonempty
  interpretFunction f args :=
    M'.interpretFunction (e.embedFunction f)
      (fun i => args (e.functionArityPreserved f ▸ i))
  interpretRelation r args :=
    M'.interpretRelation (e.embedRelation r)
      (fun i => args (e.relationArityPreserved r ▸ i))
  interpretConstant c :=
    M'.interpretConstant (e.embedConstant c)

end LRA.Logic.FirstOrder
