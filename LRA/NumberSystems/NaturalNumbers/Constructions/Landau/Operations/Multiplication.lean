import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                      

                                                                             
                                                                  
                                                               
  
noncomputable def LandauMultiplication
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left))

                                                                          
theorem LandauMultiplicationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun left => left)
      (fun left value => LandauAddition model value left)
      (LandauMultiplication model) := by
  sorry

                                                                                   
theorem LandauMultiplicationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun left => left)
        (fun left value => LandauAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun left => left)
          (fun left value => LandauAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication := by
  sorry

                                                                           
theorem LandauMultiplicationWithOne
    (model : PeanoSystem Element SetObject)
    (left : Element) :
    LandauMultiplication model left model.one = left := by
  sorry

                                                                                              
theorem LandauMultiplicationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (left right : Element) :
    LandauMultiplication model left (model.successor right) =
      LandauAddition model (LandauMultiplication model left right) left := by
  sorry

                                                                                                            
theorem LandauMultiplicationDistributesOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

                                                                                                                                
theorem LandauLeftDistributivityOfMultiplicationOverAddition
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

                                                                                                                                
theorem LandauMultiplicationDistributesOverAdditionBothSides
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (LandauMultiplication model)
      (LandauAddition model) := by
  sorry

                                                                                       
theorem LandauMultiplicationIsAssociative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (LandauMultiplication model) := by
  sorry

                                                                                       
theorem LandauMultiplicationIsCommutative
    (model : PeanoSystem Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (LandauMultiplication model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
