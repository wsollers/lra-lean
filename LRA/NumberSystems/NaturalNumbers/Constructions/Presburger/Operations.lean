import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

   
                                                                          
                                                                         
                                                                        
                                                                        
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

open LRA.NumberSystems.PeanoSystem.Recursion

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                 

                                                                            
                                                                       
                  
  
noncomputable def PresburgerAddition
    (model : PresburgerModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value))

                                                                      
theorem PresburgerAdditionClauses
    (model : PresburgerModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model) := by
  sorry

                                                                               
theorem PresburgerAdditionWellDefined
    (model : PresburgerModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
