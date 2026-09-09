import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveGroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveGroup.Constructions

universe u

/--
`ClosedSubsetNeg` A subgroup-shaped closed subset's `Neg`: the ambient negation repackaged, given closure under it (`hNegClosed`). Data, not a proof.

Predicate logic:

  def ClosedSubsetNeg {A : Type u} [Neg A] {S : LRA.Set.LRA_Set A}
      (hNegClosed : ∀ a, a ∈ S → -a ∈ S) :
      Neg {x // x ∈ S} where
    neg a := ⟨-a.1, hNegClosed a.1 a.2⟩

Predicate logic (unfolded):

  def ClosedSubsetNeg {A : Type u} [Neg A] {S : LRA.Set.LRA_Set A}
      (hNegClosed : ∀ a, a ∈ S → -a ∈ S) :
      Neg {x // x ∈ S} where
    neg a := ⟨-a.1, hNegClosed a.1 a.2⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetNeg {A : Type u} [Neg A] {S : LRA.Set.LRA_Set A}
    (hNegClosed : ∀ a, a ∈ S → -a ∈ S) :
    Neg {x // x ∈ S} where
  neg a := ⟨-a.1, hNegClosed a.1 a.2⟩
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
@[reducible] def ClosedSubsetNeg {A : Type u} [Neg A] {S : LRA.Set.LRA_Set A}
    (hNegClosed : ∀ a, a ∈ S → -a ∈ S) :
    Neg {x // x ∈ S} where
  neg a := ⟨-a.1, hNegClosed a.1 a.2⟩

/--
`ClosedSubsetAdditiveGroupLaws` Associativity, the identity, and negation all transfer for free through a subgroup-shaped closed subset: closed under `+`, containing `0`, and closed under `-` with `-` actually cancelling *within* `S`. Builds on `AdditiveMonoid.Constructions.ClosedSubsetOfNat`/`ClosedSubsetNonempty` for the identity half.  Deliberately requires only `[AdditiveMonoidLaws A]` on the ambient type, not `[AdditiveGroupLaws A]` — same lesson learned the hard way in `Group`'s own builder (as-13): the most natural real uses of a subgroup-style closed subset carve a group out of an ambient that *isn't* one. `hNegCancel` supplies exactly the fact `[AdditiveGroupLaws A]` would have given for free, but only for elements of `S`.

Predicate logic:

  ∀ {A : Type u} [inst : Add A] [inst_1 : Neg A] [inst_2 : OfNat A 0] [inst_3 : Nonempty A], LRA.AlgebraicStructures.AdditiveMonoidLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHAdd.hAdd a b ∈ S) (hZero : 0) ∈ S (hNegClosed : ∀ (a : A), a ∈ S → inst_1.neg a ∈ S), (∀ (a : A), a ∈ S → (instHAdd.hAdd (inst_1.neg a) a = 0 ∧ instHAdd.hAdd a (inst_1.neg a) = 0)) → LRA.AlgebraicStructures.AdditiveGroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.AdditiveMonoidLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hAdd := fun a b => inst.add a b }.hAdd a b ∈ S) (hZero : 0) ∈ S (hNegClosed : ∀ (a : A), a ∈ S → inst_1.neg a ∈ S), (∀ (a : A), a ∈ S → ({ hAdd := fun a b => inst.add a b }.hAdd (inst_1.neg a) a = 0 ∧ { hAdd := fun a b => inst.add a b }.hAdd a (inst_1.neg a) = 0)) → LRA.AlgebraicStructures.AdditiveGroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
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
    AdditiveGroupLaws {x // x ∈ S}
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
