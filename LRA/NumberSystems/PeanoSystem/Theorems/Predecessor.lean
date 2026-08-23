import LRA.NumberSystems.PeanoSystem.Theorems.Successor

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                                

                                                                                
             

                                                              


             

       
                            
                                        
                                             
                                    
   
  
def PredecessorInPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (predecessor element : Element) : Prop :=
  ps.successor predecessor = element

   
                                     

                                                                               
                                       

                                                       


             

       
                     
                                        
                                 
                               
                                         
                                         
                                                   
                                       
   
  
def UniquePredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) : Prop :=
  exists predecessor : Element,
    ps.successor predecessor = element /\
      forall other_predecessor : Element,
        ps.successor other_predecessor = element ->
        other_predecessor = predecessor

   
                                                   

                                                                       

                                                                          


             

       
                                        
                                        
                         
                                               
   
  
theorem SuccessorsHaveUniquePredecessors
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    UniquePredecessor ps (ps.successor element) := by
  sorry

   
                                       

                                                   

                                                           


             

       
                         
                                        
                                                              
                                                            
                                                             
                                          
   
  
theorem PredecessorUnique
    (ps : PeanoSystem Element SetObject)
    (first_predecessor second_predecessor element : Element) :
    PredecessorInPeanoSystem ps first_predecessor element ->
    PredecessorInPeanoSystem ps second_predecessor element ->
    first_predecessor = second_predecessor := by
  sorry

   
                                                          

                                                                  

                                                                        


             

       
                                      
                                        
                         
                       
                                   
                                          
   
  
theorem NonOneElementsHaveAPredecessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one ->
      exists predecessor : Element,
        ps.successor predecessor = element := by
  sorry

   
                                                       

                                                                                

                                                                            


             

       
                                          
                                        
                         
                                                    
   
  
theorem PredecessorExistsUniqueAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one -> UniquePredecessor ps element := by
  sorry

   
                                                                 

                                                                          
            

                                                                                      


             

       
                                                    
                                        
                         
                                                     
   
  
theorem UniquePredecessorCharacterizationAwayFromOne
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    element ≠ ps.one <-> UniquePredecessor ps element := by
  sorry

end LRA.NumberSystems.PeanoSystem
