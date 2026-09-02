import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Constructions

universe u

/-- Commutativity transfers for free through a closed subset, same as
associativity does in `Semigroup.Constructions.ClosedSubsetSemigroupLaws`: the
subtype's operation is just the ambient one with the result repackaged, so
`a * b = b * a` on the ambient type gives `a * b = b * a` on the subtype
directly. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption —
callers register their own instance for the subtype alongside this one. -/
theorem ClosedSubsetCommutativeSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [CommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    CommutativeSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Constructions
