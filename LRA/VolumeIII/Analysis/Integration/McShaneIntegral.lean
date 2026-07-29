/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/mcshane-integral/notes-mcshane-integral.tex.

Full-coverage pass over the `mcshane-integral` section — the chapter's
final stop before the handoff to measure theory (McShane = Lebesgue
exactly). Fixes ISSUES.md #69/#70: distinct name `IsMcShaneDeltaFine`
(vs. HK's `IsHKDeltaFine`) for the tag-can-be-outside-slab relation, and
the McShane tagged-partition structure below does not reuse
`TaggedPartitionIntegration` (whose tag-in-slab requirement is exactly
what McShane drops) — it is its own structure with an unconstrained tag,
fixing the book's own `TaggedPartition((P,ξ),P,[a,b])` double-argument
typo (ISSUES.md #70) by simply not routing through that predicate at all.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Integration.Partitions
import LRA.VolumeIII.Analysis.Integration.RiemannIntegral
import LRA.VolumeIII.Analysis.Integration.HenstockKurzweil
import LRA.VolumeIII.Analysis.Integration.MeasureZero

namespace LRA.VolumeIII.Analysis.Integration

/-- `def:mcshane-fine-tagged-partition`'s underlying tagged structure:
same non-overlapping-covering-subintervals as `IntegrationPartition`, but
the tag `ξ_i` ranges freely over `[a,b]` rather than being pinned inside
its own subinterval `[u_i,v_i]` — the one structural difference from
`TaggedPartitionIntegration` that makes McShane's construction strictly
Mathematical statement (Lean): `structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b`.
more permissive than HK's. -/
structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b

/-- `def:mcshane-fine-tagged-partition`, `IsMcShaneDeltaFine` (see file
Mathematical statement (Lean): `def IsMcShaneDeltaFine {a b : ℝ} (P : McShaneTaggedPartition a b) (δ : ℝ → ℝ) : Prop :=`.
header re: ISSUES.md #69/#70). -/
def IsMcShaneDeltaFine {a b : ℝ} (P : McShaneTaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

/-- `def:mcshane-integral`.
Mathematical statement (Lean): `def HasMcShaneIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=`.
-/
def HasMcShaneIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : McShaneTaggedPartition a b, IsMcShaneDeltaFine P δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε

/-- `IsMcShaneIntegrable`.
Mathematical statement (Lean): `def IsMcShaneIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop`.
-/
def IsMcShaneIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasMcShaneIntegral f a b L

variable {f : ℝ → ℝ} {a b : ℝ}

/-- `thm:riemann-mcshane-hk-inclusions`: `R ⊆ McShane ⊆ HK`, values
Mathematical statement (Lean): `theorem riemann_mcshane_hk_inclusions (hab : a ≤ b) (L : ℝ) : (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧ (HasMcShaneIntegral f a b L → HasHKIntegral f a b L)`.
*Proof status:* proof pending.
agreeing on overlap. -/
theorem riemann_mcshane_hk_inclusions (hab : a ≤ b) (L : ℝ) :
    (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧
    (HasMcShaneIntegral f a b L → HasHKIntegral f a b L) := by
  sorry

/-- `thm:mcshane-equals-lebesgue`: McShane integrability coincides
exactly with the Lebesgue criterion already formalized in
`MeasureZero.lean` (stood in for full Lebesgue integrability, absent a
measure-theory development in this corpus, by the same criterion used for
`lebesgue_criterion_riemann_integrability`, applied to the *absolute*
oscillation-based measure-zero condition that characterizes Lebesgue
Mathematical statement (Lean): `theorem mcshane_equals_lebesgue (hab : a ≤ b) : IsMcShaneIntegrable f a b ↔ ∃ E : Set ℝ, IsMeasureZero E ∧ ∀ x ∈ Set.Icc a b \ E, LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) x`.
*Proof status:* proof pending.
integrability in general, not just Riemann's bounded case). -/
theorem mcshane_equals_lebesgue (hab : a ≤ b) :
    IsMcShaneIntegrable f a b ↔
      ∃ E : Set ℝ, IsMeasureZero E ∧
        ∀ x ∈ Set.Icc a b \ E, LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) x := by
  sorry

/-- The book's chain-closing observation: HK's `x²sin(1/x²)`-derivative
witness is only *conditionally* integrable — McShane's free tags can
sample nearby oscillatory peaks in a way HK's tag-in-slab restriction
cannot, destroying the conditional cancellation and leaving only the
absolutely-integrable (Lebesgue) part. Recorded as the fact that the HK
witness from `HenstockKurzweil.lean` is HK-integrable but not
Mathematical statement (Lean): `theorem hk_strictly_wider_than_mcshane (F FD : ℝ → ℝ) (hF : ∀ x : ℝ, LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F Set.univ x) (hHK : IsHKIntegrable FD (-1) 1) (hnotLebesgue : ¬ IsRiemannIntegrable (fun x => |FD x|) (-1) 1) : ¬ IsMcShaneIntegrable FD (-1) 1`.
*Proof status:* proof pending.
McShane-integrable. -/
theorem hk_strictly_wider_than_mcshane (F FD : ℝ → ℝ)
    (hF : ∀ x : ℝ, LRA.VolumeIII.Analysis.Differentiation.Derivative (FD x) F Set.univ x)
    (hHK : IsHKIntegrable FD (-1) 1) (hnotLebesgue : ¬ IsRiemannIntegrable (fun x => |FD x|) (-1) 1) :
    ¬ IsMcShaneIntegrable FD (-1) 1 := by
  sorry

end LRA.VolumeIII.Analysis.Integration
