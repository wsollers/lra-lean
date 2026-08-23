                                      
                                                                                  

import LRA.VolumeII.Switches.NumberSystems
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.Parity

   
                                        
                                                
                                                  

                                                                            
                                                                           
  

   
                

                                          


             

       
               
   
  
abbrev N := Nat


                                                         

                                                               


             

       
                                           
   
  
def IsEven (value : N) : Prop := Even value


                                                            

                                                              


             

       
                                         
   
  
def IsOdd (value : N) : Prop := Odd value


                                                

                                                                                                                        

                             


             

       
                             
                                             
                  
   
  
theorem EvenAddEven {a b : N}
    (a_even : IsEven a) (b_even : IsEven b) :
    IsEven (a + b) := by
  sorry

                                                        

                                                                                                                    

                             


             

       
                            
                                           
                 
   
  
theorem EvenAddOdd {a b : N}
    (a_even : IsEven a) (b_odd : IsOdd b) :
    IsOdd (a + b) := by
  sorry

                                                        

                                                                                                                    

                             


             

       
                            
                                           
                 
   
  
theorem OddAddEven {a b : N}
    (a_odd : IsOdd a) (b_even : IsEven b) :
    IsOdd (a + b) := by
  sorry

                                               

                                                                                                                  

                             


             

       
                           
                                         
                  
   
  
theorem OddAddOdd {a b : N}
    (a_odd : IsOdd a) (b_odd : IsOdd b) :
    IsEven (a + b) := by
  sorry

                                                 

                                                                                                   

                             


             

       
                                                  
                  
   
  
theorem SqEvenOfEven {a : N} (a_even : IsEven a) :
    IsEven (a ^ 2) := by
  sorry

                                               

                                                                                              

                             


             

       
                                              
                 
   
  
theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) :
    IsOdd (a ^ 2) := by
  sorry

                                                                  

                                                                                                        

                             


             

       
                                                             
            
   
  
theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) :
    IsEven a := by
  sorry

                                                                

                                                                                                   

                             


             

       
                                                         
           
   
  
theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) :
    IsOdd a := by
  sorry

end LRA.NumberSystems.Arithmetic.Parity
