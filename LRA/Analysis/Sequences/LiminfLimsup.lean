
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) L)) ε

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) L)) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} (h : LRA.Analysis.Sequences.BoundedAboveSeq x), LRA.Analysis.Sequences.IsDecreasing (LRA.Analysis.Sequences.TailSupSeq x h)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedAboveSeq x
  Prove
    (Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M) → ∀ (n : Nat), Real.instLE.le (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le (instHAdd.hAdd n 1) k ∧ x a = x_1)) (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} (h : LRA.Analysis.Sequences.BoundedBelowSeq x), LRA.Analysis.Sequences.IsIncreasing (LRA.Analysis.Sequences.TailInfSeq x h)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedBelowSeq x
  Prove
    (Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)) → ∀ (n : Nat), Real.instLE.le (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le (instHAdd.hAdd n 1) k ∧ x a = x_1))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {I S : Real}, (LRA.Analysis.Sequences.LiminfSeq x I ∧ LRA.Analysis.Sequences.LimsupSeq x S) → Real.instLE.le I S

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    I S : ℝ
    hI : LiminfSeq x I
    hS : LimsupSeq x S
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ∀ {I S : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) I)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) S)) ε)) → Real.instLE.le I S

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L ↔ (LRA.Analysis.Sequences.LiminfSeq x L ∧ LRA.Analysis.Sequences.LimsupSeq x L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    L : ℝ
  Prove
    LRA.Analysis.Sequences.BoundedSeq x → ∀ {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L ↔ (LRA.Analysis.Sequences.LiminfSeq x L ∧ LRA.Analysis.Sequences.LimsupSeq x L)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {S : Real}, LRA.Analysis.Sequences.LimsupSeq x S → (LRA.Analysis.Sequences.IsSubsequentialLimit x S ∧ (∀ (L : Real), LRA.Analysis.Sequences.IsSubsequentialLimit x L → Real.instLE.le L S))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    S : ℝ
    hS : LimsupSeq x S
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ∀ {S : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) S)) ε) → ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) S)) ε))) ∧ (∀ (L : Real), (Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) → Real.instLE.le L S))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {I : Real}, LRA.Analysis.Sequences.LiminfSeq x I → (LRA.Analysis.Sequences.IsSubsequentialLimit x I ∧ (∀ (L : Real), LRA.Analysis.Sequences.IsSubsequentialLimit x L → Real.instLE.le I L))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    I : ℝ
    hI : LiminfSeq x I
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → ∀ {I : Real}, (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) I)) ε) → ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) I)) ε))) ∧ (∀ (L : Real), (Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) → Real.instLE.le I L))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → ∀ {I S : Real}, (LRA.Analysis.Sequences.LiminfSeq x I ∧ LRA.Analysis.Sequences.LimsupSeq x S) → Real.instLT.lt I S ↔ Exists fun L => Exists fun K => (Ne L K ∧ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x K))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
    I S : ℝ
    hI : LiminfSeq x I
    hS : LimsupSeq x S
  Prove
    LRA.Analysis.Sequences.BoundedSeq x → ∀ {I S : Real}, (LRA.Analysis.Sequences.LiminfSeq x I ∧ LRA.Analysis.Sequences.LimsupSeq x S) → Real.instLT.lt I S ↔ Exists fun L => Exists fun K => (Ne L K ∧ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x K))

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.BoundedSeq x ∧ (LRA.Analysis.Sequences.BoundedSeq y ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLE.le (x n) (y n)))) → ∀ {Sx Sy : Real}, (LRA.Analysis.Sequences.LimsupSeq x Sx ∧ LRA.Analysis.Sequences.LimsupSeq y Sy) → Real.instLE.le Sx Sy

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    hx : BoundedSeq x
    hy : BoundedSeq y
    Sx Sy : ℝ
    hSx : LimsupSeq x Sx
    hSy : LimsupSeq y Sy
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (y n)) M))) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (y n)))) → ∀ {Sx Sy : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) Sx)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ y a = x)) Sy)) ε)) → Real.instLE.le Sx Sy

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.BoundedSeq x ∧ (LRA.Analysis.Sequences.BoundedSeq y ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLE.le (x n) (y n)))) → ∀ {Ix Iy : Real}, (LRA.Analysis.Sequences.LiminfSeq x Ix ∧ LRA.Analysis.Sequences.LiminfSeq y Iy) → Real.instLE.le Ix Iy

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    hx : BoundedSeq x
    hy : BoundedSeq y
    Ix Iy : ℝ
    hIx : LiminfSeq x Ix
    hIy : LiminfSeq y Iy
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (y n)) M))) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (y n)))) → ∀ {Ix Iy : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) Ix)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ y a = x)) Iy)) ε)) → Real.instLE.le Ix Iy

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

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.BoundedSeq a ∧ (LRA.Analysis.Sequences.BoundedSeq x ∧ (LRA.Analysis.Sequences.BoundedSeq b ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n)))))) → ∀ {Sa Sx Sb : Real}, (LRA.Analysis.Sequences.LimsupSeq a Sa ∧ (LRA.Analysis.Sequences.LimsupSeq x Sx ∧ LRA.Analysis.Sequences.LimsupSeq b Sb)) → (Real.instLE.le Sa Sx ∧ Real.instLE.le Sx Sb)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a x b : RealSequence
    ha : BoundedSeq a
    hx : BoundedSeq x
    hb : BoundedSeq b
    Sa Sx Sb : ℝ
    hSa : LimsupSeq a Sa
    hSx : LimsupSeq x Sx
    hSb : LimsupSeq b Sb
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (a n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (b n)) M))) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n)))))) → ∀ {Sa Sx Sb : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x => Exists fun a_4 => (a_4 ∈ setOf fun k => instLENat.le n k ∧ a a_4 = x)) Sa)) ε) ∧ ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) Sx)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instSupSet.1 fun x => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ b a = x)) Sb)) ε))) → (Real.instLE.le Sa Sx ∧ Real.instLE.le Sx Sb)

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

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.BoundedSeq a ∧ (LRA.Analysis.Sequences.BoundedSeq x ∧ (LRA.Analysis.Sequences.BoundedSeq b ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n)))))) → ∀ {Ia Ix Ib : Real}, (LRA.Analysis.Sequences.LiminfSeq a Ia ∧ (LRA.Analysis.Sequences.LiminfSeq x Ix ∧ LRA.Analysis.Sequences.LiminfSeq b Ib)) → (Real.instLE.le Ia Ix ∧ Real.instLE.le Ix Ib)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a x b : RealSequence
    ha : BoundedSeq a
    hx : BoundedSeq x
    hb : BoundedSeq b
    Ia Ix Ib : ℝ
    hIa : LiminfSeq a Ia
    hIx : LiminfSeq x Ix
    hIb : LiminfSeq b Ib
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (a n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (b n)) M))) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n)))))) → ∀ {Ia Ix Ib : Real}, ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x => Exists fun a_4 => (a_4 ∈ setOf fun k => instLENat.le n k ∧ a a_4 = x)) Ia)) ε) ∧ ((Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x_1 => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ x a = x_1)) Ix)) ε) ∧ (Exists fun h => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instInfSet.1 fun x => Exists fun a => (a ∈ setOf fun k => instLENat.le n k ∧ b a = x)) Ib)) ε))) → (Real.instLE.le Ia Ix ∧ Real.instLE.le Ix Ib)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.LimsupSeq (fun n => Real.instNeg.neg (x n)) L ↔ LRA.Analysis.Sequences.LiminfSeq x (Real.instNeg.neg L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.LimsupSeq (fun n => Real.instNeg.neg (x n)) L ↔ LRA.Analysis.Sequences.LiminfSeq x (Real.instNeg.neg L)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.LiminfSeq (fun n => Real.instNeg.neg (x n)) L ↔ LRA.Analysis.Sequences.LimsupSeq x (Real.instNeg.neg L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.LiminfSeq (fun n => Real.instNeg.neg (x n)) L ↔ LRA.Analysis.Sequences.LimsupSeq x (Real.instNeg.neg L)

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
