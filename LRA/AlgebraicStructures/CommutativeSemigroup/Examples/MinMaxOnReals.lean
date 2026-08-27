import Mathlib.Algebra.Order.Group.Defs
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

/-! Min and Max on `ℝ` — both total (no closure side-condition needed, unlike
the other examples in this file: `min`/`max` are already defined everywhere on
a linear order), associative, and commutative. Wrapped in one-field structures
since `ℝ` already carries its own `Mul` (ordinary multiplication), distinct from
either of these. -/

structure RealsUnderMin where
  val : Real

instance : Mul RealsUnderMin := ⟨fun a b => ⟨min a.val b.val⟩⟩
instance : Nonempty RealsUnderMin := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.CommutativeSemigroupLaws RealsUnderMin := by
  sorry

structure RealsUnderMax where
  val : Real

instance : Mul RealsUnderMax := ⟨fun a b => ⟨max a.val b.val⟩⟩
instance : Nonempty RealsUnderMax := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.CommutativeSemigroupLaws RealsUnderMax := by
  sorry

end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
