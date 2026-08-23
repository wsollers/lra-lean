import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Examples

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers

theorem mathlib_every_element_is_integer_numeral :
    ∀ value : mathlibDiscretelyOrderedIntegralDomainModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibDiscretelyOrderedIntegralDomainModel integer = value := by
  sorry

                                                                      

             

       
                                                                  
   
  
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

end LRA.NumberSystems.Integers.Examples
