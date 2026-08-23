import LRA.Operation
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.WellFoundedness
import LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator

   
                                                                         
                                                                                 
                                                                           
                                                                                
                                                                           
                                  

                                                                        
                                                                           
                                                                         
                                                                            
                  
  

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                

                                                                              
                                                                            
                                                       
  
noncomputable def LandauAddition
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

                                                              
theorem LandauAdditionClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (LandauAddition model) := by
  sorry

                                                                       
theorem LandauAdditionWellDefined
    (model : PeanoSystem Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry

                                                               
theorem LandauAdditionWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauAddition model left model.one = model.successor left := by
  sorry

                                                                                  
theorem LandauAdditionSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauAddition model left (model.successor right) =
      model.successor (LandauAddition model left right) := by
  sorry

                                                                           
theorem LandauAdditionIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauAddition model) := by
  sorry

                                                                           
theorem LandauAdditionIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauAddition model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
