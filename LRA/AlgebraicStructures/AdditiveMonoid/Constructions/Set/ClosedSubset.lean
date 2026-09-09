import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveMonoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveMonoid.Constructions

universe u

/--
`ClosedSubsetOfNat` A "closed subset containing zero"-shaped `OfNat _ 0`: the identity witness `hZero : 0 ∈ S` repackaged as the subtype's own `0`. Data, not a proof.

Predicate logic:

  def ClosedSubsetOfNat {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
      (hZero : (0 : A) ∈ S) :
      OfNat {x // x ∈ S} 0 where
    ofNat := ⟨0, hZero⟩

Predicate logic (unfolded):

  def ClosedSubsetOfNat {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
      (hZero : (0 : A) ∈ S) :
      OfNat {x // x ∈ S} 0 where
    ofNat := ⟨0, hZero⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetOfNat {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) :
    OfNat {x // x ∈ S} 0 where
  ofNat := ⟨0, hZero⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[reducible] def ClosedSubsetOfNat {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) :
    OfNat {x // x ∈ S} 0 where
  ofNat := ⟨0, hZero⟩

/--
`ClosedSubsetNonempty` The identity's own membership gives nonemptiness for free — same reasoning as `Monoid.Constructions.ClosedSubsetNonempty`.

Predicate logic:

  ∀ {A : Type u} [inst : OfNat A 0] {S : LRA.Set.LRA_Set A}, 0 ∈ S → Nonempty (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    0 ∈ S → Nonempty (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) : Nonempty {x // x ∈ S}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 0] {S : LRA.Set.LRA_Set A}
    (hZero : (0 : A) ∈ S) : Nonempty {x // x ∈ S} := by
  sorry
/--
`ClosedSubsetAdditiveMonoidLaws` Associativity and the identity both transfer for free through a closed subset that also contains `0`: the subtype's operation and its `0` are just the ambient ones repackaged. Builds on `AdditiveSemigroup.Constructions. ClosedSubsetAdditiveSemigroupLaws` for the associativity half.

Predicate logic:

  ∀ {A : Type u} [inst : Add A] [inst_1 : OfNat A 0] [inst_2 : Nonempty A], LRA.AlgebraicStructures.AdditiveMonoidLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHAdd.hAdd a b ∈ S) (hZero : 0), ∈ S LRA.AlgebraicStructures.AdditiveMonoidLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.AdditiveMonoidLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hAdd := fun a b => inst.add a b }.hAdd a b ∈ S) (hZero : 0), ∈ S LRA.AlgebraicStructures.AdditiveMonoidLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetAdditiveMonoidLaws {A : Type u} [Add A] [OfNat A 0] [Nonempty A]
    [AdditiveMonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    (hZero : (0 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    letI := ClosedSubsetOfNat hZero
    letI := ClosedSubsetNonempty hZero
    AdditiveMonoidLaws {x // x ∈ S}
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
