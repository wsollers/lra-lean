import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`ClosedUnitIntervalUncountable` TODO

Predicate logic:

  ¬ Exists fun enumerate => ∀ (x : Real), x ∈ Set.Icc 0 1 → Exists fun index => enumerate index = x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun enumerate => ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → Exists fun index => enumerate index = x) → False

Logical form (Lean):

```lean
theorem ClosedUnitIntervalUncountable :
    ¬ ∃ enumerate : ℕ → ℝ,
      ∀ x : ℝ, x ∈ Set.Icc (0 : ℝ) 1 → ∃ index : ℕ, enumerate index = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem ClosedUnitIntervalUncountable :
    ¬ ∃ enumerate : ℕ → ℝ,
      ∀ x : ℝ, x ∈ Set.Icc (0 : ℝ) 1 → ∃ index : ℕ, enumerate index = x := by
  sorry
end LRA.Analysis.StructureOfRealLine
