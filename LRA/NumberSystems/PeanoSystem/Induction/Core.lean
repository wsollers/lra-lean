import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem.Induction

open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                                      

                                                                     
                                                               

                                                                                                                                                                                                                                                                                              


             

       
                                     
                                        
                        
                                 
                     
                               
                           
                                          
                             
                      
   
  
theorem PeanoSystemInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

   
                                                                               

             

       
                                        
                                        
                        
                                 
                     
                               
                           
                                          
                             
                      
   
  
theorem InductionPrincipleForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (base_case : ps.one ∈ subset)
    (successor_step :
      forall element : Element,
        element ∈ subset ->
        (ps.successor element) ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

   
                                                                   

                                                                               

                                                                                                                                                                                                                                             


             

       
                                     
                                        
                        
                                                                    
                             
                      
   
  
theorem SubsetBasedInductionPrinciple
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

   
                                                                       

             

       
                                    
                                        
                        
                  
                               
                                      
                                 
                                               
                                  
                           
                             
                      
   
  
theorem StrongInductionOnPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (strong_step :
      forall element : Element,
        (forall predecessor : Element,
          predecessor ∈ subset ->
          ps.successor predecessor = element ->
          predecessor ∈ subset) ->
        element ∈ subset) :
    forall element : Element,
      element ∈ subset := by
  sorry

   
                                          

             

       
                       
                                        
                        
                                                                    
                                         
   
  
theorem PeanoMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (subset_is_inductive : InductiveSubsetOfPeanoSystem ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

   
                                                                            

             

       
                                       
                                        
                        
                                    
                                                          
                                         
   
  
theorem SuccessorClosedSubsetMinimality
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject)
    (contains_one : ps.one ∈ subset)
    (successor_closed : SuccessorClosedSubset ps subset) :
    ∀ element : Element, element ∈ subset := by
  sorry

end LRA.NumberSystems.PeanoSystem.Induction
