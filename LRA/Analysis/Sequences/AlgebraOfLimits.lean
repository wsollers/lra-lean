
import Mathlib.Order.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Polynomial.Eval.Defs
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Limits

namespace LRA.Analysis.Sequences

/--
`PointwiseSum` TODO

Predicate logic:

  def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n

Predicate logic (unfolded):

  def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n
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
def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n

/--
`PointwiseDifference` TODO

Predicate logic:

  def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n

Predicate logic (unfolded):

  def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n
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
def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n

/--
`ScalarMultiple` TODO

Predicate logic:

  def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n

Predicate logic (unfolded):

  def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n
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
def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n

/--
`LinearCombination` TODO

Predicate logic:

  def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n

Predicate logic (unfolded):

  def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n
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
def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n

/--
`PointwiseNegation` TODO

Predicate logic:

  def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n

Predicate logic (unfolded):

  def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n
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
def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n

/--
`PointwiseProduct` TODO

Predicate logic:

  def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n

Predicate logic (unfolded):

  def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n
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
def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n

/--
`ReciprocalSeq` TODO

Predicate logic:

  noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n

Predicate logic (unfolded):

  noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n
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
noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n

/--
`PointwiseQuotient` TODO

Predicate logic:

  noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n

Predicate logic (unfolded):

  noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n
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
noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n

/--
`SquareSeq` TODO

Predicate logic:

  def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2

Predicate logic (unfolded):

  def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2
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
def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2

/--
`AbsSeq` TODO

Predicate logic:

  def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n|

Predicate logic (unfolded):

  def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n| (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n|
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
def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n|

/--
`SqrtSeq` TODO

Predicate logic:

  noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n)

Predicate logic (unfolded):

  noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n)
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
noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n)

/--
`LimitOfScalarMultiple` TODO

Predicate logic:

  ConvergesTo (ScalarMultiple α x) (α * L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L α : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHMul.hMul α (x n)) (instHMul.1 α L)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.ScalarMultiple α x n) (instHMul.hMul α L)))) ε

Logical form (Lean):

```lean
theorem LimitOfScalarMultiple {x : RealSequence} {L α : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (ScalarMultiple α x) (α * L)
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
theorem LimitOfScalarMultiple {x : RealSequence} {L α : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (ScalarMultiple α x) (α * L) := by
  sorry

/--
`LimitOfASum` TODO

Predicate logic:

  ConvergesTo (PointwiseSum x y) (L + M)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) M) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) M))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHAdd.hAdd (x n) (y n)) (instHAdd.1 L M)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.PointwiseSum x y n) (instHAdd.hAdd L M)))) ε

Logical form (Lean):

```lean
theorem LimitOfASum {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseSum x y) (L + M)
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
theorem LimitOfASum {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseSum x y) (L + M) := by
  sorry

/--
`LimitOfANegation` TODO

Predicate logic:

  ConvergesTo (PointwiseNegation x) (-L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Real.instNeg.neg (x n)) (Real.instNeg.1 L)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.PointwiseNegation x n) (Real.instNeg.neg L)))) ε

Logical form (Lean):

```lean
theorem LimitOfANegation {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (PointwiseNegation x) (-L)
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
theorem LimitOfANegation {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (PointwiseNegation x) (-L) := by
  sorry

/--
`LimitOfADifference` TODO

Predicate logic:

  ConvergesTo (PointwiseDifference x y) (L - M)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) M) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) M))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHSub.hSub (x n) (y n)) (instHSub.1 L M)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.PointwiseDifference x y n) (instHSub.hSub L M)))) ε

Logical form (Lean):

```lean
theorem LimitOfADifference {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseDifference x y) (L - M)
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
theorem LimitOfADifference {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseDifference x y) (L - M) := by
  sorry

/--
`LimitOfAProduct` TODO

Predicate logic:

  ConvergesTo (PointwiseProduct x y) (L * M)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) M) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) M))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHMul.hMul (x n) (y n)) (instHMul.1 L M)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.PointwiseProduct x y n) (instHMul.hMul L M)))) ε

