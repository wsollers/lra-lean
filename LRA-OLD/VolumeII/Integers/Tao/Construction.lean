-- LRA/VolumeII/Integers/Tao/Construction.lean
-- Tao formal-difference construction of the integers.

import LRA.VolumeII.Integers.QuotientOrderedPairs
import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace Integers
namespace Tao

/-!
Volume II label: integers-tao-construction
Lean module: LRA.VolumeII.Integers.Tao.Construction
Source: docs/number-systems/gpt-02a-integers-tao.md
Verification status: definitions complete; proofs pending

Tao's construction presents integers as formal differences `a -- b` of whole
numbers, with equality given by cross-addition.  This module keeps that
presentation explicit while reusing the same whole-number arithmetic interface
as the default quotient-ordered-pairs construction.
-/

abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

/-- Definition 1.1: Tao formal integer expression `a -- b`. -/
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier

/-- Definition 1.2: Tao equality of formal differences. -/
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend

/-- Theorem 1.3: Tao equality is an equivalence relation. -/
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data) := by
  sorry

def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data

/-- Definition 1.4: Tao integer carrier. -/
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)

/-- Definition 2.1: zero as `0 -- 0`. -/
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero

/-- Definition 2.2: embedding of whole numbers as `n -- 0`. -/
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second := by
  sorry

/-- Definition 3.1: raw Tao addition. -/
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend

/-- Definition 3.2: raw Tao negation. -/
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend

/-- Definition 4.1: raw Tao multiplication. -/
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

theorem representative_operations_respect_equivalence
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_addition whole_data first₁ second₁)
          (representative_addition whole_data first₂ second₂)) ∧
    (∀ first second,
      equivalent whole_data first second →
        equivalent whole_data
          (representative_negation whole_data first)
          (representative_negation whole_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_multiplication whole_data first₁ second₁)
          (representative_multiplication whole_data first₂ second₂)) := by
  sorry

def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend

def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second

theorem tao_integers_form_ordered_ring
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integer_model : NumberSystems.IntegerModel,
      integer_model.signature.carrier = Carrier whole_data := by
  sorry

theorem tao_compares_with_quotient_ordered_pairs
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ comparison :
      Carrier whole_data → QuotientOrderedPairs.Carrier whole_data,
      ∀ first second, comparison first = comparison second → first = second := by
  sorry

end Tao
end Integers
end VolumeII
end LRA
