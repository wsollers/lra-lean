/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/henstock-kurzweil/notes-henstock-kurzweil.tex.

Full-coverage pass over the `henstock-kurzweil` section. Fixes ISSUES.md
#69 (🔴, the one genuine correctness bug found in this chapter): the book
reuses the name `IsDeltaFine` for two logically incompatible relations —
here (tag-in-slab required) and again in the McShane section (tag-in-slab
requirement explicitly dropped). This file's predicate is named
`IsHKDeltaFine`; the McShane file's analogous predicate is
`IsMcShaneDeltaFine` — distinct names for genuinely distinct relations.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Integration.Partitions
import LRA.VolumeIII.Analysis.Integration.RiemannIntegral.Basic
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition

namespace LRA.VolumeIII.Analysis.Integration

/-- `def:gauge-on-interval`.
Mathematical statement (Lean): `def IsGaugeOn (a b : ℝ) (δ : ℝ → ℝ) : Prop`.
-/
def IsGaugeOn (a b : ℝ) (δ : ℝ → ℝ) : Prop := ∀ x ∈ Set.Icc a b, δ x > 0

/-- `def:delta-fine-tagged-partition`, named `IsHKDeltaFine` (see file
header re: ISSUES.md #69) — requires the tag `ξ_i` to lie in its own
subinterval, inherited from `TaggedPartitionIntegration`, plus that
Mathematical statement (Lean): `def IsHKDeltaFine {a b : ℝ} (P : TaggedPartitionIntegration a b) (δ : ℝ → ℝ) : Prop :=`.
subinterval sit inside the gauge-radius ball around `ξ_i`. -/
def IsHKDeltaFine {a b : ℝ} (P : TaggedPartitionIntegration a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

/-- `def:henstock-kurzweil-integral`.
Mathematical statement (Lean): `def HasHKIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=`.
-/
def HasHKIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ →
      |RiemannSum f P - L| < ε

/-- `IsHKIntegrable`.
Mathematical statement (Lean): `def IsHKIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop`.
-/
def IsHKIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasHKIntegral f a b L

-- `lem:cousin`
/-- Let `a b : ℝ`. If `hab : a ≤ b`, `δ : ℝ → ℝ`, and `hδ : IsGaugeOn a b δ`. Then `∃ P :
TaggedPartitionIntegration a b, IsHKDeltaFine P δ`. -/
theorem cousins_lemma (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ) (hδ : IsGaugeOn a b δ) :
    ∃ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ := by
  sorry

variable {f : ℝ → ℝ} {a b : ℝ}

-- `thm:riemann-integrable-implies-hk-integrable`
/-- Let `L : ℝ`. If `hab : a ≤ b` and `hR : HasRiemannIntegral f a b L`. Then `HasHKIntegral f a b
L`. -/
theorem riemann_integrable_implies_hk_integrable (hab : a ≤ b) (L : ℝ)
    (hR : HasRiemannIntegral f a b L) : HasHKIntegral f a b L := by
  sorry

-- `lem:hk-straddle`
/-- Let `ξ : ℝ` and `Dξ : ℝ`. If `F : ℝ → ℝ` and `hF :
LRA.VolumeIII.Analysis.Differentiation.Derivative Dξ F Set.univ ξ`. Then `∀ ε > 0, ∃ δξ > 0, ∀ u
v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F
u - Dξ * (v - u)| ≤ ε * (v - u)`. -/
theorem hk_straddle (F : ℝ → ℝ) (ξ : ℝ) (Dξ : ℝ)
    (hF : LRA.VolumeIII.Analysis.Differentiation.Derivative Dξ F Set.univ ξ) :
    ∀ ε > 0, ∃ δξ > 0, ∀ u v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) →
      v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F u - Dξ * (v - u)| ≤ ε * (v - u) := by
  sorry

-- `thm:hk-fundamental-theorem`
/-- If `F FD : ℝ → ℝ`, `hab : a ≤ b`, and `hF : ∀ x ∈ Set.Icc a b,
LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F Set.univ x`. Then `HasHKIntegral FD a
b (F b - F a)`. -/
theorem hk_fundamental_theorem (F FD : ℝ → ℝ) (hab : a ≤ b)
    (hF : ∀ x ∈ Set.Icc a b, LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F Set.univ x) :
    HasHKIntegral FD a b (F b - F a) := by
  sorry

-- `thm:continuous-hk-integrable`
/-- If `hab : a ≤ b` and `hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`.
Then `IsHKIntegrable f a b`. -/
theorem continuous_hk_integrable (hab : a ≤ b)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsHKIntegrable f a b := by
  sorry

/-- If `F FD : ℝ → ℝ` and `hF : ∀ x : ℝ, LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F
Set.univ x`. Then `IsHKIntegrable FD (-1) 1 ∧ ¬ IsRiemannIntegrable (fun x => |FD x|) (-1) 1`. -/
theorem hk_strictly_wider_than_lebesgue_witness (F FD : ℝ → ℝ)
    (hF : ∀ x : ℝ, LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F Set.univ x) :
    IsHKIntegrable FD (-1) 1 ∧ ¬ IsRiemannIntegrable (fun x => |FD x|) (-1) 1 := by
  sorry

end LRA.VolumeIII.Analysis.Integration