Logical form (Lean):

```lean
theorem LimitOfAProduct {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseProduct x y) (L * M)
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
theorem LimitOfAProduct {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseProduct x y) (L * M) := by
  sorry

/--
`NonzeroLimitEventuallyNonzero` TODO

Predicate logic:

  ∃ N ∈ ℕ, ∀ n ≥ N, x n ≠ 0

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (L = Zero.toOfNat0.1 → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → Exists fun N => ∀ (n : Nat), instLENat.1 N n → x n = Zero.toOfNat0.1 → False

Logical form (Lean):

```lean
theorem NonzeroLimitEventuallyNonzero {x : RealSequence} {L : ℝ}
    (hL : L ≠ 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, x n ≠ 0
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
theorem NonzeroLimitEventuallyNonzero {x : RealSequence} {L : ℝ}
    (hL : L ≠ 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, x n ≠ 0 := by
  sorry

/--
`LimitOfAReciprocal` TODO

Predicate logic:

  (∀ n, x n ≠ 0) → ConvergesTo (ReciprocalSeq x) (1 / L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), x n = Zero.toOfNat0.1 → False) → ∀ {L : Real}, (L = Zero.toOfNat0.1 → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv 1 (x n)) (instHDiv.1 1 L)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.ReciprocalSeq x n) (instHDiv.hDiv 1 L)))) ε

Logical form (Lean):

```lean
theorem LimitOfAReciprocal {x : RealSequence} (hx : ∀ n, x n ≠ 0)
    {L : ℝ} (hL : L ≠ 0) (h : ConvergesTo x L) :
    ConvergesTo (ReciprocalSeq x) (1 / L)
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
theorem LimitOfAReciprocal {x : RealSequence} (hx : ∀ n, x n ≠ 0)
    {L : ℝ} (hL : L ≠ 0) (h : ConvergesTo x L) :
    ConvergesTo (ReciprocalSeq x) (1 / L) := by
  sorry

/--
`LimitOfAQuotient` TODO

Predicate logic:

  (∀ n, y n ≠ 0) → ConvergesTo (PointwiseQuotient x y) (L / M)

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), y n = Zero.toOfNat0.1 → False) → ∀ {L M : Real}, (M = Zero.toOfNat0.1 → False ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) M) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) M))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (x n) (y n)) (instHDiv.1 L M)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.PointwiseQuotient x y n) (instHDiv.hDiv L M)))) ε

Logical form (Lean):

```lean
theorem LimitOfAQuotient {x y : RealSequence} (hy : ∀ n, y n ≠ 0)
    {L M : ℝ} (hM : M ≠ 0) (hx : ConvergesTo x L) (hy' : ConvergesTo y M) :
    ConvergesTo (PointwiseQuotient x y) (L / M)
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
theorem LimitOfAQuotient {x y : RealSequence} (hy : ∀ n, y n ≠ 0)
    {L M : ℝ} (hM : M ≠ 0) (hx : ConvergesTo x L) (hy' : ConvergesTo y M) :
    ConvergesTo (PointwiseQuotient x y) (L / M) := by
  sorry

/--
`LimitOfASquare` TODO

Predicate logic:

  ConvergesTo (SquareSeq x) (L ^ 2)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHPow.hPow (x n) 2) (instHPow.1 L 2)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.SquareSeq x n) (instHPow.hPow L 2)))) ε

Logical form (Lean):

