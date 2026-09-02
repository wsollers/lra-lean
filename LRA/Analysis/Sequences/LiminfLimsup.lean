
import Mathlib.Order.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/--
`TailSupSeq` TODO

Predicate logic:

  noncomputable def TailSupSeq (x : RealSequence) (h : BoundedAboveSeq x) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})

Predicate logic (unfolded):

  noncomputable def TailSupSeq (x : RealSequence) (h : BoundedAboveSeq x) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k}) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TailSupSeq (x : RealSequence) (h : BoundedAboveSeq x) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})
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
noncomputable def TailSupSeq (x : RealSequence) (h : BoundedAboveSeq x) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})

/--
`TailInfSeq` TODO

Predicate logic:

  noncomputable def TailInfSeq (x : RealSequence) (h : BoundedBelowSeq x) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})

Predicate logic (unfolded):

  noncomputable def TailInfSeq (x : RealSequence) (h : BoundedBelowSeq x) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k}) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TailInfSeq (x : RealSequence) (h : BoundedBelowSeq x) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})
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
noncomputable def TailInfSeq (x : RealSequence) (h : BoundedBelowSeq x) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})

/--
`LimsupSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), Exists fun h => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.TailSupSeq x h) L

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Real.instSupSet.sSup (Set.image x (setOf fun k => instLENat.le n k))) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) L))) ε

Logical form (Lean):

```lean
def LimsupSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedAboveSeq x, ConvergesTo (TailSupSeq x h) L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def LimsupSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedAboveSeq x, ConvergesTo (TailSupSeq x h) L

/--
`LiminfSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), Exists fun h => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.TailInfSeq x h) L

Predicate logic (unfolded):

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Real.instInfSet.sInf (Set.image x (setOf fun k => instLENat.le n k))) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) L))) ε

Logical form (Lean):

```lean
def LiminfSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedBelowSeq x, ConvergesTo (TailInfSeq x h) L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def LiminfSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedBelowSeq x, ConvergesTo (TailInfSeq x h) L

/--
`TailSupremaAreDecreasing` TODO

Predicate logic:

  IsDecreasing (TailSupSeq x h)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => ∀ (n : Nat), Real.instLE.1 (x n) M) → ∀ (n : Nat), Real.instLE.1 (Real.instSupSet.1 fun x_1 => Exists fun a => (Set.instMembership.mem (setOf fun k => instLENat.le (instHAdd.hAdd n 1) k) a ∧ x a = x_1)) (Real.instSupSet.1 fun x_1 => Exists fun a => (Set.instMembership.mem (setOf fun k => instLENat.le n k) a ∧ x a = x_1))

Logical form (Lean):

```lean
theorem TailSupremaAreDecreasing {x : RealSequence} (h : BoundedAboveSeq x) :
    IsDecreasing (TailSupSeq x h)
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
theorem TailSupremaAreDecreasing {x : RealSequence} (h : BoundedAboveSeq x) :
    IsDecreasing (TailSupSeq x h) := by
  sorry
/--
`TailInfimaAreIncreasing` TODO

Predicate logic:

  IsIncreasing (TailInfSeq x h)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun m => ∀ (n : Nat), Real.instLE.1 m (x n)) → ∀ (n : Nat), Real.instLE.1 (Real.instInfSet.1 fun x_1 => Exists fun a => (Set.instMembership.mem (setOf fun k => instLENat.le n k) a ∧ x a = x_1)) (Real.instInfSet.1 fun x_1 => Exists fun a => (Set.instMembership.mem (setOf fun k => instLENat.le (instHAdd.hAdd n 1) k) a ∧ x a = x_1))

Logical form (Lean):

```lean
theorem TailInfimaAreIncreasing {x : RealSequence} (h : BoundedBelowSeq x) :
    IsIncreasing (TailInfSeq x h)
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
theorem TailInfimaAreIncreasing {x : RealSequence} (h : BoundedBelowSeq x) :
    IsIncreasing (TailInfSeq x h) := by
  sorry
/--
`LiminfBelowLimsup` TODO

Predicate logic:

  I ≤ S

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {I S : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) I))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) S))) ε) → Real.instLE.1 I S

Logical form (Lean):

```lean
theorem LiminfBelowLimsup {x : RealSequence} (hbdd : BoundedSeq x)
    {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) : I ≤ S
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
theorem LiminfBelowLimsup {x : RealSequence} (hbdd : BoundedSeq x)
    {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) : I ≤ S := by
  sorry
/--
`ConvergenceIffLiminfEqualsLimsup` TODO

Predicate logic:

  ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {L : Real}, ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ↔ (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) L))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) L))) ε)

Logical form (Lean):

```lean
theorem ConvergenceIffLiminfEqualsLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {L : ℝ} :
    ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem ConvergenceIffLiminfEqualsLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {L : ℝ} :
    ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L) := by
  sorry
/--
`LimsupLargestSubsequentialLimit` TODO

Predicate logic:

  IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {S : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) S))) ε) → (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) S))) ε) ∧ ∀ (L : Real), (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε)) → Real.instLE.1 L S)

Logical form (Lean):

```lean
theorem LimsupLargestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {S : ℝ} (hS : LimsupSeq x S) :
    IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S
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
theorem LimsupLargestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {S : ℝ} (hS : LimsupSeq x S) :
    IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S := by
  sorry
/--
`LiminfSmallestSubsequentialLimit` TODO

Predicate logic:

  IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {I : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) I))) ε) → (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) I))) ε) ∧ ∀ (L : Real), (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε)) → Real.instLE.1 I L)

Logical form (Lean):

```lean
theorem LiminfSmallestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {I : ℝ} (hI : LiminfSeq x I) :
    IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L
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
theorem LiminfSmallestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {I : ℝ} (hI : LiminfSeq x I) :
    IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L := by
  sorry
/--
`OscillationCriterionViaLiminfLimsup` TODO

Predicate logic:

  I < S ↔ ∃ L K ∈ ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)) → ∀ {I S : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) I) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) I))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) S) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) S))) ε) → Real.instLT.1 I S ↔ Exists fun L => Exists fun K => (L = K → False ∧ (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε) ∧ Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) K) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) K))) ε)))

Logical form (Lean):

```lean
theorem OscillationCriterionViaLiminfLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) :
    I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem OscillationCriterionViaLiminfLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) :
    I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry
/--
`LimsupComparisonUnderEventualOrder` TODO

Predicate logic:

  (∃ N ∈ ℕ, ∀ n ≥ N, x n ≤ y n) → Sx ≤ Sy

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (y n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (y n))) M) ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLE.1 (x n) (y n))) → ∀ {Sx Sy : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) Sx) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) Sx))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq y h n) Sy) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq y h n) Sy))) ε) → Real.instLE.1 Sx Sy

Logical form (Lean):

```lean
theorem LimsupComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Sx Sy : ℝ}
    (hSx : LimsupSeq x Sx) (hSy : LimsupSeq y Sy) : Sx ≤ Sy
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
theorem LimsupComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Sx Sy : ℝ}
    (hSx : LimsupSeq x Sx) (hSy : LimsupSeq y Sy) : Sx ≤ Sy := by
  sorry
/--
`LiminfComparisonUnderEventualOrder` TODO

Predicate logic:

  (∃ N ∈ ℕ, ∀ n ≥ N, x n ≤ y n) → Ix ≤ Iy

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (y n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (y n))) M) ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLE.1 (x n) (y n))) → ∀ {Ix Iy : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) Ix) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) Ix))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq y h n) Iy) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq y h n) Iy))) ε) → Real.instLE.1 Ix Iy

Logical form (Lean):

