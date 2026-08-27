import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Examples

/-- `(ℕ, +, 0)` — wrapped in a one-field structure since `Nat` already has its
own native `Mul` (ordinary multiplication); here `*` has to mean addition on a
distinct type, same reason as `Semigroup.Examples.NaturalsUnderAddition`
(which this is the monoid completion of: same carrier and operation, but now
including `0`, giving it the identity that subject's `PositiveIntegers`
subtype deliberately excludes — see `Monoid.Failures.
PositiveIntegersHaveNoIdentity`). -/
structure NaturalNumbersUnderAddition where
  val : Nat

instance : Mul NaturalNumbersUnderAddition := ⟨fun a b => ⟨a.val + b.val⟩⟩
instance : OfNat NaturalNumbersUnderAddition 1 := ⟨⟨0⟩⟩
instance : Nonempty NaturalNumbersUnderAddition := ⟨⟨0⟩⟩

instance :
    LRA.AlgebraicStructures.MonoidLaws NaturalNumbersUnderAddition := by
  sorry

end LRA.AlgebraicStructures.Monoid.Examples
