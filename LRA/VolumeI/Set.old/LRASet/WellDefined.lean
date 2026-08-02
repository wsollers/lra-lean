import LRA.VolumeI.Set.WellDefined
import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

open LRA.VolumeI.Set.LRASet

/-!
Well-foundedness and well-definedness for `LRASet`.
-/

/-- Two predicate-sets have the same members. By `Extensionality` this
already coincides with `Eq` on `LRASet alpha` -- there is no coarser
notion of "the same set" floating around beneath ordinary equality, so
well-definedness here is never a genuine quotient-respecting argument,
just this one, riding on ordinary function behaviour. -/
def LRASetSameMembers {alpha : LRACarrier} (A B : LRASet alpha) : Prop :=
  ∀ x, Member x A ↔ Member x B

/-- Well-foundedness of `∈` is not a meaningful question for `LRASet`:
its membership relation is two-sorted (`Member : alpha → LRASet alpha →
Prop`), so self-membership -- the only way an infinite descending chain
could even be built -- isn't expressible in the first place. This
placeholder exists so every backend answers the same structural slot,
honestly, in the same place, rather than `LRASet` just being silently
absent from the pattern. -/
theorem LRASetWellFoundednessNotApplicable : True := trivial

theorem LRASetUnionRespectsExtension {alpha : LRACarrier} :
    RespectsEquivBinary (LRASetSameMembers (alpha := alpha)) Union := by
  intro A A' B B' hA hB x
  constructor
  · rintro (hxA | hxB)
    · exact Or.inl ((hA x).mp hxA)
    · exact Or.inr ((hB x).mp hxB)
  · rintro (hxA | hxB)
    · exact Or.inl ((hA x).mpr hxA)
    · exact Or.inr ((hB x).mpr hxB)

theorem LRASetIntersectionRespectsExtension {alpha : LRACarrier} :
    RespectsEquivBinary (LRASetSameMembers (alpha := alpha)) Intersection := by
  intro A A' B B' hA hB x
  constructor
  · rintro ⟨hxA, hxB⟩
    exact ⟨(hA x).mp hxA, (hB x).mp hxB⟩
  · rintro ⟨hxA, hxB⟩
    exact ⟨(hA x).mpr hxA, (hB x).mpr hxB⟩

theorem LRASetComplementRespectsExtension {alpha : LRACarrier} :
    RespectsEquivUnary (LRASetSameMembers (alpha := alpha)) Complement := by
  intro A A' hA x
  constructor
  · intro hxNotA hxA'
    exact hxNotA ((hA x).mpr hxA')
  · intro hxNotA' hxA
    exact hxNotA' ((hA x).mp hxA)

theorem LRASetDifferenceRespectsExtension {alpha : LRACarrier} :
    RespectsEquivBinary (LRASetSameMembers (alpha := alpha)) Difference := by
  intro A A' B B' hA hB x
  constructor
  · rintro ⟨hxA, hxNotB⟩
    exact ⟨(hA x).mp hxA, fun hxB' => hxNotB ((hB x).mpr hxB')⟩
  · rintro ⟨hxA, hxNotB⟩
    exact ⟨(hA x).mpr hxA, fun hxB => hxNotB ((hB x).mp hxB)⟩

end LRA.VolumeI.Set
