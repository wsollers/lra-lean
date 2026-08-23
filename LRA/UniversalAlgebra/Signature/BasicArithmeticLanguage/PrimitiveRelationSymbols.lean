import LRA.UniversalAlgebra.Signature.FormalVocabulary.RelationSymbols

namespace LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage

   
                                                    

             

       
                                       
            
                   
   
  
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual

   
                                                           

             

       
                                                           
                  
                         
   
  
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2

end LRA.UniversalAlgebra.Signature.BasicArithmeticLanguage
