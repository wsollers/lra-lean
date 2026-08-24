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

end LRA.NumberSystems.RealNumbers.Cauchy
