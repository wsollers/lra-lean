
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/--
`IsCauchy` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (x m) (x n))) ε

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε

Logical form (Lean):

```lean
def IsCauchy (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsCauchy (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε

/--
`ConvergentSequencesAreCauchy` TODO

Predicate logic:

  (∃ L ∈ ℝ, ConvergesTo x L) → IsCauchy x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε

Logical form (Lean):

```lean
theorem ConvergentSequencesAreCauchy {x : RealSequence}
    (h : ∃ L : ℝ, ConvergesTo x L) : IsCauchy x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem ConvergentSequencesAreCauchy {x : RealSequence}
    (h : ∃ L : ℝ, ConvergesTo x L) : IsCauchy x := by
  sorry
/--
`CauchySequencesAreBounded` TODO

Predicate logic:

  (IsCauchy x) → BoundedSeq x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε) → Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)

Logical form (Lean):

```lean
theorem CauchySequencesAreBounded {x : RealSequence} (h : IsCauchy x) :
    BoundedSeq x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem CauchySequencesAreBounded {x : RealSequence} (h : IsCauchy x) :
    BoundedSeq x := by
  sorry
/--
`CauchyConvergentSubsequenceConverges` TODO

Predicate logic:

  (IsCauchy x ∧ IsSubsequentialLimit x L) → ConvergesTo x L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε

Logical form (Lean):

```lean
theorem CauchyConvergentSubsequenceConverges {x : RealSequence} {L : ℝ}
    (hcauchy : IsCauchy x) (hsub : IsSubsequentialLimit x L) :
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

Related proof moves: TODO

-/
theorem CauchyConvergentSubsequenceConverges {x : RealSequence} {L : ℝ}
    (hcauchy : IsCauchy x) (hsub : IsSubsequentialLimit x L) :
    ConvergesTo x L := by
  sorry
/--
`CauchyCriterionRealSequences` TODO

Predicate logic:

  ∃ L ∈ ℝ, ConvergesTo x L ↔ IsCauchy x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε

Logical form (Lean):

```lean
theorem CauchyCriterionRealSequences {x : RealSequence} :
    (∃ L : ℝ, ConvergesTo x L) ↔ IsCauchy x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, use, rcases

-/
theorem CauchyCriterionRealSequences {x : RealSequence} :
    (∃ L : ℝ, ConvergesTo x L) ↔ IsCauchy x := by
  sorry
/--
`CauchyCriterionViaTails` TODO

Predicate logic:

  IsCauchy x ↔ ∀ ε > 0, ∃ N ∈ ℕ, ∀ p q : ℕ, |x (N + p) - x (N + q)| < ε

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (p q : Nat), Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x (instHAdd.1 N p)) (x (instHAdd.1 N q))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x (instHAdd.1 N p)) (x (instHAdd.1 N q))))) ε

Logical form (Lean):

```lean
theorem CauchyCriterionViaTails {x : RealSequence} :
    IsCauchy x ↔ ∀ ε > 0, ∃ N : ℕ, ∀ p q : ℕ, |x (N + p) - x (N + q)| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem CauchyCriterionViaTails {x : RealSequence} :
    IsCauchy x ↔ ∀ ε > 0, ∃ N : ℕ, ∀ p q : ℕ, |x (N + p) - x (N + q)| < ε := by
  sorry
/--
`CauchyTailDiameterCriterion` TODO

Predicate logic:

  IsCauchy x ↔ ∀ ε > 0, ∃ N₀ ∈ ℕ, ∀ N ≥ N₀, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N₀ => ∀ (N : Nat), instLENat.1 N₀ N → ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε

Logical form (Lean):

```lean
theorem CauchyTailDiameterCriterion {x : RealSequence} :
    IsCauchy x ↔
      ∀ ε > 0, ∃ N₀ : ℕ, ∀ N ≥ N₀, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem CauchyTailDiameterCriterion {x : RealSequence} :
    IsCauchy x ↔
      ∀ ε > 0, ∃ N₀ : ℕ, ∀ N ≥ N₀, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε := by
  sorry
/--
`CauchySuccessiveDifferencesVanish` TODO

Predicate logic:

  (IsCauchy x) → IsNull (fun n => |x (n + 1) - x n|)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 ((fun n => SemilatticeSup.toMax.1 (instHSub.hSub (x (instHAdd.hAdd n 1)) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (x (instHAdd.hAdd n 1)) (x n)))) n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun n => SemilatticeSup.toMax.max (instHSub.hSub (x (instHAdd.hAdd n 1)) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (x (instHAdd.hAdd n 1)) (x n)))) n))) ε

Logical form (Lean):

```lean
theorem CauchySuccessiveDifferencesVanish {x : RealSequence}
    (h : IsCauchy x) : IsNull (fun n => |x (n + 1) - x n|)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem CauchySuccessiveDifferencesVanish {x : RealSequence}
    (h : IsCauchy x) : IsNull (fun n => |x (n + 1) - x n|) := by
  sorry
/--
`ScalarMultipleCauchySequence` TODO

Predicate logic:

  (IsCauchy x) → IsCauchy (fun n => α * x n)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {α : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHMul.1 α (x n)) m) ((fun n => instHMul.1 α (x n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHMul.hMul α (x n)) m) ((fun n => instHMul.hMul α (x n)) n)))) ε

Logical form (Lean):

