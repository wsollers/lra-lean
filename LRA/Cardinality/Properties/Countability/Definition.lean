                                                          
                                                           

import LRA.Cardinality.Theorems
import LRA.Carrier.Countability

namespace LRA.Cardinality

universe u

   
                                                   
                                                               
                                        

                                                            
                                                            
                                                                      
                                                                     
                                                                  
                                                                    
                                                                 
                                                                       
                                                                       
                                                                 
        

                                                               
                                                             
                                                                      
                                                                    
                                                                 
                                                                      
                                                         
                           
                                                                       
                                                              
                     
  

                                  

                                                                   
                                        

             

       
                                      
                           
   
  
def IsCountable (A : Type u) : Prop :=
  LRA.Carrier.IsCountable A

                                          

                                                                 
                                  

             

       
                                              
                                   
   
  
def IsCountablyInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsCountablyInfinite A

                                    

                                                
                            

             

       
                                        
                             
   
  
def IsUncountable (A : Type u) : Prop :=
  LRA.Carrier.IsUncountable A

end LRA.Cardinality
