import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace
import Mathlib.Data.Real.Archimedean

namespace LRA.VolumeVII.WithMathlib

/-! Set diameter in metric spaces. -/

/-- The set of pairwise distances between points of a set. -/
def diameterSet
    {Point : Type u}
    (M : MetricSpace Point)
    (S : Set Point) : Set Real :=
  { r : Real | ∃ x : Point, x ∈ S ∧ ∃ y : Point, y ∈ S ∧ r = M.distance x y }

/-- The diameter of a set in an ambient metric space. -/
noncomputable def diameter
    {Point : Type u}
    (M : MetricSpace Point)
    (S : Set Point) : Real :=
  sSup (diameterSet M S)

/-- Pairwise-distance sets are monotone under set inclusion. -/
theorem diameterSet_mono
    {Point : Type u}
    (M : MetricSpace Point)
    {A B : Set Point}
    (set_inclusion : A ⊆ B) :
    diameterSet M A ⊆ diameterSet M B := by
  intro r r_in_diameter_A
  rcases r_in_diameter_A with ⟨x, x_in_A, y, y_in_A, rfl⟩
  exact ⟨x, set_inclusion x_in_A, y, set_inclusion y_in_A, rfl⟩

/-- Diameter is monotone under set inclusion. -/
theorem diameter_monotone_under_inclusion
    {Point : Type u}
    (M : MetricSpace Point)
    {A B : Set Point}
    (set_inclusion : A ⊆ B)
    (A_diameterSet_nonempty : (diameterSet M A).Nonempty)
    (B_diameterSet_bddAbove : BddAbove (diameterSet M B)) :
    diameter M A ≤ diameter M B := by
  exact csSup_le_csSup
    B_diameterSet_bddAbove
    A_diameterSet_nonempty
    (diameterSet_mono M set_inclusion)

end LRA.VolumeVII.WithMathlib
