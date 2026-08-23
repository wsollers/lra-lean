import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.Logic.ModelTheory.SetRings

   
                                          

                                                                            
                                                                            
                                                                              
  

                                                                            
                                                                               
                                                                          
                                                                       

             

       
                                                                                                              
                
                                             
                                              
                                              
                                                    
   
  
structure SetRingConceptSignature extends LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  zero : carrier
  add : LRA.Operation.BinaryOperation carrier
  join : LRA.Operation.BinaryOperation carrier
  meet : LRA.Operation.BinaryOperation carrier
  difference : LRA.Operation.BinaryOperation carrier

end LRA.Logic.ModelTheory.SetRings
