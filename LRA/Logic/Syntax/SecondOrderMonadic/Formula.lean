import LRA.Logic.Syntax.Term

namespace LRA.Logic.SecondOrderMonadic

   
                              

                                                                  
                                                                    
                                                                        
                                                                         
                                                                   

                                                                          
                                                                       
                               

                                                                    
                                                                      
                                                                          
                                                                       
                                                                          
                                                                    
                                                                      
                                                                        
                                                                          
                                                                        
                                                                       
                                                               
                                                                       
               

                                                                   
                                                                        
                                                                  
                                                                      
                                                                          
                                                                     
                 
  

   
                                                                      

             

       
                                                                       
              
                               
                                                                
                                      
                                                                                                        
                                                                              
          
                                         
                                         
                                      
                                                                                              
                                                                                             
                                                                                                   
   
  
inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable

   
                                    

                                                                        
                                                                       
                                 
  

   
                                                     

             

       
                                                               
                                                                                  
                                                    
   
  
def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ))

   
                                                              

             

       
                                                                   
                                                                                               
                                                       
   
  
def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ))

                                                                    
                                                             

             

       
                                                                     
                                                                                                  
                                                         
   
  
def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ))

end LRA.Logic.SecondOrderMonadic
