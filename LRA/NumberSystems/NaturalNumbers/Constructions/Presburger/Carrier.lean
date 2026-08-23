import LRA.Set.PredicateSet.Definition
import LRA.NumberSystems.PeanoSystem.Definition

   
                                                                
                                                                     
                                                                          
                                                                          
                                                                    

                                                                         
                                                                          
                                                                  
                                                                       
                                                                           
                                                     

                                                                         
                                                                        
                                                                   
                                                                
                                                                      
                                                                           
                                                                           
                                                                      
                                                
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set

                                                   
inductive PresburgerElement where
  | zero
  | succ (n : PresburgerElement)

                                                                        
                                                                     
                                                               
def PresburgerLessThan : PresburgerElement → PresburgerElement → Prop
  | _, .zero => False
  | .zero, .succ _ => True
  | .succ m, .succ n => PresburgerLessThan m n

                                                      
                                   
theorem PresburgerZeroIsNotSuccessor :
    ∀ n : PresburgerElement, PresburgerElement.succ n ≠ PresburgerElement.zero := by
  sorry

                                                                     
theorem PresburgerSuccessorInjective :
    ∀ m n : PresburgerElement,
      PresburgerElement.succ m = PresburgerElement.succ n → m = n := by
  sorry

                                                                          
                               
theorem PresburgerInductionPrinciple :
    ∀ subset : PredicateSet PresburgerElement,
      PresburgerElement.zero ∈ subset →
      (∀ n : PresburgerElement, n ∈ subset → PresburgerElement.succ n ∈ subset) →
      ∀ n : PresburgerElement, n ∈ subset := by

                                                                          
                               
  sorry

                                                                        
                                
structure PresburgerModel (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  zero : Element
  successor : Element -> Element
  zero_not_successor :
    forall element : Element,
      successor element ≠ zero
  successor_injective :
    forall first_element second_element : Element,
      successor first_element = successor second_element ->
      first_element = second_element
  induction :
    forall subset : SetObject,
      zero ∈ subset ->
      (forall element : Element,
        element ∈ subset ->
        successor element ∈ subset) ->
      forall element : Element,
        element ∈ subset
  lessThan : Element -> Element -> Prop

                                                                       
                                                 
def PresburgerModel.toPeanoSystem
    {Element : Type u} {SetObject : Type v} [Membership Element SetObject]
    (model : PresburgerModel Element SetObject) :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject where
  one := model.zero
  successor := model.successor
  one_not_successor := model.zero_not_successor
  successor_injective := model.successor_injective
  induction := model.induction

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
