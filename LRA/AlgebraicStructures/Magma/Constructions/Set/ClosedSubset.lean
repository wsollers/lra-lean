import LRA.AlgebraicStructures.Magma.Interface.Laws.Definition
import LRA.Set.Interop.Switch

namespace LRA.AlgebraicStructures.Magma.Constructions

universe u

/--
`ClosedSubsetMul` A subset closed under an ambient operation is itself a magma: the operation restricts to the subtype, closure gives totality of the restriction. This is the reusable piece behind any "closed subset of a bigger structure" example (e.g. the nonzero reals under division).

Predicate logic:

  def ClosedSubsetMul {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
      (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S) :
      Mul {x // x ∈ S} where
    mul a b := ⟨a.1 * b.1, closed a.1 b.1 a.2 b.2⟩

Predicate logic (unfolded):

  def ClosedSubsetMul {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
      (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S) :
      Mul {x // x ∈ S} where
    mul a b := ⟨a.1 * b.1, closed a.1 b.1 a.2 b.2⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClosedSubsetMul {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S) :
    Mul {x // x ∈ S} where
  mul a b := ⟨a.1 * b.1, closed a.1 b.1 a.2 b.2⟩
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
@[reducible] def ClosedSubsetMul {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S) :
    Mul {x // x ∈ S} where
  mul a b := ⟨a.1 * b.1, closed a.1 b.1 a.2 b.2⟩

/--
`ClosedSubsetMagmaLaws` Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption rather than a `witness` value threaded through the proof — callers register their own `Nonempty` instance for the subtype (usually `⟨witness⟩`) alongside this one.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) [inst_1 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.MagmaLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    ∈ S LRA.AlgebraicStructures.MagmaLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetMagmaLaws {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetMul closed
    MagmaLaws {x // x ∈ S}
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
theorem ClosedSubsetMagmaLaws {A : Type u} [Mul A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := ClosedSubsetMul closed
    MagmaLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.Magma.Constructions
