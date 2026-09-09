import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Group.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Group.Constructions

universe u

/--
`ClosedSubsetInv` A subgroup-shaped closed subset's `Inv`: the ambient inverse repackaged, given closure under it (`hInvClosed`). Data, not a proof.

Predicate logic:

  def ClosedSubsetInv {A : Type u} [Inv A] {S : LRA.Set.LRA_Set A}
      (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S) :
      Inv {x // x ∈ S} where
    inv a := ⟨a.1⁻¹, hInvClosed a.1 a.2⟩

Predicate logic (unfolded):

  def ClosedSubsetInv {A : Type u} [Inv A] {S : LRA.Set.LRA_Set A}
      (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S) :
      Inv {x // x ∈ S} where
    inv a := ⟨a.1⁻¹, hInvClosed a.1 a.2⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetInv {A : Type u} [Inv A] {S : LRA.Set.LRA_Set A}
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S) :
    Inv {x // x ∈ S} where
  inv a := ⟨a.1⁻¹, hInvClosed a.1 a.2⟩
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
@[reducible] def ClosedSubsetInv {A : Type u} [Inv A] {S : LRA.Set.LRA_Set A}
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S) :
    Inv {x // x ∈ S} where
  inv a := ⟨a.1⁻¹, hInvClosed a.1 a.2⟩

/--
`ClosedSubsetGroupLaws` Associativity, the identity, and inverses all transfer for free through a subgroup-shaped closed subset: closed under `*`, containing `1`, and closed under `⁻¹` with `⁻¹` actually cancelling *within* `S`. Builds on `Monoid.Constructions.ClosedSubsetOfNat`/`ClosedSubsetNonempty` for the identity half.  Deliberately requires only `[MonoidLaws A]` on the ambient type, **not** `[GroupLaws A]` — the most common real use of this builder is carving a group out of an ambient that *isn't* one (e.g. the nonzero reals under multiplication: `ℝ` itself is only a monoid under `×`, since `0` has no inverse). `hInvCancel` supplies exactly the fact `[GroupLaws A]` would have given for free, but only for elements of `S` — the only place it's actually needed.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] [inst_1 : Inv A] [inst_2 : OfNat A 1] [inst_3 : Nonempty A], LRA.AlgebraicStructures.MonoidLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) (hOne : 1) ∈ S (hInvClosed : ∀ (a : A), a ∈ S → inst_1.inv a ∈ S), (∀ (a : A), a ∈ S → (instHMul.hMul (inst_1.inv a) a = 1 ∧ instHMul.hMul a (inst_1.inv a) = 1)) → LRA.AlgebraicStructures.GroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.MonoidLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hMul := fun a b => inst.mul a b }.hMul a b ∈ S) (hOne : 1) ∈ S (hInvClosed : ∀ (a : A), a ∈ S → inst_1.1 a ∈ S), (∀ (a : A), a ∈ S → ({ hMul := fun a b => inst.mul a b }.hMul (inst_1.1 a) a = 1 ∧ { hMul := fun a b => inst.mul a b }.hMul a (inst_1.1 a) = 1)) → LRA.AlgebraicStructures.GroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetGroupLaws {A : Type u} [Mul A] [Inv A] [OfNat A 1] [Nonempty A]
    [MonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S)
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S)
    (hInvCancel : ∀ a, a ∈ S → a⁻¹ * a = 1 ∧ a * a⁻¹ = 1) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat hOne
    letI := ClosedSubsetInv hInvClosed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty hOne
    GroupLaws {x // x ∈ S}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem ClosedSubsetGroupLaws {A : Type u} [Mul A] [Inv A] [OfNat A 1] [Nonempty A]
    [MonoidLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    (hOne : (1 : A) ∈ S)
    (hInvClosed : ∀ a, a ∈ S → a⁻¹ ∈ S)
    (hInvCancel : ∀ a, a ∈ S → a⁻¹ * a = 1 ∧ a * a⁻¹ = 1) :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat hOne
    letI := ClosedSubsetInv hInvClosed
    letI := LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty hOne
    GroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.Group.Constructions
