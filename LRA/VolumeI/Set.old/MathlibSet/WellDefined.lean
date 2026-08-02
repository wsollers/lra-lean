import LRA.VolumeI.Set.WellDefined
import LRA.VolumeI.Set.MathlibSet.MathlibSet

namespace LRA.VolumeI.Set

/-!
Well-foundedness and well-definedness for `MathlibSet`.
-/

/-- Two Mathlib sets have the same members -- Mathlib's own `Set.ext`
already shows this coincides with `Eq`. -/
def MathlibSetSameMembers {Point : LRACarrier} (A B : MathlibSet Point) : Prop :=
  ∀ x, x ∈ A ↔ x ∈ B

/-- Well-foundedness of `∈` is not a meaningful question for
`MathlibSet`: same two-sorted reasoning as `LRASet` (`Set.mem : Point →
Set Point → Prop`), not a claim about what Mathlib has or hasn't
proved -- there is no statement here to prove in the first place. -/
theorem MathlibSetWellFoundednessNotApplicable : True := trivial

theorem MathlibSetUnionRespectsExtension {Point : LRACarrier} :
    RespectsEquivBinary (MathlibSetSameMembers (Point := Point))
      (fun A B => A ∪ B : MathlibSet Point → MathlibSet Point → MathlibSet Point) := by
  intro A A' B B' hA hB
  rw [Set.ext hA, Set.ext hB]

theorem MathlibSetIntersectionRespectsExtension {Point : LRACarrier} :
    RespectsEquivBinary (MathlibSetSameMembers (Point := Point))
      (fun A B => A ∩ B : MathlibSet Point → MathlibSet Point → MathlibSet Point) := by
  intro A A' B B' hA hB
  rw [Set.ext hA, Set.ext hB]

theorem MathlibSetComplementRespectsExtension {Point : LRACarrier} :
    RespectsEquivUnary (MathlibSetSameMembers (Point := Point))
      (fun A => Aᶜ : MathlibSet Point → MathlibSet Point) := by
  intro A A' hA
  rw [Set.ext hA]

theorem MathlibSetDifferenceRespectsExtension {Point : LRACarrier} :
    RespectsEquivBinary (MathlibSetSameMembers (Point := Point))
      (fun A B => A \ B : MathlibSet Point → MathlibSet Point → MathlibSet Point) := by
  intro A A' B B' hA hB
  rw [Set.ext hA, Set.ext hB]

end LRA.VolumeI.Set
