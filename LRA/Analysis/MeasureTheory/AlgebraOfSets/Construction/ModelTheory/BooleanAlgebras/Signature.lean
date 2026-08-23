import LRA.Logic

namespace LRA.Logic.ModelTheory.BooleanAlgebras

   
                                           
  

                                                                        

             

       
                                            
        
        
              
   
  
inductive BooleanAlgebraFunctionSymbol where
  | join
  | meet
  | complement

                                                                         

             

       
                                                
   
  
def BooleanAlgebraRelationSymbol : Type := Empty

                                                      

             

       
                                            
        
       
   
  
inductive BooleanAlgebraConstantSymbol where
  | zero
  | one

                                                          

             

       
                                                                           
                                        
       
                
                
                      
   
  
def BooleanAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

                                                          

             

       
                                                                           
                                        
                     
   
  
def BooleanAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim

                                                                

             

       
                                                                 
                                                
                                                
                                           
   
  
def BooleanAlgebraFirstOrderSignature : LRA.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol

end LRA.Logic.ModelTheory.BooleanAlgebras
