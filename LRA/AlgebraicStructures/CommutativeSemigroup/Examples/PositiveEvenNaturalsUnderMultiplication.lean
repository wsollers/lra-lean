import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.CommutativeSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

/-! Positive even naturals under multiplication — `(2ℕ_{>0}, ×)`. Distinct from
`Semigroup.Examples.EvenIntegersUnderMultiplication` (which used `Int`): here the
carrier is `Nat`, so `0 ∉ 2ℕ_{>0}` is what rules out an identity for the
*additive* structure, while `1` itself is excluded by the evenness condition,
same as on the integers. Wrapped in a one-field structure, same reason as
elsewhere in this tree — `Nat` already has its own native `Mul` (ordinary
multiplication), so a distinct carrier type keeps this `*` unambiguous. -/

structure NaturalsUnderMultiplication where
  val : Nat

instance : Mul NaturalsUnderMultiplication := ⟨fun a b => ⟨a.val * b.val⟩⟩
instance : Nonempty NaturalsUnderMultiplication := ⟨⟨1⟩⟩

instance :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws NaturalsUnderMultiplication where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
def PositiveEvenNaturals : LRA.Set.LRA_Set NaturalsUnderMultiplication :=
  {n | 0 < n.val ∧ Even n.val}

theorem positiveEvenNaturalsClosedUnderMultiplication :
    ∀ a b, a ∈ PositiveEvenNaturals → b ∈ PositiveEvenNaturals →
      a * b ∈ PositiveEvenNaturals := by
  sorry
noncomputable instance : Mul {n // n ∈ PositiveEvenNaturals} :=
  LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul
    positiveEvenNaturalsClosedUnderMultiplication

noncomputable instance : Nonempty {n // n ∈ PositiveEvenNaturals} :=
  ⟨⟨2⟩, Nat.zero_lt_two, 1, rfl⟩

noncomputable instance :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws {n // n ∈ PositiveEvenNaturals} where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
