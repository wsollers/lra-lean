import LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/-- Addition forms a commutative cancellative monoid. -/
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

/-- Multiplication and addition form a nontrivial commutative semiring without zero divisors. -/
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

/-- The whole-number order is discrete, total, and compatible with arithmetic. -/
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

/-- The lifted non-strict order is reflexive. -/
theorem nonstrict_order_refl :
    ∀ value, nonstrictOrder natural_data value value := by
  intro value
  exact Or.inr rfl

/-- The lifted non-strict order is transitive. -/
theorem nonstrict_order_trans :
    ∀ first second third,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second third →
      nonstrictOrder natural_data first third := by
  sorry

/-- The lifted non-strict order is antisymmetric. -/
theorem nonstrict_order_antisymm :
    ∀ first second,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second first →
      first = second := by
  sorry

/-- The lifted non-strict order is total. -/
theorem nonstrict_order_total :
    ∀ first second,
      nonstrictOrder natural_data first second ∨
        nonstrictOrder natural_data second first := by
  sorry

/-- Addition preserves the lifted non-strict order. -/
theorem addition_preserves_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (addition natural_data first translation)
          (addition natural_data second translation) := by
  sorry

/-- Addition preserves and reflects the lifted non-strict order. -/
theorem addition_preserves_and_reflects_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation) ↔
      nonstrictOrder natural_data first second := by
  sorry

/-- Multiplication by a nonnegative whole number preserves the lifted
non-strict order. -/
theorem multiplication_preserves_nonstrict_order :
    ∀ first second positive,
      nonstrictOrder natural_data (zero natural_data) positive →
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive) := by
  sorry

/-- Every nonempty whole-number subset has a least element. -/
theorem well_ordering
    (subset : Carrier natural_data → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder natural_data least value := by
  sorry

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
