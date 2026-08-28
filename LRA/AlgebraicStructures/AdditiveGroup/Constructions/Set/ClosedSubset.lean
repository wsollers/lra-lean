import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveGroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveGroup.Constructions

universe u

/-- A subgroup-shaped closed subset's `Neg`: the ambient negation
repackaged, given closure under it (`hNegClosed`). Data, not a proof. -/
@[reducible] def ClosedSubsetNeg {A : Type u} [Neg A] {S : LRA.Set.LRA_Set A}
    (hNegClosed : ∀ a, a ∈ S → -a ∈ S) :
    Neg {x // x ∈ S} where
  neg a := ⟨-a.1, hNegClosed a.1 a.2⟩

/-- Associativity, the identity, and negation all transfer for free through a
subgroup-shaped closed subset: closed under `+`, containing `0`, and closed
under `-` with `-` actually cancelling *within* `S`. Builds on
`AdditiveMonoid.Constructions.ClosedSubsetOfNat`/`ClosedSubsetNonempty` for
the identity half.

Deliberately requires only `[AdditiveMonoidLaws A]` on the ambient type, not
`[AdditiveGroupLaws A]` — same lesson learned the hard way in `Group`'s own
builder (as-13): the most natural real uses of a subgroup-style closed subset
carve a group out of an ambient that *isn't* one. `hNegCancel` supplies
exactly the fact `[AdditiveGroupLaws A]` would have given for free, but only
for elements of `S`. -/
theorem ClosedSubsetAdditiveGroupLaws {A : Type u} [Add A] [Neg A] [OfNat A 0] [Nonempty A]
    [AdditiveMonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    (hZero : (0 : A) ∈ S)
    (hNegClosed : ∀ a, a ∈ S → -a ∈ S)
    (hNegCancel : ∀ a, a ∈ S → -a + a = 0 ∧ a + -a = 0) :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    letI := LRA.AlgebraicStructures.AdditiveMonoid.Constructions.ClosedSubsetOfNat hZero
    letI := ClosedSubsetNeg hNegClosed
    letI := LRA.AlgebraicStructures.AdditiveMonoid.Constructions.ClosedSubsetNonempty hZero
    AdditiveGroupLaws {x // x ∈ S} := by
  sorry

end LRA.AlgebraicStructures.AdditiveGroup.Constructions
