import LRA.Operation

namespace LRA.UniversalAlgebra.InterpretedOperationBundles

   
                                                              

                                                                    
                                                                         
                                                                        
                                                                 
                                                  

                                                                       
                                                                           
        
  

                                                                         
                                                                          

             

       
                             
                  
   
  
structure CarrierBundle where
  carrier : Type u

                                                                    
                                                                            

             

       
                                                
                
   
  
structure ZeroBundle extends CarrierBundle where
  zero : carrier

                                                                  
                                                                                

             

       
                                               
               
   
  
structure OneBundle extends CarrierBundle where
  one : carrier

                                                                         
                                                                        
                 

             

       
                                                   
                
               
   
  
structure ZeroOneBundle extends CarrierBundle where
  zero : carrier
  one : carrier

                                                                  
                                                                        
                     

             

       
                                                             
                                             
   
  
structure AdditiveOperationBundle extends CarrierBundle where
  add : LRA.Operation.BinaryOperation carrier

                                                                            
                                                                              
             

             

       
                                                                   
                                                  
   
  
structure MultiplicativeOperationBundle extends CarrierBundle where
  multiply : LRA.Operation.BinaryOperation carrier

                                                              
                                                                       
                                          

             

       
                                                            
                                              
                                              
   
  
structure LatticeOperationBundle extends CarrierBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier

                                                                           
                                                                           
           

             

       
                                                               
                                                   
   
  
structure ComplementOperationBundle extends CarrierBundle where
  complement : LRA.Operation.UnaryOperation carrier

                                                                   
                                                                           
                             

             

       
                                                                
                                             
                                                  
   
  
structure BooleanRingOperationBundle extends ZeroOneBundle where
  add : LRA.Operation.BinaryOperation carrier
  multiply : LRA.Operation.BinaryOperation carrier

                                                                           
                                                                              
                                 

             

       
                                                                   
                                              
                                              
                                                   
   
  
structure BooleanAlgebraOperationBundle extends ZeroOneBundle where
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  complement : LRA.Operation.UnaryOperation carrier

end LRA.UniversalAlgebra.InterpretedOperationBundles
