
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

/--
`ConvergesToNbhd` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLT.lt (instHSub.hSub L ε) (x n) ∧ Real.instLT.lt (x n) (instHAdd.hAdd L ε))

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → (Real.instLT.1 (instHSub.1 L ε) (x n) ∧ Real.instLT.1 (x n) (instHAdd.1 L ε))

Logical form (Lean):

```lean
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε

/--
`EquivalenceOfConvergenceFormulations` TODO

Predicate logic:

  (∀ x ∈ RealSequence), ConvergesTo x L ↔ ∀ ε > 0, ∃ K ∈ ℕ, ∀ n ≥ K, |x n - L| < ε ∧ ConvergesTo x L ↔ ∀ ε > 0, ∃ K ∈ ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε ∧ (ConvergesTo x L ↔ ConvergesToNbhd x L)

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun K => ∀ (n : Nat), instLENat.1 K n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun K => ∀ (n : Nat), instLENat.1 K n → (Real.instLT.1 (instHSub.1 L ε) (x n) ∧ Real.instLT.1 (x n) (instHAdd.1 L ε)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → (Real.instLT.1 (instHSub.1 L ε) (x n) ∧ Real.instLT.1 (x n) (instHAdd.1 L ε))))

Logical form (Lean):

```lean
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧
      (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧
      (ConvergesTo x L ↔ ConvergesToNbhd x L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧
      (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧
      (ConvergesTo x L ↔ ConvergesToNbhd x L) := by
  sorry
end LRA.Analysis.Sequences
