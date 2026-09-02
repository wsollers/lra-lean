import Mathlib.Data.Set.Lattice
import LRA.Set.Interop.Switch
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

/-! Semilattices — the join-semilattice `(Set α, ∪)` and meet-semilattice
`(Set α, ∩)` are each commutative semigroups directly: union and intersection
are both associative and commutative, and `Set α` is nonempty regardless of `α`
itself (it always contains `∅`). Wrapped in one-field structures for the same
reason as elsewhere in this tree — `Set α` needs its own `*`, distinct from any
`Mul` instance `α` itself might carry. -/

structure UnionSemilattice (α : Type u) where
  val : LRA.Set.LRA_Set α

instance {α : Type u} : Mul (UnionSemilattice α) := ⟨fun a b => ⟨a.val ∪ b.val⟩⟩
instance {α : Type u} : Nonempty (UnionSemilattice α) := ⟨⟨∅⟩⟩

instance {α : Type u} :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws (UnionSemilattice α) where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
structure IntersectionSemilattice (α : Type u) where
  val : LRA.Set.LRA_Set α

instance {α : Type u} : Mul (IntersectionSemilattice α) :=
  ⟨fun a b => ⟨a.val ∩ b.val⟩⟩
instance {α : Type u} : Nonempty (IntersectionSemilattice α) := ⟨⟨∅⟩⟩

instance {α : Type u} :
    LRA.AlgebraicStructures.CommutativeSemigroupLaws (IntersectionSemilattice α) where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
