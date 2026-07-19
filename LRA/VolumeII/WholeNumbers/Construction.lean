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
structure NaturalArithmeticContext where
  peano : PeanoSystem
  addition : peano.carrier → peano.carrier → peano.carrier
  multiplication : peano.carrier → peano.carrier → peano.carrier
  strictOrder : peano.carrier → peano.carrier → Prop

variable (context : NaturalArithmeticContext)

/-- `none` is the newly adjoined zero; `some n` is the embedded positive natural `n`. -/
abbrev Carrier := Option context.peano.carrier

/-- The adjoined zero. -/
def zero : Carrier context := none

/-- The embedded one. -/
def one : Carrier context := some context.peano.one

/-- Inclusion of the one-based natural carrier into the whole numbers. -/
def naturalEmbedding (value : context.peano.carrier) : Carrier context := some value

/-- Successor on the whole numbers. -/
def successor : Carrier context → Carrier context
  | none => some context.peano.one
  | some value => some (context.peano.successor value)

/-- Addition extends natural addition and makes the new zero an identity. -/
def addition : Carrier context → Carrier context → Carrier context
  | none, right => right
  | left, none => left
  | some left, some right => some (context.addition left right)

/-- Multiplication extends natural multiplication and makes zero absorbing. -/
def multiplication : Carrier context → Carrier context → Carrier context
  | none, _ => none
  | _, none => none
  | some left, some right => some (context.multiplication left right)

/-- Strict order puts zero below every positive natural and otherwise uses natural order. -/
def strictOrder : Carrier context → Carrier context → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => context.strictOrder left right

/-- Non-strict order is strict order or equality. -/
def nonstrictOrder (left right : Carrier context) : Prop :=
  strictOrder context left right ∨ left = right

/-- Every whole number is exactly one of zero or an embedded positive natural. -/
theorem basic_decomposition (value : Carrier context) :
    ((value = zero context) ∨
      (∃ natural, value = naturalEmbedding context natural)) ∧
    ¬ ((value = zero context) ∧
      (∃ natural, value = naturalEmbedding context natural)) ∧
    (∀ first second,
      value = naturalEmbedding context first →
      value = naturalEmbedding context second →
      first = second) := by
  sorry

/-- Zero is not a successor. -/
theorem zero_is_not_successor (value : Carrier context) :
    successor context value ≠ zero context := by
  sorry

/-- Successor on whole numbers is injective. -/
theorem successor_is_injective :
    ∀ first second,
      successor context first = successor context second → first = second := by
  sorry

/-- Induction from the adjoined zero. -/
theorem induction_from_zero
    (predicate : Carrier context → Prop)
    (zero_case : predicate (zero context))
    (successor_case : ∀ value, predicate value → predicate (successor context value)) :
    ∀ value, predicate value := by
  sorry

/-- Strong induction on the whole numbers. -/
theorem strong_induction
    (predicate : Carrier context → Prop)
    (step :
      ∀ value,
        (∀ smaller, strictOrder context smaller value → predicate smaller) →
        predicate value) :
    ∀ value, predicate value := by
  sorry

/-- Addition forms a commutative cancellative monoid. -/
theorem additive_structure :
    (∀ first second third,
      addition context (addition context first second) third =
        addition context first (addition context second third)) ∧
    (∀ first second,
      addition context first second = addition context second first) ∧
    (∀ value,
      addition context (zero context) value = value ∧
      addition context value (zero context) = value) ∧
    (∀ first second common,
      addition context first common = addition context second common →
      first = second) := by
  sorry

/-- Multiplication and addition form a nontrivial commutative semiring without zero divisors. -/
theorem semiring_structure :
    zero context ≠ one context ∧
    (∀ first second third,
      multiplication context (multiplication context first second) third =
        multiplication context first (multiplication context second third)) ∧
    (∀ first second,
      multiplication context first second = multiplication context second first) ∧
    (∀ value,
      multiplication context (one context) value = value ∧
      multiplication context value (one context) = value) ∧
    (∀ value,
      multiplication context (zero context) value = zero context ∧
      multiplication context value (zero context) = zero context) ∧
    (∀ first second third,
      multiplication context first (addition context second third) =
        addition context
          (multiplication context first second)
          (multiplication context first third)) ∧
    (∀ first second,
      multiplication context first second = zero context →
      first = zero context ∨ second = zero context) := by
  sorry

/-- The whole-number order is discrete, total, and compatible with arithmetic. -/
theorem ordered_semiring_structure :
    (∀ value, nonstrictOrder context (zero context) value) ∧
    (∀ first second,
      strictOrder context first second ∨ first = second ∨ strictOrder context second first) ∧
    (∀ first second third,
      strictOrder context first second →
      strictOrder context second third →
      strictOrder context first third) ∧
    (∀ first second translation,
      strictOrder context first second ↔
      strictOrder context
        (addition context first translation)
        (addition context second translation)) ∧
    (∀ first second positive,
      positive ≠ zero context →
      (strictOrder context first second ↔
        strictOrder context
          (multiplication context first positive)
          (multiplication context second positive))) := by
  sorry

/-- Every nonempty whole-number subset has a least element. -/
theorem well_ordering
    (subset : Carrier context → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder context least value := by
  sorry

/-- The natural embedding preserves successor, arithmetic, and order. -/
theorem natural_embedding_preserves_structure :
    (∀ value,
      naturalEmbedding context (context.peano.successor value) =
        successor context (naturalEmbedding context value)) ∧
    (∀ first second,
      naturalEmbedding context (context.addition first second) =
        addition context
          (naturalEmbedding context first)
          (naturalEmbedding context second)) ∧
    (∀ first second,
      naturalEmbedding context (context.multiplication first second) =
        multiplication context
          (naturalEmbedding context first)
          (naturalEmbedding context second)) ∧
    (∀ first second,
      strictOrder context
          (naturalEmbedding context first)
          (naturalEmbedding context second) ↔
        context.strictOrder first second) := by
  sorry

end WholeNumbers
end VolumeII
end LRA
