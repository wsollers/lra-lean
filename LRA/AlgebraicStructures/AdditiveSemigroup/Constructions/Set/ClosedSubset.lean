import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition
import LRA.Set.Interop.Switch

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Constructions

universe u

/-- A closed subset of an additive carrier inherits `+` by repackaging the
ambient result. No "additive magma" subject exists in this tree to depend on
(unlike `Semigroup`, which builds on `Magma.Constructions.ClosedSubsetMul`), so
this is self-contained. -/
@[reducible] def ClosedSubsetAdd {A : Type u} [Add A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S) : Add {x // x ∈ S} where
  add a b := ⟨a.1 + b.1, closed a.1 b.1 a.2 b.2⟩

/-- Associativity transfers for free through a closed subset, same reasoning as
`Semigroup.Constructions.ClosedSubsetSemigroupLaws`. Nonemptiness is an ambient
`[Nonempty {x // x ∈ S}]` assumption — callers register their own instance for
the subtype alongside this one. -/
theorem ClosedSubsetAdditiveSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetAdd closed
    AdditiveSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Constructions
