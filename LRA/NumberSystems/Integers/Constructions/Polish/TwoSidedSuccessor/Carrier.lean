                                                                                 
                                                                            
                                                

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

   
                                                                 
                                                                        
                                                                          

                                                                                
                                                                              
                                                                          

                                                                      
                                                                
                     

                                                                         
                                                                        
                                                                  
                                                              
               
  

   
                   

                                                    


             

       
                        
                
                
   
  
inductive P : Type where
  | succZero : P
  | succ : P → P

   
                   

                                                    


             

       
                        
                
                
   
  
inductive N : Type where
  | predZero : N
  | pred : N → N

   
                   

                                                    


             

       
                        
            
               
               
   
  
inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z

open Z

   
                

             

       
                
                          
                           
            
                  
                          
                           
   
  
def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'

   
                

             

       
                
                          
            
                  
                          
                           
                           
   
  
def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)

                                                                          
                                                                           
                                                                       

             

       
                               
   
  
def one : Z := Z.pos P.succZero

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
