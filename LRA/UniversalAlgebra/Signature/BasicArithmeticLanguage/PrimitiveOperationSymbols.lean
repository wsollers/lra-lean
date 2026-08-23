import LRA.UniversalAlgebra.Signature.FormalVocabulary.OperationSymbols

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

   
                                                              

             

       
                                        
        
       
            
            
                  
   
  
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication

   
                                                            

             

       
                                                             
              
             
                  
                  
                        
   
  
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
