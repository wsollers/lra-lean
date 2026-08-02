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
/-- Mathematical statement (Lean): `theorem continuous_riemann_integrable (hab : a ≤ b) (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) : IsRiemannIntegrable f a b`.
*Proof status:* proof pending. -/
theorem continuous_riemann_integrable (hab : a ≤ b)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsRiemannIntegrable f a b := by
  sorry

/-- Thomae's function: the book's positive worked example — discontinuous
on a dense set (ℚ ∩ [0,1]) yet Riemann-integrable with integral 0.
Characterized here by its defining property rather than constructed
outright (`x ↦ 1/q` for `x = p/q` in lowest terms, `0` for irrational
`x`), since the lowest-terms extraction needs more Mathlib rational
machinery than this scratch pass reaches for — any `f` satisfying this
Mathematical statement (Lean): `theorem thomae_riemann_integrable_zero (T : ℝ → ℝ) (hT : ∀ x ∈ Set.Icc (0:ℝ) 1, (LRA.VolumeIII.Analysis.Completeness.IsIrrational x → T x = 0) ∧ (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) : HasRiemannIntegral T 0 1 0`.
*Proof status:* proof pending.
characterization is what the book calls Thomae's function. -/
theorem thomae_riemann_integrable_zero (T : ℝ → ℝ)
    (hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
      (LRA.VolumeIII.Analysis.Completeness.IsIrrational x → T x = 0) ∧
      (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) :
    HasRiemannIntegral T 0 1 0 := by
  sorry

-- `thm:riemann-integral-linearity`
/-- Mathematical statement (Lean): `theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf) (hLg : HasRiemannIntegral g a b Lg) : HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)`.
*Proof status:* proof pending. -/
theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) :
    HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by sorry

-- `thm:riemann-integral-monotonicity`
/-- Mathematical statement (Lean): `theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf) (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg`.
*Proof status:* proof pending. -/
theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry

-- `thm:riemann-integral-triangle-inequality`
/-- Mathematical statement (Lean): `theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) : IsRiemannIntegrable (fun x => |f x|) a b ∧ ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' → |L| ≤ L'`.
*Proof status:* proof pending. -/
theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) :
    IsRiemannIntegrable (fun x => |f x|) a b ∧
    ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' →
      |L| ≤ L' := by
  sorry

-- `thm:riemann-integral-interval-additivity`
/-- unlike its Cauchy
Mathematical statement (Lean): `theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) : IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b`.
*Proof status:* proof pending.
analogue (a one-directional implication), this is a genuine iff. -/
theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) :
    IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b := by
  sorry

/-- `riemann_integral_interval_additivity_value`.
Mathematical statement (Lean): `theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b) (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac) (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb`.
*Proof status:* proof pending.
-/
theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac)
    (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry

-- `thm:riemann-cauchy-criterion`
/-- Mathematical statement (Lean): `theorem riemann_cauchy_criterion (hab : a ≤ b) (hbdd : LRA.VolumeIII.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) : IsRiemannIntegrable f a b ↔ ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ → |RiemannSum f P - RiemannSum f Q| < ε`.
*Proof status:* proof pending. -/
theorem riemann_cauchy_criterion (hab : a ≤ b)
    (hbdd : LRA.VolumeIII.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
        PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
        |RiemannSum f P - RiemannSum f Q| < ε := by
  sorry

end LRA.VolumeIII.Analysis.Integration
