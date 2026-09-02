import LRA.AlgebraicStructures.Monoid.Examples.NaturalNumbersUnderAddition
import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeMonoid.Examples

open LRA.AlgebraicStructures.Monoid.Examples (NaturalNumbersUnderAddition)

/-- `(ℕ, +, 0)` — reusing the carrier already built for `Monoid.Examples`
(same reuse pattern as `CommutativeSemigroup.Examples.
PositiveIntegersUnderAddition`): addition is commutative as well as
associative, so this is the same example promoted from "monoid" to
"commutative monoid". -/
instance :
    LRA.AlgebraicStructures.MultiplicativeCommutativeLaws NaturalNumbersUnderAddition := by
  sorry
instance :
    LRA.AlgebraicStructures.CommutativeMonoidLaws NaturalNumbersUnderAddition := by
  sorry
end LRA.AlgebraicStructures.CommutativeMonoid.Examples
