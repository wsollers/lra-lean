import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Group.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Group.Constructions

universe u

/-- A subgroup-shaped closed subset's `Inv`: the ambient inverse repackaged,
given closure under it (`hInvClosed`). Data, not a proof. -/
@[reducible] def ClosedSubsetInv {A : Type u} [Inv A] {S : LRA.Set.LRA_Set A}
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S) :
    Inv {x // x ∈ S} where
  inv a := ⟨a.1⁻¹, hInvClosed a.1 a.2⟩

/-- Associativity, the identity, and inverses all transfer for free through a
subgroup-shaped closed subset: closed under `*`, containing `1`, and closed
under `⁻¹` with `⁻¹` actually cancelling *within* `S`. Builds on
`Monoid.Constructions.ClosedSubsetOfNat`/`ClosedSubsetNonempty` for the
identity half.

Deliberately requires only `[MonoidLaws A]` on the ambient type, **not**
`[GroupLaws A]` — the most common real use of this builder is carving a group
out of an ambient that *isn't* one (e.g. the nonzero reals under
multiplication: `ℝ` itself is only a monoid under `×`, since `0` has no
inverse). `hInvCancel` supplies exactly the fact `[GroupLaws A]` would have
given for free, but only for elements of `S` — the only place it's actually
needed. -/
theorem ClosedSubsetGroupLaws {A : Type u} [Mul A] [Inv A] [OfNat A 1] [Nonempty A]
    [MonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S)
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S)
    (hInvCancel : ∀ a, a ∈ S → a⁻¹ * a = 1 ∧ a * a⁻¹ = 1) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat hOne
    letI := ClosedSubsetInv hInvClosed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty hOne
    GroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.Group.Constructions
