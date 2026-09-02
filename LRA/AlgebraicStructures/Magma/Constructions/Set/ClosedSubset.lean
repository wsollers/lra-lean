import LRA.AlgebraicStructures.Magma.Interface.Laws.Definition
import LRA.Set.Interop.Switch

namespace LRA.AlgebraicStructures.Magma.Constructions

universe u

/-- A subset closed under an ambient operation is itself a magma: the operation
restricts to the subtype, closure gives totality of the restriction. This is the
reusable piece behind any "closed subset of a bigger structure" example (e.g. the
nonzero reals under division). -/
@[reducible] def ClosedSubsetMul {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S) :
    Mul {x // x ∈ S} where
  mul a b := ⟨a.1 * b.1, closed a.1 b.1 a.2 b.2⟩

/-- Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption rather than a
`witness` value threaded through the proof — callers register their own `Nonempty`
instance for the subtype (usually `⟨witness⟩`) alongside this one. -/
theorem ClosedSubsetMagmaLaws {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetMul closed
    MagmaLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.Magma.Constructions
