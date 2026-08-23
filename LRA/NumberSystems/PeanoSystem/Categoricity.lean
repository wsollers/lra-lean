import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                                            

                                                                            
                                                                        
                                    

                                                                          
                                                                             
                                                                           
                                                                     
                                                            

                                                                                 

             

       
                                               
                                                       
                                              
                                           
                                                       
                                                          
                                    
                                              
                                                 
                                         
                                          
                                  
                                             
                                                  
                                        
                                               
                                                  
                                                                           
                                                                              
   
  
theorem UniquenessOfPeanoSystemsUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : PeanoSystem Element SetObject)
    (firstFullInduction : FullPredicateInduction first)
    (second : PeanoSystem SecondElement SecondSetObject) :
    FullPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.one = second.one /\
        backward second.one = first.one /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by

   
                                                                            

                                                                            
                                                                        
                                    

                                                                          
                                                                             
                                                                           
                                                                     
                                                            

                                                                                 

             

       
                                               
                                                       
                                              
                                           
                                                       
                                                          
                                    
                                              
                                                 
                                         
                                          
                                  
                                             
                                                  
                                        
                                               
                                                  
                                                                           
                                                                              
   
  
  sorry

end LRA.NumberSystems.PeanoSystem
