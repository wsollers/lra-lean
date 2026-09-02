import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Examples

/-! Even integers under addition — `(2ℤ, +)`. Closed (sum of two evens is even)
and associative (`Int.add_assoc`, Lean core). Unlike `Semigroup.Examples.
EvenIntegersUnderMultiplication`, `2ℤ` under `+` actually does have an identity
(`0`) and inverses, making it an abelian group — but that's out of scope here,
this item only needs the semigroup fact. -/

instance : LRA.AlgebraicStructures.AdditiveSemigroupLaws Int := by
  sorry
def EvenIntegers : LRA.Set.LRA_Set Int := {n | Even n}

theorem evenIntegersClosedUnderAddition :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a + b ∈ EvenIntegers := by
  sorry
noncomputable instance : Add {n // n ∈ EvenIntegers} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    evenIntegersClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ EvenIntegers} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveSemigroupLaws {n // n ∈ EvenIntegers} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Examples
