import Mathlib.Algebra.Group.Even
import Mathlib.Tactic.Ring
import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Semigroup.Examples

/-! Even integers under multiplication — `(2ℤ, ×)`. Closed (product of two evens is
even) and associative (inherited from `ℤ`'s own multiplication), but has no
multiplicative identity: `1 ∉ 2ℤ`. Same shape as the positive-integers example, this
time under `Int`'s ordinary `Mul` rather than a repurposed operation.
`MultiplicativeSemigroupLaws Int` comes for free from the Mathlib bridge instance in
`Constructions/Mathlib/Laws.lean` — `Int` is already a Mathlib `Semigroup`. -/

def EvenIntegers : LRA.Set.LRA_Set Int := {n | Even n}

theorem evenIntegersClosedUnderMultiplication :
    ∀ a b, a ∈ EvenIntegers → b ∈ EvenIntegers → a * b ∈ EvenIntegers := by
  intro a b ha _
  obtain ⟨r, hr⟩ := ha
  exact ⟨r * b, by rw [hr]; ring⟩

noncomputable instance : Mul {n // n ∈ EvenIntegers} :=
  Magma.Constructions.ClosedSubsetMul evenIntegersClosedUnderMultiplication

noncomputable instance : Nonempty {n // n ∈ EvenIntegers} :=
  ⟨0, ⟨0, by ring⟩⟩

noncomputable instance :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws {n // n ∈ EvenIntegers} :=
  Semigroup.Constructions.ClosedSubsetSemigroupLaws evenIntegersClosedUnderMultiplication

end LRA.AlgebraicStructures.Semigroup.Examples
