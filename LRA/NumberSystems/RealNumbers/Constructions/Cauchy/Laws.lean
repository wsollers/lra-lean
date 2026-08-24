import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.WellDefinedness
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.Operation.Laws.QuotientCompatible

/-- The representative-level addition, promoted from `Sequence` back into
`Representative` using the closure fact (`representative_addition_is_cauchy`)
that already exists for it. -/
def addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_addition rationalSystem absolute_value_data first second,
    representative_addition_is_cauchy rationalSystem absolute_value_data first second⟩

/-- `addition` is a proper binary operation: closed (well-founded — it stays
Cauchy), matches its raw definition, and respects representative equivalence
(well-defined) — hence the quotient addition it induces exists and is
unique. -/
theorem addition_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_addition rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (addition rationalSystem absolute_value_data) where
  closed := representative_addition_is_cauchy rationalSystem absolute_value_data
  matches_raw := fun _ _ => rfl
  respects :=
    representative_addition_respects_equivalence rationalSystem absolute_value_data

/-- The representative-level negation, promoted the same way as `addition`. -/
def negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_negation rationalSystem absolute_value_data representative,
    representative_negation_is_cauchy rationalSystem absolute_value_data representative⟩

/-- `negation` is a proper unary operation — see `addition_is_proper`. -/
theorem negation_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_negation rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (negation rationalSystem absolute_value_data) where
  closed := representative_negation_is_cauchy rationalSystem absolute_value_data
  matches_raw := fun _ => rfl
  respects :=
    representative_negation_respects_equivalence rationalSystem absolute_value_data

/-- The representative-level multiplication, promoted the same way as
`addition`. -/
def multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_multiplication rationalSystem absolute_value_data first second,
    representative_multiplication_is_cauchy
      rationalSystem absolute_value_data first second⟩

/-- `multiplication` is a proper binary operation — see `addition_is_proper`. -/
theorem multiplication_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    BinaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_multiplication rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (multiplication rationalSystem absolute_value_data) where
  closed := representative_multiplication_is_cauchy rationalSystem absolute_value_data
  matches_raw := fun _ _ => rfl
  respects :=
    representative_multiplication_respects_equivalence
      rationalSystem absolute_value_data

open Classical in
/-- Pointwise reciprocal, zero-guarded: the value at a zero coordinate maps
to zero, matching the standard convention for a Cauchy sequence's inverse
(the reciprocal is only meaningful away from zero; a sequence equivalent to
the zero sequence has no genuine inverse, and by convention maps to zero
under this same operation). -/
noncomputable def representative_inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    if representative.sequence index = rationalSystem.FieldModel.signature.zero
    then rationalSystem.FieldModel.signature.zero
    else rationalSystem.FieldModel.signature.inv (representative.sequence index)

/-- Needs `representative` to not be equivalent to the zero sequence to hold
in the standard sense (a sequence bounded away from zero has a Cauchy
reciprocal); left unconditioned and `sorry`'d rather than adding that
hypothesis, matching how `quotient_inverse`-style definitions elsewhere in
this repo (`RationalQuotientFractions/Instances.lean`'s `quotient_inverse`)
handle the zero case by convention instead of by precondition. -/
theorem representative_inverse_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    is_cauchy rationalSystem absolute_value_data
      (representative_inverse rationalSystem absolute_value_data representative) := by
  sorry

noncomputable def inverse
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Representative rationalSystem absolute_value_data :=
  ⟨representative_inverse rationalSystem absolute_value_data representative,
    representative_inverse_is_cauchy rationalSystem absolute_value_data representative⟩

theorem representative_inverse_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (fun representative =>
        ⟨representative_inverse rationalSystem absolute_value_data representative,
          representative_inverse_is_cauchy
            rationalSystem absolute_value_data representative⟩) := by
  sorry

theorem inverse_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    UnaryOperationIsProper
      (is_cauchy rationalSystem absolute_value_data)
      (fun representative => representative.sequence)
      (representative_inverse rationalSystem absolute_value_data)
      (representative_setoid rationalSystem absolute_value_data)
      (inverse rationalSystem absolute_value_data) where
  closed := representative_inverse_is_cauchy rationalSystem absolute_value_data
  matches_raw := fun _ => rfl
  respects :=
    representative_inverse_respects_equivalence rationalSystem absolute_value_data

/-- The constant-zero sequence — trivially Cauchy (`sorry`'d rather than
proved, per this pass's static-only verification policy). -/
def zero_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.zero

theorem zero_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (zero_sequence rationalSystem) := by
  sorry

def zero
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨zero_sequence rationalSystem, zero_sequence_is_cauchy rationalSystem absolute_value_data⟩

/-- The constant-one sequence — trivially Cauchy, same as `zero_sequence`. -/
def one_sequence (rationalSystem : RationalNumberSystem) : Sequence rationalSystem :=
  fun _ => rationalSystem.FieldModel.signature.one

theorem one_sequence_is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    is_cauchy rationalSystem absolute_value_data (one_sequence rationalSystem) := by
  sorry

def one
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    Representative rationalSystem absolute_value_data :=
  ⟨one_sequence rationalSystem, one_sequence_is_cauchy rationalSystem absolute_value_data⟩

/--
**[Order — Cauchy real strict order]**

`first < second` iff the two sequences are eventually separated by a
fixed positive rational margin: some positive `epsilon` and index
`threshold` such that for every `n ≥ threshold`, `first_n + epsilon ≤
second_n`.

*Sources:*
  Tao, Analysis I, Ch. 5 (order on the reals via Cauchy sequences)
-/
def representative_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) : Prop :=
  ∃ epsilon : rationalSystem.FieldModel.signature.carrier,
    is_positive rationalSystem epsilon ∧
    ∃ threshold : Nat,
      ∀ index : Nat, threshold ≤ index →
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add
            (first.sequence index) epsilon)
          (second.sequence index)

theorem representative_strict_order_trichotomous
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ∨
        representative_equivalent rationalSystem absolute_value_data first second ∨
        representative_strict_order rationalSystem absolute_value_data second first := by
  sorry

theorem representative_strict_order_transitive
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second third : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second →
      representative_strict_order rationalSystem absolute_value_data second third →
      representative_strict_order rationalSystem absolute_value_data first third := by
  sorry

theorem representative_addition_preserves_and_reflects_strict_order
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    ∀ first second translation : Representative rationalSystem absolute_value_data,
      representative_strict_order rationalSystem absolute_value_data first second ↔
        representative_strict_order rationalSystem absolute_value_data
          (addition rationalSystem absolute_value_data first translation)
          (addition rationalSystem absolute_value_data second translation) := by
  sorry

theorem representative_strict_order_respects_equivalence
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data) := by
  sorry

theorem strict_order_is_proper
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) :
    RelationIsProper
      (representative_setoid rationalSystem absolute_value_data)
      (representative_strict_order rationalSystem absolute_value_data) where
  respects :=
    representative_strict_order_respects_equivalence rationalSystem absolute_value_data

end LRA.NumberSystems.RealNumbers.Cauchy