```lean
theorem ScalarMultipleCauchySequence {x : RealSequence} {α : ℝ}
    (h : IsCauchy x) : IsCauchy (fun n => α * x n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ScalarMultipleCauchySequence {x : RealSequence} {α : ℝ}
    (h : IsCauchy x) : IsCauchy (fun n => α * x n) := by
  sorry
/--
`SumCauchySequences` TODO

Predicate logic:

  (IsCauchy x ∧ IsCauchy y) → IsCauchy (fun n => x n + y n)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y m) (y n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y m) (y n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHAdd.1 (x n) (y n)) m) ((fun n => instHAdd.1 (x n) (y n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHAdd.hAdd (x n) (y n)) m) ((fun n => instHAdd.hAdd (x n) (y n)) n)))) ε

Logical form (Lean):

```lean
theorem SumCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n + y n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem SumCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n + y n) := by
  sorry
/--
`DifferenceCauchySequences` TODO

Predicate logic:

  (IsCauchy x ∧ IsCauchy y) → IsCauchy (fun n => x n - y n)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y m) (y n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y m) (y n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHSub.1 (x n) (y n)) m) ((fun n => instHSub.1 (x n) (y n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHSub.hSub (x n) (y n)) m) ((fun n => instHSub.hSub (x n) (y n)) n)))) ε

Logical form (Lean):

```lean
theorem DifferenceCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n - y n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem DifferenceCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n - y n) := by
  sorry
/--
`LinearCombinationCauchySequences` TODO

Predicate logic:

  (IsCauchy x ∧ IsCauchy y) → IsCauchy (fun n => α * x n + β * y n)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {α β : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y m) (y n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y m) (y n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHAdd.1 (instHMul.hMul α (x n)) (instHMul.hMul β (y n))) m) ((fun n => instHAdd.1 (instHMul.hMul α (x n)) (instHMul.hMul β (y n))) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHAdd.hAdd (instHMul.hMul α (x n)) (instHMul.hMul β (y n))) m) ((fun n => instHAdd.hAdd (instHMul.hMul α (x n)) (instHMul.hMul β (y n))) n)))) ε

Logical form (Lean):

```lean
theorem LinearCombinationCauchySequences {x y : RealSequence} {α β : ℝ}
    (hx : IsCauchy x) (hy : IsCauchy y) :
    IsCauchy (fun n => α * x n + β * y n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LinearCombinationCauchySequences {x y : RealSequence} {α β : ℝ}
    (hx : IsCauchy x) (hy : IsCauchy y) :
    IsCauchy (fun n => α * x n + β * y n) := by
  sorry
/--
`ProductCauchySequences` TODO

Predicate logic:

  (IsCauchy x ∧ IsCauchy y) → IsCauchy (fun n => x n * y n)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y m) (y n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y m) (y n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHMul.1 (x n) (y n)) m) ((fun n => instHMul.1 (x n) (y n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHMul.hMul (x n) (y n)) m) ((fun n => instHMul.hMul (x n) (y n)) n)))) ε

Logical form (Lean):

```lean
theorem ProductCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n * y n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ProductCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n * y n) := by
  sorry
/--
`ReciprocalCauchySequence` TODO

Predicate logic:

  (IsCauchy x ∧ ∃ c > 0, ∃ N₀ ∈ ℕ, ∀ n ≥ N₀, c ≤ |x n|) → IsCauchy (fun n => 1 / x n)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ Exists fun c => (Real.instLT.1 Zero.toOfNat0.1 c ∧ Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → Real.instLE.1 c (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 1 (x n)) m) ((fun n => instHDiv.1 1 (x n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv 1 (x n)) m) ((fun n => instHDiv.hDiv 1 (x n)) n)))) ε

Logical form (Lean):

```lean
theorem ReciprocalCauchySequence {x : RealSequence}
    (hx : IsCauchy x) (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |x n|) :
    IsCauchy (fun n => 1 / x n)
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
theorem ReciprocalCauchySequence {x : RealSequence}
    (hx : IsCauchy x) (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |x n|) :
    IsCauchy (fun n => 1 / x n) := by
  sorry
/--
`QuotientCauchySequences` TODO

Predicate logic:

  (IsCauchy x ∧ IsCauchy y ∧ ∃ c > 0, ∃ N₀ ∈ ℕ, ∀ n ≥ N₀, c ≤ |y n|) → IsCauchy (fun n => x n / y n)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y m) (y n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y m) (y n)))) ε ∧ Exists fun c => (Real.instLT.1 Zero.toOfNat0.1 c ∧ Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → Real.instLE.1 c (SemilatticeSup.toMax.1 (y n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (y n)))))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 (x n) (y n)) m) ((fun n => instHDiv.1 (x n) (y n)) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv (x n) (y n)) m) ((fun n => instHDiv.hDiv (x n) (y n)) n)))) ε

Logical form (Lean):

```lean
theorem QuotientCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y)
    (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |y n|) :
    IsCauchy (fun n => x n / y n)
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
theorem QuotientCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y)
    (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |y n|) :
    IsCauchy (fun n => x n / y n) := by
  sorry
/--
`AbsoluteValueCauchySequence` TODO

Predicate logic:

  (IsCauchy x) → IsCauchy (fun n => |x n|)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x m) (x n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x m) (x n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => SemilatticeSup.toMax.max (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (x n))) m) ((fun n => SemilatticeSup.toMax.max (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (x n))) n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => abs (x n)) m) ((fun n => abs (x n)) n)))) ε

Logical form (Lean):

```lean
theorem AbsoluteValueCauchySequence {x : RealSequence} (h : IsCauchy x) :
    IsCauchy (fun n => |x n|)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem AbsoluteValueCauchySequence {x : RealSequence} (h : IsCauchy x) :
    IsCauchy (fun n => |x n|) := by
  sorry
end LRA.Analysis.Sequences
