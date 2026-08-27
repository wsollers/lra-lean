import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.Semigroup.Examples

/-! Positive integers under addition — `(ℕ_{>0}, +)`. Associative (inherited from
`ℕ`'s own addition being associative) and closed (sum of two positive naturals is
positive), but has no identity: `0 ∉ ℕ_{>0}`. That missing identity is exactly why
this is a semigroup and not a monoid — it becomes Monoid's own `Failures/` example
once that item comes up.

Wrapped in a one-field structure, same reason as `Magma.Examples.IntegersUnderSubtraction`
— `Nat` already has its own native `Mul` (ordinary multiplication), so `*` here has to
mean addition on a distinct type, not `Nat` itself. -/

structure NaturalsUnderAddition where
  val : Nat

instance : Mul NaturalsUnderAddition := ⟨fun a b => ⟨a.val + b.val⟩⟩
instance : Nonempty NaturalsUnderAddition := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.MultiplicativeSemigroupLaws NaturalsUnderAddition where
  MulAssociative := fun a b c =>
    congrArg NaturalsUnderAddition.mk (Nat.add_assoc a.val b.val c.val)

def PositiveIntegers : LRA.Set.LRA_Set NaturalsUnderAddition := {n | 0 < n.val}

theorem positiveIntegersClosedUnderAddition :
    ∀ a b, a ∈ PositiveIntegers → b ∈ PositiveIntegers → a * b ∈ PositiveIntegers :=
  fun _ _ ha hb => Nat.add_pos_left ha _

noncomputable instance : Mul {n // n ∈ PositiveIntegers} :=
  Magma.Constructions.ClosedSubsetMul positiveIntegersClosedUnderAddition

noncomputable instance : Nonempty {n // n ∈ PositiveIntegers} :=
  ⟨⟨1⟩, Nat.one_pos⟩

noncomputable instance :
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws {n // n ∈ PositiveIntegers} :=
  Semigroup.Constructions.ClosedSubsetSemigroupLaws positiveIntegersClosedUnderAddition

end LRA.AlgebraicStructures.Semigroup.Examples
