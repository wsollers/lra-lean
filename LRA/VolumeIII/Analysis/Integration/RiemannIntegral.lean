/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/riemann-integral/notes-riemann-integral.tex.

Full-coverage pass over the `riemann-integral` section. Fixes ISSUES.md
#68: the book never names a predicate for "f is Riemann-integrable" in
this file at all (everything stated in bare prose/quantifiers, unlike the
Cauchy section immediately before it) — this file introduces
`IsRiemannIntegrable`/`HasRiemannIntegral`, matching the naming
convention already used one section back for `IsCauchyIntegrable`/
`HasCauchyIntegral`, so later sections have one consistent predicate to
cite.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Integration.Partitions
import LRA.VolumeIII.Analysis.Completeness.Density
import LRA.VolumeIII.Analysis.Integration.CauchyIntegral

namespace LRA.VolumeIII.Analysis.Integration

/-- `def:riemann-sum`.
Mathematical statement (Lean): `def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=`.
-/
def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
  ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i

/-- `def:riemann-integral` (see file header re: ISSUES.md #68).
Mathematical statement (Lean): `def HasRiemannIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=`.
-/
def HasRiemannIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ → |RiemannSum f P - L| < ε

/-- `IsRiemannIntegrable`.
Mathematical statement (Lean): `def IsRiemannIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop`.
-/
def IsRiemannIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasRiemannIntegral f a b L

variable {f g : ℝ → ℝ} {a b : ℝ}

-- `thm:continuous-riemann-integrable`
/-- If `hab : a ≤ b` and `hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`.
Then `IsRiemannIntegrable f a b`. -/
theorem continuous_riemann_integrable (hab : a ≤ b)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsRiemannIntegrable f a b := by
  sorry

/-- If `T : ℝ → ℝ` and `hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
(LRA.VolumeIII.Analysis.Completeness.IsIrrational x → T x = 0) ∧ (∀ p q : ℕ, q > 0 → Nat.Coprime
p q → x = (p : ℝ) / q → T x = 1 / q)`. Then `HasRiemannIntegral T 0 1 0`. -/
theorem thomae_riemann_integrable_zero (T : ℝ → ℝ)
    (hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
      (LRA.VolumeIII.Analysis.Completeness.IsIrrational x → T x = 0) ∧
      (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) :
    HasRiemannIntegral T 0 1 0 := by
  sorry

-- `thm:riemann-integral-linearity`
/-- Let `α β Lf Lg : ℝ`. If `hLf : HasRiemannIntegral f a b Lf` and `hLg : HasRiemannIntegral g a b
Lg`. Then `HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)`. -/
theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) :
    HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by sorry

-- `thm:riemann-integral-monotonicity`
/-- Let `Lf Lg : ℝ`. If `hLf : HasRiemannIntegral f a b Lf`, `hLg : HasRiemannIntegral g a b Lg`,
and `hle : ∀ x ∈ Set.Icc a b, f x ≤ g x`. Then `Lf ≤ Lg`. -/
theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry

-- `thm:riemann-integral-triangle-inequality`
/-- If `hf : IsRiemannIntegrable f a b`. Then `IsRiemannIntegrable (fun x => |f x|) a b ∧ ∀ L L',
HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' → |L| ≤ L'`. -/
theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) :
    IsRiemannIntegrable (fun x => |f x|) a b ∧
    ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' →
      |L| ≤ L' := by
  sorry

-- `thm:riemann-integral-interval-additivity`
/-- Let `c : ℝ`. If `hac : a ≤ c` and `hcb : c ≤ b`. Then `IsRiemannIntegrable f a b ↔
IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b`. -/
theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) :
    IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b := by
  sorry

/-- Let `c Lab Lac Lcb : ℝ`. If `hac : a ≤ c`, `hcb : c ≤ b`, `hab' : HasRiemannIntegral f a b Lab`,
`hac' : HasRiemannIntegral f a c Lac`, and `hcb' : HasRiemannIntegral f c b Lcb`. Then `Lab =
Lac + Lcb`. -/
theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac)
    (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry

-- `thm:riemann-cauchy-criterion`
/-- If `hab : a ≤ b` and `hbdd : LRA.VolumeIII.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`.
Then `IsRiemannIntegrable f a b ↔ ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
|RiemannSum f P - RiemannSum f Q| < ε`. -/
theorem riemann_cauchy_criterion (hab : a ≤ b)
    (hbdd : LRA.VolumeIII.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
        PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
        |RiemannSum f P - RiemannSum f Q| < ε := by
  sorry

end LRA.VolumeIII.Analysis.Integration
