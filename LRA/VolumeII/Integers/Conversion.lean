                                        
                                                             

import LRA.VolumeII.Integers.Implementation

namespace LRA.NumberSystems.Integers.Conversion

open LRA.AlgebraicStructures

   
                                                 
                                                  
                                                 

                                                                     
                                                                      
                                                                    
                                                                   
  

                                                                      
               

             

       
                   
          
                                              
   
  
def ofNat : Nat → Z
  | 0 => 0
  | Nat.succ previous => Succ (ofNat previous)

                                                    

             

       
                   
                                  
                                                              
   
  
def ofInt : Int → Z
  | Int.ofNat value => ofNat value
  | Int.negSucc predecessor => -(ofNat (Nat.succ predecessor))

                                                                

             

       
                       
   
  
def zero : Z := ofNat 0

                                                               

             

       
                      
   
  
def one : Z := ofNat 1

                                                               

             

       
                      
   
  
def two : Z := ofNat 2

                                                                 

             

       
                        
   
  
def three : Z := ofNat 3

                                                                

             

       
                       
   
  
def four : Z := ofNat 4

                                                                        

             

       
                                  
   
  
def negative_one : Z := ofInt (-1)

                                                                        

             

       
                                  
   
  
def negative_two : Z := ofInt (-2)

end LRA.NumberSystems.Integers.Conversion
