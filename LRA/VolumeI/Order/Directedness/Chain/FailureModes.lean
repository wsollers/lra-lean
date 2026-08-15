import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Directedness.Chain.Definition

namespace LRA.Order

universe u v

/--
`FailsChain`

Statement: A represented subset fails to be a chain when it contains
incomparable elements.

Logical form: `Not (Chain relation subset)`.
-/
def FailsChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Chain relation subset)

section NaturalDivisibility

/--
`TwoAndThreeFailDivisibilityChain`

Statement: Two and three are incomparable by divisibility, so their represented
subset is not a chain.

Logical form: `FailsChain (fun left right : Nat => left ∣ right) {2, 3}`.
-/
theorem TwoAndThreeFailDivisibilityChain :
    FailsChain (fun left right : Nat => left ∣ right)
      ({number | number = 2 \/ number = 3} : Set Nat) := by
  sorry

end NaturalDivisibility

end LRA.Order
