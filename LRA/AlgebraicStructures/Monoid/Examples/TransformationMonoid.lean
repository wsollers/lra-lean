import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Examples

universe u

/--
`Transformations` The full transformation monoid on `S`: self-maps `S → S` under composition, with `id_S` as identity — `(Fun(S, S), ∘, id_S)`. Wrapped in a one-field structure so `*` means composition rather than colliding with any existing `Mul`/pointwise instance on the function type.

Predicate logic:

  structure Transformations (S : Type u) where
    val : S → S

Predicate logic (unfolded):

  structure Transformations (S : Type u) where
    val : S → S (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Transformations (S : Type u) where
  val : S → S
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
structure Transformations (S : Type u) where
  val : S → S

instance {S : Type u} : Mul (Transformations S) :=
  ⟨fun f g => ⟨f.val ∘ g.val⟩⟩
instance {S : Type u} : OfNat (Transformations S) 1 := ⟨⟨id⟩⟩
instance {S : Type u} : Nonempty (Transformations S) := ⟨⟨id⟩⟩

instance {S : Type u} :
    LRA.AlgebraicStructures.MonoidLaws (Transformations S) where
  MulAssociative := by
    intro a b c
    sorry
  OneMul := by
    intro a
    sorry
  MulOne := by
    intro a
    sorry
end LRA.AlgebraicStructures.Monoid.Examples
