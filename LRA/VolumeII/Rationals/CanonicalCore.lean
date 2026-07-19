-- Proof-ready canonical rational quotient.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.VolumeII.Rationals.CanonicalCore

open NumberSystems

structure Input where
  integer_model : IntegerModel
  denominator : Type
  oneDenominator : denominator
  denominatorMul : denominator → denominator → denominator
  toInteger : denominator → integer_model.signature.carrier
  positive : ∀ d,
    integer_model.signature.strict_order
      integer_model.signature.zero (toInteger d)

structure Representative (input : Input) where
  numerator : input.integer_model.signature.carrier
  denominator : input.denominator

def equivalent (input : Input)
    (first second : Representative input) : Prop :=
  input.integer_model.signature.multiplication
      first.numerator (input.toInteger second.denominator) =
    input.integer_model.signature.multiplication
      second.numerator (input.toInteger first.denominator)

theorem equivalent_is_equivalence (input : Input) :
    Equivalence (equivalent input) := by
  sorry

def setoid (input : Input) : Setoid (Representative input) where
  r := equivalent input
  iseqv := equivalent_is_equivalence input

abbrev Carrier (input : Input) := Quotient (setoid input)

def representativeAddition (input : Input)
    (first second : Representative input) : Representative input where
  numerator := input.integer_model.signature.addition
    (input.integer_model.signature.multiplication
      first.numerator (input.toInteger second.denominator))
    (input.integer_model.signature.multiplication
      second.numerator (input.toInteger first.denominator))
  denominator := input.denominatorMul first.denominator second.denominator

def representativeMultiplication (input : Input)
    (first second : Representative input) : Representative input where
  numerator := input.integer_model.signature.multiplication
    first.numerator second.numerator
  denominator := input.denominatorMul first.denominator second.denominator

def representativeNegation (input : Input)
    (value : Representative input) : Representative input where
  numerator := input.integer_model.signature.negation value.numerator
  denominator := value.denominator

def representativeStrictOrder (input : Input)
    (first second : Representative input) : Prop :=
  input.integer_model.signature.strict_order
    (input.integer_model.signature.multiplication
      first.numerator (input.toInteger second.denominator))
    (input.integer_model.signature.multiplication
      second.numerator (input.toInteger first.denominator))

theorem addition_respects_equivalence (input : Input) :
    ∀ first first' second second',
      equivalent input first first' →
      equivalent input second second' →
      equivalent input
        (representativeAddition input first second)
        (representativeAddition input first' second') := by
  sorry

theorem multiplication_respects_equivalence (input : Input) :
    ∀ first first' second second',
      equivalent input first first' →
      equivalent input second second' →
      equivalent input
        (representativeMultiplication input first second)
        (representativeMultiplication input first' second') := by
  sorry

theorem negation_respects_equivalence (input : Input) :
    ∀ first second,
      equivalent input first second →
      equivalent input
        (representativeNegation input first)
        (representativeNegation input second) := by
  sorry

theorem strict_order_respects_equivalence (input : Input) :
    ∀ first first' second second',
      equivalent input first first' →
      equivalent input second second' →
      (representativeStrictOrder input first second ↔
        representativeStrictOrder input first' second') := by
  sorry

theorem quotient_addition_exists (input : Input) :
    ∃ addition : Carrier input → Carrier input → Carrier input,
      ∀ first second,
        addition (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representativeAddition input first second) := by
  sorry

theorem quotient_multiplication_exists (input : Input) :
    ∃ multiplication : Carrier input → Carrier input → Carrier input,
      ∀ first second,
        multiplication (Quotient.mk _ first) (Quotient.mk _ second) =
          Quotient.mk _ (representativeMultiplication input first second) := by
  sorry

theorem quotient_negation_exists (input : Input) :
    ∃ negation : Carrier input → Carrier input,
      ∀ value,
        negation (Quotient.mk _ value) =
          Quotient.mk _ (representativeNegation input value) := by
  sorry

theorem ordered_field_laws (input : Input) : Prop := by
  sorry

end LRA.VolumeII.Rationals.CanonicalCore
