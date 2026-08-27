import LRA.AlgebraicStructures.Monoid.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Monoid.Examples

universe u

/-- The free monoid on `Alphabet`: words (finite sequences) under
concatenation, with the empty word `ε` as identity — `(Σ*, ·, ε)`. Wrapped in
a one-field structure to avoid colliding with `Semigroup.Examples.
NonemptyListsUnderConcatenation`'s own `Mul (List Alphabet)` instance on the
*same* ambient type: that example deliberately excludes the empty list to
stay a semigroup-not-monoid case, so re-registering `Mul (List Alphabet)`
here directly would be a genuine duplicate global instance once both files
are loaded together. This one is the actual free monoid, over all of
`List Alphabet` including `[]`. -/
structure Words (Alphabet : Type u) where
  val : List Alphabet

instance {Alphabet : Type u} : Mul (Words Alphabet) :=
  ⟨fun a b => ⟨a.val ++ b.val⟩⟩
instance {Alphabet : Type u} : OfNat (Words Alphabet) 1 := ⟨⟨[]⟩⟩
instance {Alphabet : Type u} : Nonempty (Words Alphabet) := ⟨⟨[]⟩⟩

instance {Alphabet : Type u} :
    LRA.AlgebraicStructures.MonoidLaws (Words Alphabet) := by
  sorry

end LRA.AlgebraicStructures.Monoid.Examples
