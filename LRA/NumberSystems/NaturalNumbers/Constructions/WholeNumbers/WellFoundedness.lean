import LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Carrier
import LRA.Set.PredicateSet.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

open LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/-- Every whole number is exactly one of zero or an embedded positive natural. -/
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

/-- Zero is not a successor. -/
theorem zero_is_not_successor (value : Carrier natural_data) :
    successor natural_data value ≠ zero natural_data := by
  sorry

/-- Successor on whole numbers is injective. -/
theorem successor_is_injective :
    ∀ first second,
      successor natural_data first = successor natural_data second → first = second := by
  sorry

/-- Induction from the adjoined zero. -/
theorem induction_from_zero
    (predicate : Carrier natural_data → Prop)
    (zero_case : predicate (zero natural_data))
    (successor_case : ∀ value, predicate value → predicate (successor natural_data value)) :
    ∀ value, predicate value := by
  sorry

/-- Strong induction on the whole numbers. -/
theorem strong_induction
    (predicate : Carrier natural_data → Prop)
    (step :
      ∀ value,
        (∀ smaller, strictOrder natural_data smaller value → predicate smaller) →
        predicate value) :
    ∀ value, predicate value := by
  sorry

/-- The whole-number construction, packaged as a `PeanoSystem` over its own
carrier and `PredicateSet` subsets -- the same shape `VonNeumannPeanoSystem`/
`PresburgerPeanoSystem`/`LandauPeanoSystem` use for their own backends.
`Carrier natural_data → Prop` and `PredicateSet (Carrier natural_data)` are
definitionally the same type, so `induction_from_zero` fits the `induction`
field directly. -/
def WholeNumbersPeanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem
      (Carrier natural_data) (PredicateSet (Carrier natural_data)) where
  one := zero natural_data
  successor := successor natural_data
  one_not_successor := zero_is_not_successor natural_data
  successor_injective := successor_is_injective natural_data
  induction := induction_from_zero natural_data

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
