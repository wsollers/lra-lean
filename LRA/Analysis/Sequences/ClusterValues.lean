
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.IsClusterValueOf x L ↔ LRA.Analysis.Sequences.IsSubsequentialLimit x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.IsClusterValueOf x L ↔ LRA.Analysis.Sequences.IsSubsequentialLimit x L

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → Exists fun L => LRA.Analysis.Sequences.IsClusterValueOf x L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedSeq x
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {S I : Real}, (LRA.Analysis.Sequences.LimsupSeq x S ∧ LRA.Analysis.Sequences.LiminfSeq x I) → ((LRA.Analysis.Sequences.IsClusterValueOf x S ∧ (∀ (L : Real), LRA.Analysis.Sequences.IsClusterValueOf x L → Real.instLE.le L S)) ∧ (LRA.Analysis.Sequences.IsClusterValueOf x I ∧ (∀ (L : Real), LRA.Analysis.Sequences.IsClusterValueOf x L → Real.instLE.le I L)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    S I : ℝ
    hS : LimsupSeq x S
    hI : LiminfSeq x I
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ∀ {S I : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) S)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) I)) ε)) → (((∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) S)) ε)) ∧ (∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → Real.instLE.le L S)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) I)) ε)) ∧ (∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → ∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → Real.instLE.le I L)))

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
