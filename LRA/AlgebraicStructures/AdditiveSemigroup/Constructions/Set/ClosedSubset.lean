import LRA.AlgebraicStructures.AdditiveSemigroup.Interface.Laws.Definition
import LRA.Set.Interop.Switch

namespace LRA.AlgebraicStructures.AdditiveSemigroup.Constructions

universe u

/--
`ClosedSubsetAdd` A closed subset of an additive carrier inherits `+` by repackaging the ambient result. No "additive magma" subject exists in this tree to depend on (unlike `Semigroup`, which builds on `Magma.Constructions.ClosedSubsetMul`), so this is self-contained.

Predicate logic:

  def ClosedSubsetAdd {A : Type u} [Add A] {S : LRA.Set.LRA_Set A}
      (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S) : Add {x // x ∈ S} where
    add a b := ⟨a.1 + b.1, closed a.1 b.1 a.2 b.2⟩

Predicate logic (unfolded):

  def ClosedSubsetAdd {A : Type u} [Add A] {S : LRA.Set.LRA_Set A}
      (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S) : Add {x // x ∈ S} where
    add a b := ⟨a.1 + b.1, closed a.1 b.1 a.2 b.2⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetAdd {A : Type u} [Add A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S) : Add {x // x ∈ S} where
  add a b := ⟨a.1 + b.1, closed a.1 b.1 a.2 b.2⟩
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
@[reducible] def ClosedSubsetAdd {A : Type u} [Add A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S) : Add {x // x ∈ S} where
  add a b := ⟨a.1 + b.1, closed a.1 b.1 a.2 b.2⟩

/--
`ClosedSubsetAdditiveSemigroupLaws` Associativity transfers for free through a closed subset, same reasoning as `Semigroup.Constructions.ClosedSubsetSemigroupLaws`. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption — callers register their own instance for the subtype alongside this one.

Predicate logic:

  ∀ {A : Type u} [inst : Add A] [inst_1 : Nonempty A], LRA.AlgebraicStructures.AdditiveSemigroupLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHAdd.hAdd a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.AdditiveSemigroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.AdditiveSemigroupLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hAdd := fun a b => inst.add a b }.hAdd a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.AdditiveSemigroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetAdditiveSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetAdd closed
    AdditiveSemigroupLaws {x // x ∈ S}
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
theorem ClosedSubsetAdditiveSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetAdd closed
    AdditiveSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.AdditiveSemigroup.Constructions
