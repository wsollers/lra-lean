import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Constructions

universe u

/--
`ClosedSubsetOfNat` A submonoid-shaped closed subset's `OfNat _ 1`: the identity witness `hOne : 1 ∈ S` repackaged as the subtype's own `1`. Data, not a proof.

Predicate logic:

  def ClosedSubsetOfNat {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
      (hOne : (1 : A) ∈ S) :
      OfNat {x // x ∈ S} 1 where
    ofNat := ⟨1, hOne⟩

Predicate logic (unfolded):

  def ClosedSubsetOfNat {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
      (hOne : (1 : A) ∈ S) :
      OfNat {x // x ∈ S} 1 where
    ofNat := ⟨1, hOne⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetOfNat {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) :
    OfNat {x // x ∈ S} 1 where
  ofNat := ⟨1, hOne⟩
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
@[reducible] def ClosedSubsetOfNat {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) :
    OfNat {x // x ∈ S} 1 where
  ofNat := ⟨1, hOne⟩

/--
`ClosedSubsetNonempty` The identity's own membership gives nonemptiness for free — unlike `Semigroup`/`CommutativeSemigroup`'s closed-subset builders (which have no canonical element to point to without an identity axiom), a submonoid always has this witness available.

Predicate logic:

  ∀ {A : Type u} [inst : OfNat A 1] {S : LRA.Set.LRA_Set A}, 1 ∈ S → Nonempty (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    1 ∈ S → Nonempty (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) : Nonempty {x // x ∈ S}
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
theorem ClosedSubsetNonempty {A : Type u} [OfNat A 1] {S : LRA.Set.LRA_Set A}
    (hOne : (1 : A) ∈ S) : Nonempty {x // x ∈ S} := by
  sorry
/--
`ClosedSubsetMonoidLaws` Associativity and the identity both transfer for free through a closed subset that also contains `1`: the subtype's operation and its `1` are just the ambient ones repackaged. Builds on `Semigroup.Constructions. ClosedSubsetSemigroupLaws` for the associativity half.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] [inst_1 : OfNat A 1] [inst_2 : Nonempty A], LRA.AlgebraicStructures.MonoidLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) (hOne : 1), ∈ S LRA.AlgebraicStructures.MonoidLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.MonoidLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hMul := fun a b => inst.mul a b }.hMul a b ∈ S) (hOne : 1), ∈ SLRA.AlgebraicStructures.MonoidLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetMonoidLaws {A : Type u} [Mul A] [OfNat A 1] [Nonempty A]
    [MonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := ClosedSubsetOfNat hOne
    letI := ClosedSubsetNonempty hOne
    MonoidLaws {x // x ∈ S}
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
