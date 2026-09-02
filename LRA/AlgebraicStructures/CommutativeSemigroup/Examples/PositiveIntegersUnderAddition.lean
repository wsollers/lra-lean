import LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegersUnderAddition
import LRA.AlgebraicStructures.CommutativeSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

open LRA.AlgebraicStructures.Semigroup.Examples (NaturalsUnderAddition PositiveIntegers
  positiveIntegersClosedUnderAddition)

/-! Positive integers under addition — `(ℕ_{>0}, +)`, reusing the carrier and
closure proof already built for `Semigroup.Examples`. Addition is commutative as
well as associative, so this is the same example promoted from "semigroup" to
"commutative semigroup". -/

instance : LRA.AlgebraicStructures.MultiplicativeCommutativeLaws NaturalsUnderAddition := by
  sorry
noncomputable instance :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws {n // n ∈ PositiveIntegers} := by
  sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
