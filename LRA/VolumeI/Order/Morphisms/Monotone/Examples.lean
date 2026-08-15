import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Order.Morphisms.Monotone.Theorems
import LRA.VolumeI.Set.MathlibPredicateSet.Instances
import LRA.VolumeI.Set.MathlibPredicateSet.Laws

namespace LRA.Order

section NaturalNumbers

/--
Statement: The successor map preserves the usual order on natural numbers.

Logical form: `Monotone (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) Nat.succ`.
-/
example :
    Monotone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      Nat.succ := by
  intro left right leftLeRight
  exact Nat.succ_le_succ leftLeRight

end NaturalNumbers

section ImageBounds

/--
Statement: Successor sends the upper bound `1` of `{0,1}` to the upper bound
`2` of its direct image.

Logical form: `UpperBound (· ≤ ·) (Image Nat.succ {0,1}) 2`.
-/
example :
    UpperBound (fun left right : Nat => left ≤ right)
      (LRA.Function.Image Nat.succ ({0, 1} : Set Nat) : Set Nat) 2 := by
  apply MonotoneSendsUpperBoundToImageUpperBound
    (sourceRelation := fun left right : Nat => left ≤ right)
    (targetRelation := fun left right : Nat => left ≤ right)
  · intro left right leftLeRight
    exact Nat.succ_le_succ leftLeRight
  · intro element membership
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at membership
    rcases membership with rfl | rfl
    · exact Nat.zero_le 1
    · exact le_rfl

end ImageBounds

end LRA.Order
