import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

/--
`ClosedUnitIntervalUncountable` TODO

Predicate logic:

  ¬ ∃ enumerate ∈ ℕ → ℝ, ∀ x : ℝ, x ∈ Set.Icc 0 ∈ ℝ 1 → ∃ index ∈ ℕ, enumerate index = x

Predicate logic (unfolded):

  (Exists fun enumerate => ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) x → Exists fun index => enumerate index = x) → False

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
