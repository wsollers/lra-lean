import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.CommutativeMonoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeMonoid.Constructions

universe u

/--
`ClosedSubsetCommutativeMonoidLaws` Associativity, the identity, and commutativity all transfer for free through a closed subset that also contains `1`. Builds on `Monoid.Constructions.ClosedSubsetOfNat`/`ClosedSubsetNonempty` for the identity half — unlike `Group`'s own builder, there's no ambient-hypothesis subtlety here: a commutative-monoid-shaped closed subset of a commutative monoid is always itself one, no "unit of a non-group ambient" case to worry about.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] [inst_1 : OfNat A 1] [inst_2 : Nonempty A], LRA.AlgebraicStructures.CommutativeMonoidLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) (hOne : 1), ∈ S LRA.AlgebraicStructures.CommutativeMonoidLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.CommutativeMonoidLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hMul := fun a b => inst.mul a b }.hMul a b ∈ S) (hOne : 1), ∈ S LRA.AlgebraicStructures.CommutativeMonoidLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetCommutativeMonoidLaws {A : Type u} [Mul A] [OfNat A 1] [Nonempty A]
    [CommutativeMonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat hOne
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty hOne
    CommutativeMonoidLaws {x // x ∈ S}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem ClosedSubsetCommutativeMonoidLaws {A : Type u} [Mul A] [OfNat A 1] [Nonempty A]
    [CommutativeMonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat hOne
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty hOne
    CommutativeMonoidLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.CommutativeMonoid.Constructions
