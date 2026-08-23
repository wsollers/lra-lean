import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic.Language.Notation

   
                                  

                                                                     
                                                            
                                                                   

                                   
                                          
                                            
                           

                                                                   
                                                                      
                                                                       
                                                                          
                                                                       
                            

                                                                           
                                                                          
                                                                        
                                                                            
                                                                           
                                                                
  

   
            

                                                                            
                                                                            
                                                                         
                                                                            
                                                                           
                                                                         
                             
  

                                                                           
                                                                            
                                                                         
                                                               

             

       
                                 
       
        
   
  
inductive LogicalConnective where
  | neg
  | impl

   
                                                                          

             

       
                                                  
                             
       
               
                
   
  
def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2

   
                                                    

             

       
                                       
                                   
   
  
theorem LogicalConnectives.negIsUnary :
    LogicalConnectives.IsUnary .neg := rfl

   
                                                        

             

       
                                         
                                     
   
  
theorem LogicalConnectives.implIsBinary :
    LogicalConnectives.IsBinary .impl := rfl

   
         

                                                                          
                                                                          
                                                                       
                                                                        
                                                                          
                                                                 
          
  

                                                                   
                                                                          
                                                                           
                

             

       
                               
      
   
  
inductive LogicalEquality where
  | eq

   
                                                                                   

             

       
                                                      
                           
       
              
   
  
def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2

   
                                                        

             

       
                                           
                                       
   
  
theorem LogicalEqualitySymbols.eqIsBinary :
    LogicalEqualitySymbols.IsBinary .eq := rfl

   
               

                                                                 
                                                                      
                                                                           
                                                                         
                                                                        
                                                             
                                                                         
     

                                                                          
                                                                           
                                                                         
                                            
                                                                         
                                                                      
                                                                     
                                                                          
  

                                                                        
                                                                       
                                     

             

       
                                 
           
   
  
inductive LogicalQuantifier where
  | forallQ

end LRA.Logic.Language.Notation
