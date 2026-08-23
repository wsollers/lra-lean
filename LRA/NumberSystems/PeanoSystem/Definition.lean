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
  intro predicate baseCase successorStep element
  have representedBase : ps.one ∈ adequacy.Represent predicate :=
    (adequacy.MembershipIff predicate ps.one).2 baseCase
  have representedStep :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        ps.successor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (ps.successor candidate)).2
      (successorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  exact (adequacy.MembershipIff predicate element).1
    (ps.induction (adequacy.Represent predicate) representedBase representedStep element)

end

end LRA.NumberSystems.PeanoSystem
