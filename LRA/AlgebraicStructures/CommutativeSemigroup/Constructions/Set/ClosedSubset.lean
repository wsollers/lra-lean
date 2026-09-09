import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Semigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Constructions

universe u

/--
`ClosedSubsetCommutativeSemigroupLaws` Commutativity transfers for free through a closed subset, same as associativity does in `Semigroup.Constructions.ClosedSubsetSemigroupLaws`: the subtype's operation is just the ambient one with the result repackaged, so `a * b = b * a` on the ambient type gives `a * b = b * a` on the subtype directly. Nonemptiness is an ambient `[Nonempty {x // x ∈ S}]` assumption — callers register their own instance for the subtype alongside this one.

Predicate logic:

  ∀ {A : Type u} [inst : Mul A] [inst_1 : Nonempty A], LRA.AlgebraicStructures.CommutativeSemigroupLaws A → ∀ {S : LRA.Set.LRA_Set A} (closed : ∀ (a b : A), a ∈ S → b ∈ S → instHMul.hMul a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.CommutativeSemigroupLaws (Subtype fun x => x) ∈ S

Predicate logic (unfolded):

  Ambient
    (A)
  Objects
    S : LRA.Set.LRA_Set A
  Prove
    LRA.AlgebraicStructures.CommutativeSemigroupLaws A → ∀ {S : A → Prop} (closed : ∀ (a b : A), a ∈ S → b ∈ S → { hMul := fun a b => inst.mul a b }.hMul a b ∈ S) [inst_2 : Nonempty (Subtype fun x => x)], ∈ S LRA.AlgebraicStructures.CommutativeSemigroupLaws (Subtype fun x => x) ∈ S

Logical form (Lean):

```lean
theorem ClosedSubsetCommutativeSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [CommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    CommutativeSemigroupLaws {x // x ∈ S}
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
theorem ClosedSubsetCommutativeSemigroupLaws {A : Type u} [Mul A] [Nonempty A]
    [CommutativeSemigroupLaws A] {S : LRA.Set.LRA_Set A}
    (closed : ∀ a b, a ∈ S → b ∈ S → a * b ∈ S)
    [Nonempty {x // x ∈ S}] :
    letI := LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul closed
    CommutativeSemigroupLaws {x // x ∈ S} := by
  sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Constructions
