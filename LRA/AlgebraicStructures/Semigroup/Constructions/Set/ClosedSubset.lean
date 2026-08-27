import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Semigroup.Constructions

universe u

/-- Associativity transfers for free through a closed subset: if `*` is associative
on the ambient type, it's associative on any closed subset too, since the subtype's
operation is just the ambient one with the result repackaged. Builds on
`Magma.Constructions.ClosedSubsetMul` rather than restating it. Nonemptiness is an
ambient `[Nonempty {x // x ∈ S}]` assumption — callers register their own instance
for the subtype alongside this one. -/
theorem ClosedSubsetSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [MultiplicativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    MultiplicativeSemigroupLaws {x // x ∈ S} :=
  letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
  { MulAssociative := fun a b c => Subtype.ext (MulAssociative a.1 b.1 c.1) }

end LRA.AlgebraicStructures.Semigroup.Constructions
