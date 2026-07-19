-- LRA/VolumeII/Rationals/ContinuedFractions.lean
-- Finite and infinite simple continued fractions.

import LRA.VolumeII.Rationals.RationalQuotientFractions
import LRA.VolumeII.Reals.Irrationals

namespace LRA
namespace VolumeII
namespace Rationals
namespace ContinuedFractions

/-!
Volume II label: continued-fractions
Lean module: LRA.VolumeII.Rationals.ContinuedFractions
Source: docs/number-systems/gpt-03b-continued-fractions.md
Verification status: statement-accepted-proof-pending
-/

open NumberSystems

structure FiniteSimpleContinuedFraction (integer_model : IntegerModel) where
  head : integer_model.signature.carrier
  tail : List integer_model.signature.carrier

structure FiniteValue
    (integer_model : IntegerModel)
    (rational_model : RationalModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (fraction : FiniteSimpleContinuedFraction integer_model)
    (value : rational_model.signature.carrier) : Prop where
  evaluates_by_successive_reciprocals :
    ∃ partial_values : List rational_model.signature.carrier,
      partial_values.length = fraction.tail.length + 1 ∧
        partial_values.head? = some value

def canonical
    (integer_model : IntegerModel)
    (fraction : FiniteSimpleContinuedFraction integer_model) : Prop :=
  fraction.tail = [] ∨
    ∃ last : integer_model.signature.carrier,
      last ∈ fraction.tail ∧
        integer_model.signature.strict_order integer_model.signature.one last

structure Convergents
    (integer_model : IntegerModel)
    (fraction : Nat → integer_model.signature.carrier) where
  numerator : Nat → integer_model.signature.carrier
  denominator : Nat → integer_model.signature.carrier
  recurrence_holds :
    ∀ index : Nat,
      numerator (index + 2) =
        integer_model.signature.addition
          (integer_model.signature.multiplication
            (fraction (index + 2)) (numerator (index + 1)))
          (numerator index)

def InfiniteSimpleContinuedFraction (integer_model : IntegerModel) : Type :=
  Nat → integer_model.signature.carrier

def eventually_periodic
    {integer_model : IntegerModel}
    (fraction : InfiniteSimpleContinuedFraction integer_model) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index

theorem rational_has_unique_canonical_finite_expansion
    (integer_model : IntegerModel)
    (rational_model : RationalModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (value : rational_model.signature.carrier) :
    ∃ fraction : FiniteSimpleContinuedFraction integer_model,
      canonical integer_model fraction ∧
        FiniteValue integer_model rational_model integer_embedding fraction value ∧
          ∀ other : FiniteSimpleContinuedFraction integer_model,
            canonical integer_model other →
              FiniteValue integer_model rational_model integer_embedding other value →
                other = fraction := by
  sorry

theorem infinite_continued_fraction_converges
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model) :
    ∃ value : real_model.signature.carrier,
      ∀ neighborhood : real_model.signature.carrier → Prop,
        neighborhood value →
          ∃ index : Nat, neighborhood value := by
  sorry

theorem quadratic_irrational_iff_eventually_periodic
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model)
    (value : real_model.signature.carrier) :
    eventually_periodic fraction ↔
      ∃ coefficient_a coefficient_b coefficient_c : real_model.signature.carrier,
        real_model.signature.addition
          (real_model.signature.addition
            (real_model.signature.multiplication coefficient_a
              (real_model.signature.multiplication value value))
            (real_model.signature.multiplication coefficient_b value))
          coefficient_c =
          real_model.signature.zero := by
  sorry

end ContinuedFractions
end Rationals
end VolumeII
end LRA
