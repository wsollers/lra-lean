namespace LRA.Analysis.Completeness

universe u

/-- Every Cauchy sequence on an ordered-field carrier converges, stated
entirely in epsilon/difference form.

For every sequence `a`, if for each positive epsilon all sufficiently late
pairwise differences lie between `-ε` and `ε`, then there is a value `L` such
that every sufficiently late difference `a n - L` lies between `-ε` and `ε`.
Subtraction is written as addition of the additive inverse, so this definition
uses only the primitive algebraic and order operations and has no topology,
filter, uniform-space, or Mathlib dependency.

In an ordered field, the positivity hypothesis `0 ≤ ε ∧ ε ≠ 0` is equivalent
to `0 < ε`.

Logical form:

```lean
def CauchySequencesConverge
    (F : Type u) [Add F] [Neg F] [OfNat F 0] [LE F] : Prop :=
  ∀ a : ℕ → F,
    (∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
        -ε ≤ a m + -(a n) ∧ a m + -(a n) ≤ ε) →
    ∃ L : F, ∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
        -ε ≤ a n + -L ∧ a n + -L ≤ ε
```
-/
def CauchySequencesConverge
    (F : Type u) [Add F] [Neg F] [OfNat F 0] [LE F] : Prop :=
  ∀ a : ℕ → F,
    (∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n →
        -ε ≤ a m + -(a n) ∧ a m + -(a n) ≤ ε) →
    ∃ L : F, ∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
        -ε ≤ a n + -L ∧ a n + -L ≤ ε

end LRA.Analysis.Completeness
