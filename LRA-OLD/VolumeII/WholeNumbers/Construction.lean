-- LRA/VolumeII/WholeNumbers/Construction.lean
-- Construction of whole numbers by adjoining zero to a one-based Peano carrier.

import LRA.VolumeII.PeanoSystems.PeanoSystem

namespace LRA
namespace VolumeII
namespace WholeNumbers

open PeanoSystems

/-!
Lean module: LRA.VolumeII.WholeNumbers.Construction
Source: docs/number-systems/gpt-01b-whole-numbers.md
Verification status: definitions complete; theorem proofs pending
-/

/-- Arithmetic data already constructed on the one-based natural carrier. -/
structure NaturalArithmeticForWholeNumbers where
  peano : PeanoSystem
  addition : peano.carrier → peano.carrier → peano.carrier
  multiplication : peano.carrier → peano.carrier → peano.carrier
  strictOrder : peano.carrier → peano.carrier → Prop

variable (natural_data : NaturalArithmeticForWholeNumbers)

/-- `none` is the newly adjoined zero; `some n` is the embedded positive natural `n`. -/
abbrev Carrier := Option natural_data.peano.carrier

/-- The adjoined zero. -/
def zero : Carrier natural_data := none

/-- The embedded one. -/
def one : Carrier natural_data := some natural_data.peano.one

/-- Inclusion of the one-based natural carrier into the whole numbers. -/
def naturalEmbedding (value : natural_data.peano.carrier) : Carrier natural_data := some value

/-- Successor on the whole numbers. -/
def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.peano.one
  | some value => some (natural_data.peano.successor value)

/-- Addition extends natural addition and makes the new zero an identity. -/
def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right => some (natural_data.addition left right)

/-- Multiplication extends natural multiplication and makes zero absorbing. -/
def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right => some (natural_data.multiplication left right)

/-- Strict order puts zero below every positive natural and otherwise uses natural order. -/
def strictOrder : Carrier natural_data → Carrier natural_data → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => natural_data.strictOrder left right

/-- Non-strict order is strict order or equality. -/
def nonstrictOrder (left right : Carrier natural_data) : Prop :=
  strictOrder natural_data left right ∨ left = right

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

/-- Every nonempty whole-number subset has a least element. -/
theorem well_ordering
    (subset : Carrier natural_data → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder natural_data least value := by
  sorry

/-- The natural embedding preserves successor, arithmetic, and order. -/
theorem natural_embedding_preserves_structure :
    (∀ value,
      naturalEmbedding natural_data (natural_data.peano.successor value) =
        successor natural_data (naturalEmbedding natural_data value)) ∧
    (∀ first second,
      naturalEmbedding natural_data (natural_data.addition first second) =
        addition natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      naturalEmbedding natural_data (natural_data.multiplication first second) =
        multiplication natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      strictOrder natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second) ↔
        natural_data.strictOrder first second) := by
  sorry

end WholeNumbers
end VolumeII
end LRA
