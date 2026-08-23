                                                     
                                                                            
                                                    

import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems

   
                                                                          
                                                                            
                                                                          
                                                                            
                                                                          
                                                                          
                                            

                                              

                                                                         
             
                                                                  
                                                                        
                                                                          
                      
                                                                        
                                              

                                                                      
                                                                          
                                                                             
                                                                        
                                                                   
                                       

                                                                           
                                                                        
                                                                        
                                                                            
                                                                           
                                                        
                         
  

namespace LRA.NumberSystems.IntegerStructure

universe u v

                                                                          
                                                                            
                                                                          
                
def iterate {Alpha : Type u} (f : Alpha -> Alpha) : Nat -> Alpha -> Alpha
  | 0, x => x
  | n + 1, x => f (iterate f n x)

   
                                    

                                                                        
                                                                    
                    

             

       
                                                                  
                                        
                
               
                       
                                
                                  
                         
                                                                       
                         
                                                                       
                                       
                                                   
             
                                              
                                              
             
                              
                      
                                                                                   
                                                                                     
                                                
   
  
structure IntegerStructure (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  one : Element
  negativeOne : Element
  successor : Element -> Element
  predecessor : Element -> Element
  predecessor_successor :
    forall element : Element, predecessor (successor element) = element
  successor_predecessor :
    forall element : Element, successor (predecessor element) = element
  successor_zero : successor zero = one
  predecessor_zero : predecessor zero = negativeOne
  aperiodic :
    forall iterations : Nat, 0 < iterations ->
      iterate successor iterations zero ≠ zero
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element, element ∈ subset -> successor element ∈ subset) ->
      (forall element : Element, element ∈ subset -> predecessor element ∈ subset) ->
      forall element : Element, element ∈ subset

   
                                                                                        

                                                                         
                                                                      
                      

             

       
                                           
                                           
                                        
                                      
                 
                                                         
                                                       
   
  
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

                                                            
def TwoSidedClosedSubset
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  (forall element : Element, element ∈ subset -> is.successor element ∈ subset) /\
  (forall element : Element, element ∈ subset -> is.predecessor element ∈ subset)

                                                                           
                                  
def InductiveSubsetOfIntegerStructure
    (is : IntegerStructure Element SetObject)
    (subset : SetObject) : Prop :=
  is.zero ∈ subset /\ TwoSidedClosedSubset is subset

   
                                                                              

                                                                             
                                                                     

             

       
                                  
                                                       
                                 
                        
                              
                          
                                          
                              
                          
                                            
                             
                       
   
  
def FullTwoSidedPredicateInduction
    (is : IntegerStructure Element SetObject) : Prop :=
  forall predicate : Set Element,
    predicate is.zero ->
    (forall element : Element,
      predicate element ->
      predicate (is.successor element)) ->
    (forall element : Element,
      predicate element ->
      predicate (is.predecessor element)) ->
    forall element : Element,
      predicate element

   
                                                                                 

                                                                            
                                                                     
          

             

       
                                                             
                                             
                                                                      
                                     
   
  
theorem FullTwoSidedPredicateInductionOfComprehensionAdequacy
    (is : IntegerStructure Element SetObject)
    (adequacy : PredicateSetComprehensionAdequacy Element SetObject) :
    FullTwoSidedPredicateInduction is := by
  intro predicate baseCase successorStep predecessorStep element
  have representedBase : is.zero ∈ adequacy.Represent predicate :=
    (adequacy.MembershipIff predicate is.zero).2 baseCase
  have representedSuccessor :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        is.successor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (is.successor candidate)).2
      (successorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  have representedPredecessor :
      forall candidate : Element,
        candidate ∈ adequacy.Represent predicate ->
        is.predecessor candidate ∈ adequacy.Represent predicate := by
    intro candidate hCandidate
    exact (adequacy.MembershipIff predicate (is.predecessor candidate)).2
      (predecessorStep candidate
        ((adequacy.MembershipIff predicate candidate).1 hCandidate))
  exact (adequacy.MembershipIff predicate element).1
    (is.induction
      (adequacy.Represent predicate)
      representedBase
      representedSuccessor
      representedPredecessor
      element)

end

end LRA.NumberSystems.IntegerStructure
