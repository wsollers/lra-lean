import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems

   
                                                                          
                        

                                                                       
                                                                        
                                                                 
                                                                    
                                                                         
                                                                    
                                                 

                                                                           
                                                                           
                                                                             
                                                                           
                                                               
                                                                      
                                                                           
                                                              
                                                                             
                                          
  

namespace LRA.NumberSystems.PeanoSystem

universe u v

   
                               

                                                                    
                                          

                                                       


             

       
                                                             
                                        
               
                                
                     
                             
                             
                       
                                                  
                                                           
                                    
             
                              
                     
                                
                           
                                      
                               
                        
   
  
structure PeanoSystem (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  one : Element
  successor : Element -> Element
  one_not_successor :
    forall element : Element,
      successor element ≠ one
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      one ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset

   
                                                                                  

                                                                         
                                                                      
                      

             

       
                                           
                                           
                                        
                                      
                 
                                                         
                                                       
   
  
structure PredicateSetComprehensionAdequacy
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Represent : Set Element -> SetObject
  MembershipIff :
    forall (predicate : Set Element) (element : Element),
      element ∈ Represent predicate ↔ predicate element

section

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                                                        

             

       
                                         
   
  
abbrev PeanoSystemFromTex := @PeanoSystem

   
                                                            

                                                                         
                                     

                                                                                                                            


             

       
                         
                                        
                                  
                           
                       
                                 
   
  
def SuccessorClosedSubset
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  forall element : Element,
    element ∈ subset ->
    ps.successor element ∈ subset

   
                                                     

                                                                               
                 

                                                                                                                                   


             

       
                                
                                        
                                  
                    
                                   
   
  
def InductiveSubsetOfPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (subset : SetObject) : Prop :=
  ps.one ∈ subset /\
    SuccessorClosedSubset ps subset

   
                                                              

                                                                             
                                                                     

             

       
                          
                                                  
                                 
                       
                              
                          
                                          
                             
                       
   
  
def FullPredicateInduction
    (ps : PeanoSystem Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate ps.one ->
    (forall element : Element,
      predicate element ->
      predicate (ps.successor element)) ->
    forall element : Element,
      predicate element

   
                                                                       

                                                                            
                                                                      

             

       
                                                     
                                        
                                                                      
                             
   
  
theorem FullPredicateInductionOfComprehensionAdequacy
    (ps : PeanoSystem Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullPredicateInduction ps := by

   
                                                                       

                                                                            
                                                                      

             

       
                                                     
                                        
                                                                      
                             
   
  
  sorry

end

end LRA.NumberSystems.PeanoSystem
