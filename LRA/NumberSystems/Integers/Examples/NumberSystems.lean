import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.Integers.Examples

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.Integers

theorem mathlib_every_element_is_integer_numeral :
    ∀ value : mathlibIntegerModel.Carrier,
      ∃ integer : Int, IntegerNumeral mathlibIntegerModel integer = value := by
  sorry
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibIntegerModel
  EveryElementIsIntegerNumeral := mathlib_every_element_is_integer_numeral

end LRA.NumberSystems.Integers.Examples
