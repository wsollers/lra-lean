
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

/--
`MTail` TODO

Predicate logic:

  def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n)

Predicate logic (unfolded):

  def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n)

/--
`ConvergenceOfTail` TODO

Predicate logic:

  (∀ x ∈ RealSequence), ((∃ L, ConvergesTo x L) ↔ (∃ L, ConvergesTo (MTail x m) L)) ∧ (∀ L, ConvergesTo x L → ConvergesTo (MTail x m) L)

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (m : Nat), (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x (instHAdd.hAdd m n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.MTail x m n) L))) ε ∧ ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x (instHAdd.hAdd m n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.MTail x m n) L))) ε)

Logical form (Lean):

```lean
theorem ConvergenceOfTail (x : RealSequence) (m : ℕ) :
    ((∃ L, ConvergesTo x L) ↔ (∃ L, ConvergesTo (MTail x m) L)) ∧
      (∀ L, ConvergesTo x L → ConvergesTo (MTail x m) L)
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
theorem ConvergenceOfTail (x : RealSequence) (m : ℕ) :
    ((∃ L, ConvergesTo x L) ↔ (∃ L, ConvergesTo (MTail x m) L)) ∧
      (∀ L, ConvergesTo x L → ConvergesTo (MTail x m) L) := by
  sorry

/--
`ConvergenceByDomination` TODO

Predicate logic:

  (∀ n, 0 < a n ∧ ∃ c > 0, ∃ m ∈ ℕ, ∀ n ≥ m, |x n - L| ≤ c * a n) → ConvergesTo x L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} {a : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Real.instLT.1 Zero.toOfNat0.1 (a n) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (a n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (a n) 0))) ε ∧ Exists fun c => (Real.instLT.1 Zero.toOfNat0.1 c ∧ Exists fun m => ∀ (n : Nat), instLENat.1 m n → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) (instHMul.1 c (a n))))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε

Logical form (Lean):

```lean
theorem ConvergenceByDomination {x : RealSequence} {L : ℝ}
    {a : RealSequence} (ha_pos : ∀ n, 0 < a n) (ha_null : ConvergesTo a 0)
    (h : ∃ c > 0, ∃ m : ℕ, ∀ n ≥ m, |x n - L| ≤ c * a n) :
    ConvergesTo x L
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
theorem ConvergenceByDomination {x : RealSequence} {L : ℝ}
    {a : RealSequence} (ha_pos : ∀ n, 0 < a n) (ha_null : ConvergesTo a 0)
    (h : ∃ c > 0, ∃ m : ℕ, ∀ n ≥ m, |x n - L| ≤ c * a n) :
    ConvergesTo x L := by
  sorry

/--
`RatioLimitLessThanOneImpliesNull` TODO

Predicate logic:

  (∀ n, 0 < x n ∧ L < 1) → ConvergesTo x 0

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Real.instLT.1 Zero.toOfNat0.1 (x n)) → ∀ {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 (x (instHAdd.hAdd n 1)) (x n)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv (x (instHAdd.hAdd n 1)) (x n)) n) L))) ε ∧ Real.instLT.1 L One.toOfNat1.1) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) 0))) ε

Logical form (Lean):

```lean
theorem RatioLimitLessThanOneImpliesNull {x : RealSequence}
    (hx_pos : ∀ n, 0 < x n) {L : ℝ}
    (hratio : ConvergesTo (fun n => x (n + 1) / x n) L) (hL : L < 1) :
    ConvergesTo x 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem RatioLimitLessThanOneImpliesNull {x : RealSequence}
    (hx_pos : ∀ n, 0 < x n) {L : ℝ}
    (hratio : ConvergesTo (fun n => x (n + 1) / x n) L) (hL : L < 1) :
    ConvergesTo x 0 := by
  sorry

end LRA.Analysis.Sequences
