import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Examples

/-! Positive natural numbers under addition — `(ℕ_{>0}, +)`. Associative
(`Nat.add_assoc`, Lean core) and closed (sum of two positive naturals is
positive), but has no identity: `0 ∉ ℕ_{>0}`. Unlike the `Mul`-based examples
elsewhere in this tree, no wrapper structure is needed here — `Nat`'s native
`Add` already is the operation this subject is about. Proved directly against
core lemmas rather than through the Mathlib bridge, since neither `Nat` nor
`Int` need Mathlib to state associativity of their native `+`. -/

instance : LRA.AlgebraicStructures.AdditiveSemigroupLaws Nat := by
  sorry
def PositiveNaturals : LRA.Set.LRA_Set Nat := {n | 0 < n}

theorem positiveNaturalsClosedUnderAddition :
    ∀ a b, a ∈ PositiveNaturals → b ∈ PositiveNaturals → a + b ∈ PositiveNaturals := by
  sorry
noncomputable instance : Add {n // n ∈ PositiveNaturals} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    positiveNaturalsClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ PositiveNaturals} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveSemigroupLaws {n // n ∈ PositiveNaturals} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Examples
