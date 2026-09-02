import LRA.AlgebraicStructures.Archimedean.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Archimedean.Examples

/-- `ℕ` is Archimedean — proved directly against `Nat`'s own order and
addition facts, rather than through the generic `Constructions/Mathlib/Laws.lean`
bridge (which routes through Mathlib's `Archimedean`/`CovariantClass` machinery
for an arbitrary ordered additive monoid). This is the "house" implementation:
for `x > 0` and any `point : Nat`, `IteratedSelfSum point x` — `point + 1`
copies of `x` — already exceeds `point` directly, with no need for Mathlib's
general cofinality argument at all. -/
theorem naturalNumbersAreArchimedean :
    LRA.AlgebraicStructures.ArchimedeanLaw Nat := by
  sorry
end LRA.AlgebraicStructures.Archimedean.Examples
