import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.PeanoSystem.Definition

   
                                    
                                                                          
                                                                      
                                                                         
                                                                          
                                                                        
                                    
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.Set

                                                                         
                                                                            
                                  
def PresburgerPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      PresburgerElement (PredicateSet PresburgerElement) where
  one := PresburgerElement.zero
  successor := PresburgerElement.succ
  one_not_successor := PresburgerZeroIsNotSuccessor
  successor_injective := PresburgerSuccessorInjective
  induction := PresburgerInductionPrinciple

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                    
                                                        
                                                               
def PresburgerArithmetic
    (model : PresburgerModel Element SetObject) : Prop :=
  (forall element : Element,
    model.successor element ≠ model.zero) /\
  (forall first_element second_element : Element,
    model.successor first_element = model.successor second_element ->
      first_element = second_element) /\
  (forall subset : SetObject,
    model.zero ∈ subset ->
    (forall element : Element,
      element ∈ subset ->
      model.successor element ∈ subset) ->
    forall element : Element,
      element ∈ subset)

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
