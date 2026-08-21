import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

/-!
Source: book-analysis-ii/continuity/notes/limits/notes-limits.tex. The
one-sided, sequential, and topological characterizations of `TendsTo`, and
the theorem that all three (plus the definition itself) are equivalent.
-/

namespace LRA.Analysis.Limits

-- `thm:two-sided-limit-iff-matching-one-sided-limits`
/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `TendsTo f A c L ↔ TendsToLeft f A c L ∧
TendsToRight f A c L`.

Logical form:

```lean
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L
```
-/
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L := by
  sorry

/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then `TendsTo f A c L ↔ ∀ xs : ℕ → ℝ,
ApproachesButNotEqual xs A c → ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε`.

Logical form:

```lean
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε
```
-/
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry

/-- `def:limit-function-neighbourhood` / `prop:limit-neighbourhood-equiv`: the
centered-open-interval (neighborhood) form of the limit. Let `A : Set ℝ`
and `c L : ℝ`. If `f : ℝ → ℝ`. Then `TendsTo f A c L ↔ ∀ εNbhd : Set ℝ, (∃
ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) → ∃ δNbhd : Set ℝ, (∃ δ > 0, δNbhd
= Set.Ioo (c - δ) (c + δ) \ {c}) ∧ ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd`.

Logical form:

```lean
theorem TendstoIffNeighbourhood (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd
```
-/
theorem TendstoIffNeighbourhood (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd := by
  sorry

/-- Let `A : Set ℝ` and `c L : ℝ`. If `f : ℝ → ℝ`. Then the ε-δ definition, the one-sided
agreement, the sequential criterion, and the neighborhood form are all equivalent
characterizations of `TendsTo f A c L`.

Logical form:

```lean
theorem TendstoCharacterizationsTFAE (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    [TendsTo f A c L,
      TendsToLeft f A c L ∧ TendsToRight f A c L,
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε,
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE
```
-/
theorem TendstoCharacterizationsTFAE (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    [TendsTo f A c L,
      TendsToLeft f A c L ∧ TendsToRight f A c L,
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε,
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE := by
  sorry

end LRA.Analysis.Limits
