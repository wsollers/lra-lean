import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
import LRA.Set.PredicateSet.Definition

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

                                                                                 
theorem basic_decomposition (value : Carrier natural_data) :
    ((value = zero natural_data) ∨
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    ¬ ((value = zero natural_data) ∧
      (∃ natural, value = naturalEmbedding natural_data natural)) ∧
    (∀ first second,
      value = naturalEmbedding natural_data first →
      value = naturalEmbedding natural_data second →
      first = second) := by
  sorry

                               
theorem zero_is_not_successor (value : Carrier natural_data) :
    successor natural_data value ≠ zero natural_data := by
  sorry

                                               
theorem successor_is_injective :
    ∀ first second,
      successor natural_data first = successor natural_data second → first = second := by
  sorry

                                        
theorem induction_from_zero
    (predicate : Carrier natural_data → Prop)
    (zero_case : predicate (zero natural_data))
    (successor_case : ∀ value, predicate value → predicate (successor natural_data value)) :
    ∀ value, predicate value := by
  sorry

                                             
theorem strong_induction
    (predicate : Carrier natural_data → Prop)
    (step :
      ∀ value,
        (∀ smaller, strictOrder natural_data smaller value → predicate smaller) →
        predicate value) :
    ∀ value, predicate value := by
  sorry

                                                                           
                                                                             
                                                                       
                                                                           
                                                                           
                  
def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (PredicateSet (Carrier natural_data)) where
  one := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
