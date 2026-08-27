import LRA.AlgebraicStructures.AdditiveSemigroup.Examples.PositiveEvenNaturalsUnderAddition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveNaturalsUnderAddition
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples

open LRA.AlgebraicStructures.AdditiveSemigroup.Examples (PositiveEvenNaturals
  positiveEvenNaturalsClosedUnderAddition)

/-! Positive even naturals under addition — `(2ℕ_{>0}, +) = ({2, 4, 6, ...}, +)`.
Reuses the `AdditiveCommutativeLaws Nat` instance registered in
`PositiveNaturalsUnderAddition` — commutativity of `Nat.add` doesn't need
restating per subset. -/

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws
      {n // n ∈ PositiveEvenNaturals} :=
  LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.ClosedSubsetAdditiveCommutativeSemigroupLaws
    positiveEvenNaturalsClosedUnderAddition

end LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples
