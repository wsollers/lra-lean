import Mathlib.Data.Set.Basic
import LRA.Set.Interop.Switch
import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeMonoid.Examples

universe u

/-- `(𝒫(S), ∪, ∅)` — the power set of `S` under union, with the empty set as
identity. Wrapped in a one-field structure, same reason as elsewhere in this
tree — `Set α` needs its own `Mul`/`OfNat _ 1`, distinct from any instance
`α` itself might carry (and distinct from `CommutativeSemigroup.Examples.
Semilattices.UnionSemilattice`, which has no identity component). -/
structure PowerSetUnderUnion (α : Type u) where
  val : LRA.Set.LRA_Set α

instance {α : Type u} : Mul (PowerSetUnderUnion α) :=
  ⟨fun a b => ⟨a.val ∪ b.val⟩⟩
instance {α : Type u} : OfNat (PowerSetUnderUnion α) 1 := ⟨⟨∅⟩⟩
instance {α : Type u} : Nonempty (PowerSetUnderUnion α) := ⟨⟨∅⟩⟩

instance {α : Type u} :
    LRA.AlgebraicStructures.CommutativeMonoidLaws (PowerSetUnderUnion α) := by
  sorry

end LRA.AlgebraicStructures.CommutativeMonoid.Examples
