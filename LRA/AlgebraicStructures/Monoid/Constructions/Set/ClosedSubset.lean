import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Constructions

universe u

/-- A submonoid-shaped closed subset's `OfNat _ 1`: the identity witness
`hOne : 1 ∈ S` repackaged as the subtype's own `1`. Data, not a proof. -/
@[reducible] def ClosedSubsetOfNat {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) :
    OfNat {x // x ∈ S} 1 where
  ofNat := ⟨1, hOne⟩

/-- The identity's own membership gives nonemptiness for free — unlike
`Semigroup`/`CommutativeSemigroup`'s closed-subset builders (which have no
canonical element to point to without an identity axiom), a submonoid always
has this witness available. -/
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) : Nonempty {x // x ∈ S} :=
  ⟨⟨1, hOne⟩⟩

/-- Associativity and the identity both transfer for free through a closed
subset that also contains `1`: the subtype's operation and its `1` are just
the ambient ones repackaged. Builds on `Semigroup.Constructions.
ClosedSubsetSemigroupLaws` for the associativity half. -/
theorem ClosedSubsetMonoidLaws {A : Type u} [Mul A] [OfNat A 1] [Nonempty A]
    [MonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := ClosedSubsetOfNat hOne
    letI := ClosedSubsetNonempty hOne
    MonoidLaws {x // x ∈ S} := by
  sorry

end LRA.AlgebraicStructures.Monoid.Constructions
