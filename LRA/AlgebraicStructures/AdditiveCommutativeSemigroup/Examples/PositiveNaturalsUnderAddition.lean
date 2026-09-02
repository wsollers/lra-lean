import LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveNaturalsUnderAddition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples

open LRA.AlgebraicStructures.AdditiveSemigroup.Examples (PositiveNaturals
  positiveNaturalsClosedUnderAddition)

/-! Positive natural numbers under addition — `(ℕ_{>0}, +)`, reusing the
carrier and closure proof already built for `AdditiveSemigroup.Examples`.
Addition is commutative as well as associative, so this is the same example
promoted from "additive semigroup" to "additive commutative semigroup". Also
cancellative (`Nat.add_left_cancel`), per the user's spec, though cancellation
isn't part of this subject's own law set. -/

instance : LRA.AlgebraicStructures.AdditiveCommutativeLaws Nat := by
  sorry
noncomputable instance :
    LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws {n // n ∈ PositiveNaturals} := by
  sorry
end LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples
