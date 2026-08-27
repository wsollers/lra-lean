import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions

universe u

/-- Commutativity transfers for free through a closed subset, same as
associativity does in `AdditiveSemigroup.Constructions.ClosedSubsetAdditiveSemigroupLaws`:
the subtype's operation is just the ambient one with the result repackaged, so
`a + b = b + a` on the ambient type gives `a + b = b + a` on the subtype
directly. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption —
callers register their own instance for the subtype alongside this one. -/
theorem ClosedSubsetAdditiveCommutativeSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveCommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    AdditiveCommutativeSemigroupLaws {x // x ∈ S} := by
  sorry

end LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions
