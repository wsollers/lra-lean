namespace LRA.Logic

   
                          

                                                                         
                                                                       
                                                                          
                                                                    
                                                                         
                            
  

   
                                                                           

             

       
                                   
               
                       
   
  
structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

   
                                                                          
                                                                       
     
  

   
                                                                            

             

       
                                                                                         
                    
   
  
def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

   
                                                                        

             

       
                                                                                       
                    
   
  
def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

   
                                                                          

             

       
                                                                                        
                    
   
  
def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

end LRA.Logic
