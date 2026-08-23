import LRA.Logic.Language.Notation

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

   
                                         

             

       
                            
          
         
           
               
   
  
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript

   
                                                   

             

       
                                                  
                      
                
                     
   
  
structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole

end LRA.UniversalAlgebra.Signature.FormalVocabulary
