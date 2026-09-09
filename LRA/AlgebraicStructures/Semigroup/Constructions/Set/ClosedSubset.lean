import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Semigroup.Constructions

universe u

/--
`ClosedSubsetSemigroupLaws` Associativity transfers for free through a closed subset: if `*` is associative on the ambient type, it's associative on any closed subset too, since the subtype's operation is just the ambient one with the result repackaged. Builds on `Magma.Constructions.ClosedSubsetMul` rather than restating it. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption — callers register their own instance for the subtype alongside this one.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] [inst_1 : Nonempty A], LRA.AlgebraicStructures.MultiplicativeSemigroupLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.MultiplicativeSemigroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.MultiplicativeSemigroupLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hMul := fun a b => inst.mul a b }.hMul a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.MultiplicativeSemigroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [MultiplicativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    MultiplicativeSemigroupLaws {x // x ∈ S}
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
theorem ClosedSubsetSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [MultiplicativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    MultiplicativeSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.Semigroup.Constructions
