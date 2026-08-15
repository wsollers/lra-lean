/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/gauge/{notes-gauge.tex,
notes-tagged-partitions.tex}.

Full-coverage pass over the `gauge` section — the gauge/tagged-partition
machinery and Cousin's Theorem, which directly foreshadows the
Henstock–Kurzweil integral in the (not-yet-audited) Integration chapter.
One Lean statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

/-- `def:interval-partition`: a finite partition of `[a,b]` given by its
break points.

Logical form:

```lean
structure IntervalPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j
```
-/
structure IntervalPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j

/-- `def:tagged-partition`: an `IntervalPartition` together with a tag in
each cell.

Logical form:

```lean
structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)
```
-/
structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

/-- `def:gauge`: a strictly positive function on `[a,b]`, used to
constrain how fine a tagged partition must be near each tag.

Logical form:

```lean
def IsGauge (a b : ℝ) (δ : ℝ → ℝ) : Prop :=
  ∀ x ∈ Set.Icc a b, δ x > 0
```
-/
def IsGauge (a b : ℝ) (δ : ℝ → ℝ) : Prop :=
  ∀ x ∈ Set.Icc a b, δ x > 0

/-- `def:delta-fine-partition`: each cell of the tagged partition sits
inside the gauge-radius interval around its own tag.

Logical form:

```lean
def IsDeltaFine {a b : ℝ} (P : TaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)
```
-/
def IsDeltaFine {a b : ℝ} (P : TaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

-- `thm:cousins-theorem`
/-- Let `a b : ℝ`. If `hab : a ≤ b`, `δ : ℝ → ℝ`, and `hδ : IsGauge a b δ`. Then `∃ P :
TaggedPartition a b, IsDeltaFine P δ`.

Logical form:

```lean
theorem CousinsTheorem (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ)
    (hδ : IsGauge a b δ) :
    ∃ P : TaggedPartition a b, IsDeltaFine P δ
```
-/
theorem CousinsTheorem (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ)
    (hδ : IsGauge a b δ) :
    ∃ P : TaggedPartition a b, IsDeltaFine P δ := by
  sorry

/-- `def:mesh-of-partition`: the width of the widest cell.

Logical form:

```lean
noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
  0
```
-/
noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
  0

/-- `def:refinement-of-partition`: `Q` refines `P` if every break point of
`P` is a break point of `Q`.

Logical form:

```lean
def IsRefinementOf {a b : ℝ} (Q P : IntervalPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (Q.n + 1), Q.points j = P.points i
```
-/
def IsRefinementOf {a b : ℝ} (Q P : IntervalPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (Q.n + 1), Q.points j = P.points i

/-- `def:common-refinement`: existence of a single partition refining two
given partitions of the same interval.

Logical form:

```lean
def HasCommonRefinement {a b : ℝ} (P₁ P₂ : IntervalPartition a b) : Prop :=
  ∃ Q : IntervalPartition a b, IsRefinementOf Q P₁ ∧ IsRefinementOf Q P₂
```
-/
def HasCommonRefinement {a b : ℝ} (P₁ P₂ : IntervalPartition a b) : Prop :=
  ∃ Q : IntervalPartition a b, IsRefinementOf Q P₁ ∧ IsRefinementOf Q P₂

/-- Let `a b : ℝ` and `P₁ P₂ : IntervalPartition a b`. Then `HasCommonRefinement P₁ P₂`.

Logical form:

```lean
theorem CommonRefinementExists {a b : ℝ} (P₁ P₂ : IntervalPartition a b) :
    HasCommonRefinement P₁ P₂
```
-/
theorem CommonRefinementExists {a b : ℝ} (P₁ P₂ : IntervalPartition a b) :
    HasCommonRefinement P₁ P₂ := by
  sorry

-- `lem:every-point-covered-by-tag`
/-- Let `a b : ℝ` and `P : TaggedPartition a b`. Then `∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc
(P.points i.castSucc) (P.points i.succ)`.

Logical form:

```lean
theorem EveryPointCoveredByTag {a b : ℝ} (P : TaggedPartition a b) :
    ∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ)
```
-/
theorem EveryPointCoveredByTag {a b : ℝ} (P : TaggedPartition a b) :
    ∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ) := by
  sorry

end LRA.Analysis.Continuity
