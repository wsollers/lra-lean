-- LRA/VolumeII/Integers/Mendelson/Construction.lean
-- Mendelson positive-pair quotient construction of the integers.

import LRA.VolumeII.Integers.QuotientOrderedPairs
import LRA.VolumeII.PeanoSystems.PeanoSystem
import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace Integers
namespace Mendelson

/-!
Volume II label: integers-mendelson-construction
Lean module: LRA.VolumeII.Integers.Mendelson.Construction
Source: docs/number-systems/gpt-02b-integers-mendelson.md
Verification status: definitions complete; proofs pending
-/

abbrev PositiveNaturalPairData :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs

/-- Definition 1.1: a Mendelson representative is a pair of positive naturals. -/
structure PositivePair (positive_data : PositiveNaturalPairData) where
  left : positive_data.carrier
  right : positive_data.carrier

/-- Definition 1.2: Mendelson positive-pair equivalence. -/
def equivalent
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_data.addition first.left second.right =
    positive_data.addition second.left first.right

theorem equivalent_is_equivalence_relation
    (positive_data : PositiveNaturalPairData) :
    Equivalence (equivalent positive_data) := by
  sorry

def setoid (positive_data : PositiveNaturalPairData) :
    Setoid (PositivePair positive_data) where
  r := equivalent positive_data
  iseqv := equivalent_is_equivalence_relation positive_data

/-- Definition 1.3: Mendelson integer carrier. -/
abbrev Carrier (positive_data : PositiveNaturalPairData) :=
  Quotient (setoid positive_data)

/-- Definition 2.1: raw Mendelson addition. -/
def representative_addition
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left := positive_data.addition first.left second.left
  right := positive_data.addition first.right second.right

/-- Definition 2.2: raw additive inverse. -/
def representative_negation
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : PositivePair positive_data where
  left := value.right
  right := value.left

/-- Definition 3.1: raw Mendelson multiplication. -/
def representative_multiplication
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : PositivePair positive_data where
  left :=
    positive_data.addition
      (positive_data.multiplication first.left second.left)
      (positive_data.multiplication first.right second.right)
  right :=
    positive_data.addition
      (positive_data.multiplication first.left second.right)
      (positive_data.multiplication first.right second.left)

theorem representative_operations_respect_equivalence
    (positive_data : PositiveNaturalPairData) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_addition positive_data first₁ second₁)
          (representative_addition positive_data first₂ second₂)) ∧
    (∀ first second,
      equivalent positive_data first second →
        equivalent positive_data
          (representative_negation positive_data first)
          (representative_negation positive_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent positive_data first₁ first₂ →
      equivalent positive_data second₁ second₂ →
        equivalent positive_data
          (representative_multiplication positive_data first₁ second₁)
          (representative_multiplication positive_data first₂ second₂)) := by
  sorry

def positive_class
    (positive_data : PositiveNaturalPairData)
    (value : PositivePair positive_data) : Prop :=
  positive_data.nonstrict_order value.right value.left ∧
    ¬ equivalent positive_data value
      { left := positive_data.one, right := positive_data.one }

def representative_strict_order
    (positive_data : PositiveNaturalPairData)
    (first second : PositivePair positive_data) : Prop :=
  positive_class positive_data
    { left := positive_data.addition second.left first.right
      right := positive_data.addition first.left second.right }

theorem positive_classes_recover_peano_system
    (positive_data : PositiveNaturalPairData) :
    ∃ peano_system : PeanoSystems.PeanoSystem,
      Nonempty peano_system.carrier := by
  sorry

theorem mendelson_integers_form_ordered_ring
    (positive_data : PositiveNaturalPairData) :
    ∃ integer_model : NumberSystems.IntegerModel,
      integer_model.signature.carrier = Carrier positive_data := by
  sorry

theorem mendelson_compares_with_quotient_ordered_pairs
    (positive_data : PositiveNaturalPairData) :
    ∃ comparison :
      Carrier positive_data → QuotientOrderedPairs.Carrier positive_data,
      ∀ first second, comparison first = comparison second → first = second := by
  sorry

end Mendelson
end Integers
end VolumeII
end LRA
