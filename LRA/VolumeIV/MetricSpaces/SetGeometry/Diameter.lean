import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.VolumeIV

/-! Set diameter in metric spaces. -/

/-- The set of pairwise distances between points of a set. -/
def diameterSet
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Set Real :=
  { r : Real | ∃ x : X, x ∈ S ∧ ∃ y : X, y ∈ S ∧ r = dist x y }

/-- The diameter of a set in an ambient metric space. -/
noncomputable def diameter
    {X : Type u}
    [MetricSpace X]
    (S : Set X) : Real :=
  sSup (diameterSet S)

/-- Pairwise-distance sets are monotone under set inclusion. -/
theorem diameterSet_mono
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B) :
    diameterSet A ⊆ diameterSet B := by
  intro r r_in_diameter_A
  rcases r_in_diameter_A with ⟨x, x_in_A, y, y_in_A, rfl⟩
  exact ⟨x, set_inclusion x_in_A, y, set_inclusion y_in_A, rfl⟩

/-- Diameter is monotone under set inclusion. -/
theorem diameter_monotone_under_inclusion
    {X : Type u}
    [MetricSpace X]
    {A B : Set X}
    (set_inclusion : A ⊆ B)
    (A_diameterSet_nonempty : (diameterSet A).Nonempty)
    (B_diameterSet_bddAbove : BddAbove (diameterSet B)) :
    diameter A ≤ diameter B := by
  exact csSup_le_csSup
    B_diameterSet_bddAbove
    A_diameterSet_nonempty
    (diameterSet_mono set_inclusion)

end LRA.VolumeIV
