import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveMonoid.Constructions

universe u

/-- A "closed subset containing zero"-shaped `OfNat _ 0`: the identity witness
`hZero : 0 ∈ S` repackaged as the subtype's own `0`. Data, not a proof. -/
@[reducible] def ClosedSubsetOfNat {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) :
    OfNat {x // x ∈ S} 0 where
  ofNat := ⟨0, hZero⟩

/-- The identity's own membership gives nonemptiness for free — same reasoning
as `Monoid.Constructions.ClosedSubsetNonempty`. -/
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) : Nonempty {x // x ∈ S} :=
  ⟨⟨0, hZero⟩⟩

/-- Associativity and the identity both transfer for free through a closed
subset that also contains `0`: the subtype's operation and its `0` are just
the ambient ones repackaged. Builds on `AdditiveSemigroup.Constructions.
ClosedSubsetAdditiveSemigroupLaws` for the associativity half. -/
theorem ClosedSubsetAdditiveMonoidLaws {A : Type u} [Add A] [OfNat A 0] [Nonempty A]
    [AdditiveMonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    (hZero : (0 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    letI := ClosedSubsetOfNat hZero
    letI := ClosedSubsetNonempty hZero
    AdditiveMonoidLaws {x // x ∈ S} := by
  sorry

end LRA.AlgebraicStructures.AdditiveMonoid.Constructions
