import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions

universe u

/--
`ClosedSubsetAdditiveCommutativeSemigroupLaws` Commutativity transfers for free through a closed subset, same as associativity does in `AdditiveSemigroup.Constructions.ClosedSubsetAdditiveSemigroupLaws`: the subtype's operation is just the ambient one with the result repackaged, so `a + b = b + a` on the ambient type gives `a + b = b + a` on the subtype directly. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption — callers register their own instance for the subtype alongside this one.

Predicate logic:

  ∀ {A : Type u} [inst : Add A] [inst_1 : Nonempty A], LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHAdd.hAdd a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hAdd := fun a b => inst.add a b }.hAdd a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetAdditiveCommutativeSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveCommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    AdditiveCommutativeSemigroupLaws {x // x ∈ S}
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
theorem ClosedSubsetAdditiveCommutativeSemigroupLaws {A : Type u} [Add A] [Nonempty A]
    [AdditiveCommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a + b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd closed
    AdditiveCommutativeSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions
