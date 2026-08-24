
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences
import LRA.Analysis.Sequences.LiminfLimsup

namespace LRA.Analysis.Sequences

/--
`IsClusterValueOf` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), GT.gt ε 0 → ∀ (N : Nat), Exists fun n => (GE.ge n N ∧ Real.instLT.lt (abs (instHSub.hSub (x n) L)) ε)

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε)

Logical form (Lean):

```lean
def IsClusterValueOf (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∀ N : ℕ, ∃ n ≥ N, |x n - L| < ε
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
def IsClusterValueOf (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∀ N : ℕ, ∃ n ≥ N, |x n - L| < ε

/--
`ClusterValuesAreSubsequentialLimits` TODO

Predicate logic:

  IsClusterValueOf x L ↔ IsSubsequentialLimit x L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) ↔ Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε)

Logical form (Lean):

```lean
theorem ClusterValuesAreSubsequentialLimits {x : RealSequence} {L : ℝ} :
    IsClusterValueOf x L ↔ IsSubsequentialLimit x L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem ClusterValuesAreSubsequentialLimits {x : RealSequence} {L : ℝ} :
    IsClusterValueOf x L ↔ IsSubsequentialLimit x L := by
  sorry

/--
`BoundedSequencesHaveClusterValues` TODO

Predicate logic:

  ∃ L ∈ ℝ, IsClusterValueOf x L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε)

Logical form (Lean):

```lean
theorem BoundedSequencesHaveClusterValues {x : RealSequence}
    (h : BoundedSeq x) : ∃ L : ℝ, IsClusterValueOf x L
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
theorem BoundedSequencesHaveClusterValues {x : RealSequence}
    (h : BoundedSeq x) : ∃ L : ℝ, IsClusterValueOf x L := by
  sorry

/--
`LimsupLiminfExtremalClusterValues` TODO

Predicate logic:

  (IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧ (IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {S I : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) S))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) I))) ε) → ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) S))) ε) ∧ ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε)) → Real.instLE.1 L S) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) I))) ε) ∧ ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → ∀ (N : Nat), Exists fun n => (instLENat.1 N n ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε)) → Real.instLE.1 I L))

Logical form (Lean):

```lean
theorem LimsupLiminfExtremalClusterValues {x : RealSequence}
    (hbdd : BoundedSeq x) {S I : ℝ} (hS : LimsupSeq x S) (hI : LiminfSeq x I) :
    (IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧
    (IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem LimsupLiminfExtremalClusterValues {x : RealSequence}
    (hbdd : BoundedSeq x) {S I : ℝ} (hS : LimsupSeq x S) (hI : LiminfSeq x I) :
    (IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧
    (IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L) := by
  sorry

end LRA.Analysis.Sequences
