import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Examples

universe u

/-- The full transformation monoid on `S`: self-maps `S → S` under
composition, with `id_S` as identity — `(Fun(S, S), ∘, id_S)`. Wrapped in a
one-field structure so `*` means composition rather than colliding with any
existing `Mul`/pointwise instance on the function type. -/
structure Transformations (S : Type u) where
  val : S → S

instance {S : Type u} : Mul (Transformations S) :=
  ⟨fun f g => ⟨f.val ∘ g.val⟩⟩
instance {S : Type u} : OfNat (Transformations S) 1 := ⟨⟨id⟩⟩
instance {S : Type u} : Nonempty (Transformations S) := ⟨⟨id⟩⟩

instance {S : Type u} :
    LRA.AlgebraicStructures.MonoidLaws (Transformations S) := by
  sorry

end LRA.AlgebraicStructures.Monoid.Examples
