/-
Draft module; not yet imported by the active Volume III root.
New namespace/area: `LRA.VolumeIII.Analysis.Completeness.*`, mirroring the
book's own promotion of `completeness` from a section of the Bounds chapter
to its own top-level chapter (see ISSUES.md's "Completeness chapter" table
header for that history). Historical note: the Archimedean-property and
density Lean draft modules from earlier in this pass
(`ArchimedeanProperty.lean`, `Density.lean`) still live under
`Bounding` — they were written before the chapter promotion was
known, and are left in place rather than moved, to avoid churn on already-
delivered files. New completeness content goes here going forward.

Source: ADDITIONS.md items 19, 20, 22, 23 — three theorems/examples added
with user sign-off after being asked directly "are there other completeness
theorems I should include, or perhaps examples." Item 21 (the relative-sup
crossover example) lives in `RelativeBounds.lean`
(`LRA.VolumeIII.Analysis.Bounding`) instead, since it needs the
`IsRelativeSupremum` machinery defined there.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Order.Bounds.Basic

namespace LRA.VolumeIII.Analysis.Completeness

/-- ADDITIONS.md #19. Existence and uniqueness of nonnegative square roots
via the least-upper-bound property — the single most natural payoff of the
completeness axiom, and the chapter's own recurring motivating example
(`{x∈ℚ:x²<2}`) is literally half of this proof already (`b := sup{x≥0 :
x²≤a}`). Deliberately scoped to square roots rather than general `n`th
roots — the latter is a routine generalization once this exists, and adding
both would be padding rather than depth. -/
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry

/-- ADDITIONS.md #20. `ℚ` does not have the least-upper-bound property —
stated as its own citable proposition rather than left embedded only in the
chapter-opening motivating remark. Witnessed by the chapter's own recurring
example set. -/
theorem RationalsLackLubProperty :
    ({x : ℚ | x ^ 2 < 2} : Set ℚ).Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ ({x : ℚ | x ^ 2 < 2} : Set ℚ), x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB ({x : ℚ | x ^ 2 < 2} : Set ℚ) s := by
  sorry

/-- The lower part of a Dedekind cut of `ℚ` at `√2` — `def:relative-bounds`'s
own worked example, made concrete as a cut. See ADDITIONS.md #23. -/
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}

/-- The upper part of the same cut. -/
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}

/-- ADDITIONS.md #23 (part 1). The rational Dedekind cut at `√2` has a
genuine GAP: the lower part has no maximum and the upper part has no
minimum — this is exactly the failure mode `thm:dedekind-cut-property` and
`cor:no-gaps-in-r` rule out for `ℝ`. Concrete contrast case for those two
theorems. -/
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x) := by
  sorry

/-- The lower part of the corresponding cut of `ℝ` at `√2`. -/
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}

/-- The upper part of the corresponding cut of `ℝ` at `√2`. -/
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}

/-- ADDITIONS.md #23 (part 2). The SAME cut, taken in `ℝ` instead of `ℚ`,
has NO gap: the lower part still has no maximum, but the upper part now has
a minimum, namely `√2` itself — matching `thm:dedekind-cut-property`'s
disjunctive conclusion ("either `L` has a maximum or `U` has a minimum"),
here resolved in favor of the second disjunct. Direct contrast with
`RationalDedekindCutAtSqrtTwoHasAGap` above: same construction, one
ambient field complete and the other not. -/
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry

/-- ADDITIONS.md #22. The first few bisection steps toward `√2`, cashing out
`thm:monotone-convergence-implies-lub-property`'s Interpretation remark
(which describes the bisection construction only in prose) as an actual
numeric bracket. Each pair of bounds is a legitimate bisection step from the
previous one: `[1,2] → [1,1.5] → [1.4,1.5] → [1.4,1.45] → [1.41,1.42]`
(bisecting and testing the midpoint's square against `2` at each stage). -/
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