```lean
theorem LimitOfASquare {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (SquareSeq x) (L ^ 2)
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
theorem LimitOfASquare {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (SquareSeq x) (L ^ 2) := by
  sorry

/--
`LimitOfAnAbsoluteValue` TODO

Predicate logic:

  ConvergesTo (AbsSeq x) |L|

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (abs (x n)) (SemilatticeSup.toMax.max L (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg L))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.AbsSeq x n) (abs L)))) ε

Logical form (Lean):

```lean
theorem LimitOfAnAbsoluteValue {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (AbsSeq x) |L|
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
theorem LimitOfAnAbsoluteValue {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (AbsSeq x) |L| := by
  sorry

/--
`PositiveLimitEventuallyPositive` TODO

Predicate logic:

  ∃ N ∈ ℕ, ∀ n ≥ N, 0 < x n

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (Real.instLT.1 Zero.toOfNat0.1 L ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 Zero.toOfNat0.1 (x n)

Logical form (Lean):

```lean
theorem PositiveLimitEventuallyPositive {x : RealSequence} {L : ℝ}
    (hL : L > 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, 0 < x n
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
theorem PositiveLimitEventuallyPositive {x : RealSequence} {L : ℝ}
    (hL : L > 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, 0 < x n := by
  sorry

/--
`LimitOfASquareRoot` TODO

Predicate logic:

  (∀ n, 0 ≤ x n) → 0 ≤ L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Real.instLE.1 Zero.toOfNat0.1 (x n)) → ∀ {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → (Real.instLE.1 Zero.toOfNat0.1 L ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n).sqrt L.sqrt) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.SqrtSeq x n) L.sqrt))) ε)

Logical form (Lean):

```lean
theorem LimitOfASquareRoot {x : RealSequence} (hx : ∀ n, 0 ≤ x n)
    {L : ℝ} (h : ConvergesTo x L) :
    0 ≤ L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L)
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
theorem LimitOfASquareRoot {x : RealSequence} (hx : ∀ n, 0 ≤ x n)
    {L : ℝ} (h : ConvergesTo x L) :
    0 ≤ L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L) := by
  sorry

/--
`PolynomialSequenceLimit` TODO

Predicate logic:

  ConvergesTo (fun n => p.eval (x n)) (p.eval L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} (p : Polynomial Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => Polynomial.eval₂ (RingHom.id Real) (x n) p) n) (Polynomial.eval₂ (RingHom.id Real) L p)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => Polynomial.eval (x n) p) n) (Polynomial.eval L p)))) ε

Logical form (Lean):

```lean
theorem PolynomialSequenceLimit {x : RealSequence} {L : ℝ}
    (p : Polynomial ℝ) (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n)) (p.eval L)
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
theorem PolynomialSequenceLimit {x : RealSequence} {L : ℝ}
    (p : Polynomial ℝ) (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n)) (p.eval L) := by
  sorry

/--
`RationalSequenceLimit` TODO

Predicate logic:

  (∀ n, q.eval (x n) ≠ 0) → ConvergesTo (fun n => p.eval (x n) / q.eval (x n)) (p.eval L / q.eval L)

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} (p q : Polynomial Real), (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } L q = Zero.toOfNat0.1 → False ∧ (∀ (n : Nat), Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } (x n) q = Zero.toOfNat0.1 → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 (Polynomial.eval (x n) p) (Polynomial.eval (x n) q)) n) (instHDiv.1 (Polynomial.eval L p) (Polynomial.eval L q))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv (Polynomial.eval (x n) p) (Polynomial.eval (x n) q)) n) (instHDiv.hDiv (Polynomial.eval L p) (Polynomial.eval L q))))) ε

Logical form (Lean):

```lean
theorem RationalSequenceLimit {x : RealSequence} {L : ℝ}
    (p q : Polynomial ℝ) (hqL : q.eval L ≠ 0) (hqx : ∀ n, q.eval (x n) ≠ 0)
    (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n) / q.eval (x n)) (p.eval L / q.eval L)
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
theorem RationalSequenceLimit {x : RealSequence} {L : ℝ}
    (p q : Polynomial ℝ) (hqL : q.eval L ≠ 0) (hqx : ∀ n, q.eval (x n) ≠ 0)
    (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n) / q.eval (x n)) (p.eval L / q.eval L) := by
  sorry

end LRA.Analysis.Sequences