```lean
theorem LiminfComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Ix Iy : ℝ}
    (hIx : LiminfSeq x Ix) (hIy : LiminfSeq y Iy) : Ix ≤ Iy
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
theorem LiminfComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Ix Iy : ℝ}
    (hIx : LiminfSeq x Ix) (hIy : LiminfSeq y Iy) : Ix ≤ Iy := by
  sorry
/--
`LimsupSqueezeUnderEventualOrder` TODO

Predicate logic:

  (∃ N ∈ ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n) → Sa ≤ Sx ∧ Sx ≤ Sb

Predicate logic (unfolded):

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (a n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (a n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (b n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (b n))) M) ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → (Real.instLE.1 (a n) (x n) ∧ Real.instLE.1 (x n) (b n))))) → ∀ {Sa Sx Sb : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq a h n) Sa) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq a h n) Sa))) ε ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) Sx) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) Sx))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq b h n) Sb) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq b h n) Sb))) ε)) → (Real.instLE.1 Sa Sx ∧ Real.instLE.1 Sx Sb)

Logical form (Lean):

```lean
theorem LimsupSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Sa Sx Sb : ℝ} (hSa : LimsupSeq a Sa) (hSx : LimsupSeq x Sx)
    (hSb : LimsupSeq b Sb) : Sa ≤ Sx ∧ Sx ≤ Sb
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem LimsupSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Sa Sx Sb : ℝ} (hSa : LimsupSeq a Sa) (hSx : LimsupSeq x Sx)
    (hSb : LimsupSeq b Sb) : Sa ≤ Sx ∧ Sx ≤ Sb := by
  sorry
/--
`LiminfSqueezeUnderEventualOrder` TODO

Predicate logic:

  (∃ N ∈ ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n) → Ia ≤ Ix ∧ Ix ≤ Ib

Predicate logic (unfolded):

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (a n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (a n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (b n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (b n))) M) ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → (Real.instLE.1 (a n) (x n) ∧ Real.instLE.1 (x n) (b n))))) → ∀ {Ia Ix Ib : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq a h n) Ia) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq a h n) Ia))) ε ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) Ix) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) Ix))) ε ∧ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq b h n) Ib) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq b h n) Ib))) ε)) → (Real.instLE.1 Ia Ix ∧ Real.instLE.1 Ix Ib)

Logical form (Lean):

```lean
theorem LiminfSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Ia Ix Ib : ℝ} (hIa : LiminfSeq a Ia) (hIx : LiminfSeq x Ix)
    (hIb : LiminfSeq b Ib) : Ia ≤ Ix ∧ Ix ≤ Ib
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem LiminfSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Ia Ix Ib : ℝ} (hIa : LiminfSeq a Ia) (hIx : LiminfSeq x Ix)
    (hIb : LiminfSeq b Ib) : Ia ≤ Ix ∧ Ix ≤ Ib := by
  sorry
/--
`LimsupNegEqNegLiminf` TODO

Predicate logic:

  LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq (fun n => Real.instNeg.neg (x n)) h n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq (fun n => Real.instNeg.neg (x n)) h n) L))) ε ↔ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq x h n) (Real.instNeg.neg L)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq x h n) (Real.instNeg.neg L)))) ε

Logical form (Lean):

```lean
theorem LimsupNegEqNegLiminf {x : RealSequence} {L : ℝ} :
    LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L)
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
theorem LimsupNegEqNegLiminf {x : RealSequence} {L : ℝ} :
    LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L) := by
  sorry
/--
`LiminfNegEqNegLimsup` TODO

Predicate logic:

  LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailInfSeq (fun n => Real.instNeg.neg (x n)) h n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailInfSeq (fun n => Real.instNeg.neg (x n)) h n) L))) ε ↔ Exists fun h => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.TailSupSeq x h n) (Real.instNeg.neg L)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Sequences.TailSupSeq x h n) (Real.instNeg.neg L)))) ε

Logical form (Lean):

```lean
theorem LiminfNegEqNegLimsup {x : RealSequence} {L : ℝ} :
    LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L)
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
theorem LiminfNegEqNegLimsup {x : RealSequence} {L : ℝ} :
    LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L) := by
  sorry
end LRA.Analysis.Sequences
