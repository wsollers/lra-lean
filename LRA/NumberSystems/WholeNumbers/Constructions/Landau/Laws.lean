import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

                                                        
theorem additive_structure :
    (∀ first second third,
      addition natural_data (addition natural_data first second) third =
        addition natural_data first (addition natural_data second third)) ∧
    (∀ first second,
      addition natural_data first second = addition natural_data second first) ∧
    (∀ value,
      addition natural_data (zero natural_data) value = value ∧
      addition natural_data value (zero natural_data) = value) ∧
    (∀ first second common,
      addition natural_data first common = addition natural_data second common →
      first = second) := by
  sorry

                                                                                                
theorem semiring_structure :
    zero natural_data ≠ one natural_data ∧
    (∀ first second third,
      multiplication natural_data (multiplication natural_data first second) third =
        multiplication natural_data first (multiplication natural_data second third)) ∧
    (∀ first second,
      multiplication natural_data first second = multiplication natural_data second first) ∧
    (∀ value,
      multiplication natural_data (one natural_data) value = value ∧
      multiplication natural_data value (one natural_data) = value) ∧
    (∀ value,
      multiplication natural_data (zero natural_data) value = zero natural_data ∧
      multiplication natural_data value (zero natural_data) = zero natural_data) ∧
    (∀ first second third,
      multiplication natural_data first (addition natural_data second third) =
        addition natural_data
          (multiplication natural_data first second)
          (multiplication natural_data first third)) ∧
    (∀ first second,
      multiplication natural_data first second = zero natural_data →
      first = zero natural_data ∨ second = zero natural_data) := by
  sorry

                                                                                 
theorem ordered_semiring_structure :
    (∀ value, nonstrictOrder natural_data (zero natural_data) value) ∧
    (∀ first second,
      strictOrder natural_data first second ∨ first = second ∨ strictOrder natural_data second first) ∧
    (∀ first second third,
      strictOrder natural_data first second →
      strictOrder natural_data second third →
      strictOrder natural_data first third) ∧
    (∀ first second translation,
      strictOrder natural_data first second ↔
      strictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation)) ∧
    (∀ first second positive,
      positive ≠ zero natural_data →
      (strictOrder natural_data first second ↔
        strictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive))) := by
  sorry

                                                
theorem nonstrict_order_refl :
    ∀ value, nonstrictOrder natural_data value value := by

                                                
  sorry

                                                 
theorem nonstrict_order_trans :
    ∀ first second third,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second third →
      nonstrictOrder natural_data first third := by
  sorry

                                                    
theorem nonstrict_order_antisymm :
    ∀ first second,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second first →
      first = second := by
  sorry

                                            
theorem nonstrict_order_total :
    ∀ first second,
      nonstrictOrder natural_data first second ∨
        nonstrictOrder natural_data second first := by
  sorry

                                                      
theorem addition_preserves_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (addition natural_data first translation)
          (addition natural_data second translation) := by
  sorry

                                                                   
theorem addition_preserves_and_reflects_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation) ↔
      nonstrictOrder natural_data first second := by
  sorry

                                                                     
                    
theorem multiplication_preserves_nonstrict_order :
    ∀ first second positive,
      nonstrictOrder natural_data (zero natural_data) positive →
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive) := by
  sorry

                                                              
theorem well_ordering
    (subset : Carrier natural_data → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder natural_data least value := by
  sorry

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
