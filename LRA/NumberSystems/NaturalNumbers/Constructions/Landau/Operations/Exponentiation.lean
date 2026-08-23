import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                      

                                                                             
                                                                            
                                      
  
noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))

                                                                          
theorem LandauExponentiationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base)
      (LandauExponentiation model) := by
  sorry

                                                                                   
theorem LandauExponentiationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists exponentiation : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun base => base)
        (fun base value => LandauMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun base => base)
          (fun base value => LandauMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation := by
  sorry

                                                                           
theorem LandauExponentiationWithOne
    (model : PeanoSystem Element SetObject)
    (base : Element) :
    LandauExponentiation model base model.one = base := by
  sorry

                                                                                              
theorem LandauExponentiationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (base exponent : Element) :
    LandauExponentiation model base (model.successor exponent) =
      LandauMultiplication model (LandauExponentiation model base exponent) base := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
