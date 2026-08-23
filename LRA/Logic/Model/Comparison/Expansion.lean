import LRA.Logic.Model.Model
import LRA.Logic.Model.Comparison.SignatureEmbedding

namespace LRA.Logic.FirstOrder

   
           

                                                                       
                                                                           
                                                                          
                                                                       
                                                                          
                                                                       
                                           

                                                                         
                                                                         
                                                                   
                                                                        
                                                                        

                                                                 
                                                                  
                                                        
                                                                    
                                                                
                                                                         
                                                                        
                                                            
                                                                        
                               
  

                                                                         
                                                                          
                                                                     
                                                                      
                                                                  

             

       
                
                                                                  
                   
                                                                                      
                   
                                                                                  
                                               
                  
        
   
  
def Model.expand
    {S S' : Signature} (e : SignatureEmbedding S S') (M : Model S)
    (newFunctions :
      (f' : S'.FunctionSymbol) -> (Fin (S'.functionArity f') -> M.Domain) -> M.Domain)
    (newRelations :
      (r' : S'.RelationSymbol) -> (Fin (S'.relationArity r') -> M.Domain) -> Prop)
    (newConstants : S'.Constants -> M.Domain) :
    Model S' where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretFunction f' args :=
    match h : e.functionPreimage f' with
    | some f =>
        M.interpretFunction f
          (fun i =>
            args
              (((e.functionEmbedFunction_of_preimage f' f h) ▸
                (e.functionArityPreserved f)).symm ▸ i))
    | none => newFunctions f' args
  interpretRelation r' args :=
    match h : e.relationPreimage r' with
    | some r =>
        M.interpretRelation r
          (fun i =>
            args
              (((e.relationEmbedRelation_of_preimage r' r h) ▸
                (e.relationArityPreserved r)).symm ▸ i))
    | none => newRelations r' args
  interpretConstant c' :=
    match e.constantPreimage c' with
    | some c => M.interpretConstant c
    | none => newConstants c'

end LRA.Logic.FirstOrder
