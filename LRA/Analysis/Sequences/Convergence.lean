
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

/--
`ConvergesToNbhd` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLT.lt (instHSub.hSub L ε) (x n) ∧ Real.instLT.lt (x n) (instHAdd.hAdd L ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → (Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub L ε) (x n) ∧ Real.instLT.lt (x n) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L ε))

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

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), ((LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun K => ∀ (n : Nat), GE.ge n K → Real.instLT.lt (abs (instHSub.hSub (x n) L)) ε) ∧ ((LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun K => ∀ (n : Nat), GE.ge n K → (Real.instLT.lt (instHSub.hSub L ε) (x n) ∧ Real.instLT.lt (x n) (instHAdd.hAdd L ε))) ∧ (LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.ConvergesToNbhd x L)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    ((LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun K => ∀ (n : Nat), GE.ge n K → Real.instLT.lt (abs (instHSub.hSub (x n) L)) ε) ∧ ((LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun K => ∀ (n : Nat), GE.ge n K → (Real.instLT.lt (instHSub.hSub L ε) (x n) ∧ Real.instLT.lt (x n) (instHAdd.hAdd L ε))) ∧ (LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.ConvergesToNbhd x L)))

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
