
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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L α : Real}, LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.ScalarMultiple α x) (instHMul.hMul α L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L α : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul α L))) ε

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.ConvergesTo y M) → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.PointwiseSum x y) (instHAdd.hAdd L M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L M : ℝ
    hx : ConvergesTo x L
    hy : ConvergesTo y M
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) M)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) (y n)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd L M))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.PointwiseNegation x) (Real.instNeg.neg L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Real.instNeg.neg (x n)) (Real.instNeg.neg L))) ε

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.ConvergesTo y M) → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.PointwiseDifference x y) (instHSub.hSub L M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L M : ℝ
    hx : ConvergesTo x L
    hy : ConvergesTo y M
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) M)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) (y n)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub L M))) ε

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.ConvergesTo y M) → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.PointwiseProduct x y) (instHMul.hMul L M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L M : ℝ
    hx : ConvergesTo x L
    hy : ConvergesTo y M
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) M)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul (x n) (y n)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L M))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (Ne L 0 ∧ LRA.Analysis.Sequences.ConvergesTo x L) → Exists fun N => ∀ (n : Nat), GE.ge n N → Ne (x n) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    hL : L ≠ 0
    h : ConvergesTo x L
  Prove
    ((L = 0 → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → Exists fun N => ∀ (n : Nat), instLENat.le N n → x n = 0 → False

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Ne (x n) 0) → ∀ {L : Real}, (Ne L 0 ∧ LRA.Analysis.Sequences.ConvergesTo x L) → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.ReciprocalSeq x) (instHDiv.hDiv 1 L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    hL : L ≠ 0
    h : ConvergesTo x L
  Prove
    (∀ (n : Nat), x n = 0 → False) → ∀ {L : Real}, ((L = 0 → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (x n)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 L))) ε

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

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Ne (y n) 0) → ∀ {L M : Real}, (Ne M 0 ∧ (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.ConvergesTo y M)) → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.PointwiseQuotient x y) (instHDiv.hDiv L M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L M : ℝ
    hM : M ≠ 0
    hx : ConvergesTo x L
    hy' : ConvergesTo y M
  Prove
    (∀ (n : Nat), y n = 0 → False) → ∀ {L M : Real}, ((M = 0 → False) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) M)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (x n) (y n)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv L M))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.SquareSeq x) (instHPow.hPow L 2)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (instHPow.1 (x n) 2) (instHPow.1 L 2))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.AbsSeq x) (abs L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (abs (x n)) (abs L))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (GT.gt L 0 ∧ LRA.Analysis.Sequences.ConvergesTo x L) → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt 0 (x n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    hL : L > 0
    h : ConvergesTo x L
  Prove
    (Real.instLT.lt 0 L ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt 0 (x n)

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Real.instLE.le 0 (x n)) → ∀ {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L → (Real.instLE.le 0 L ∧ LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.SqrtSeq x) L.sqrt)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (n : Nat), Real.instLE.le 0 (x n)) → ∀ {L : Real}, (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → (Real.instLE.le 0 L ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n).sqrt L.sqrt)) ε))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} (p : Polynomial Real), LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (fun n => Polynomial.eval (x n) p) (Polynomial.eval L p)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    p : Polynomial ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } (x n) p) n) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } L p))) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} (p q : Polynomial Real), (Ne (Polynomial.eval L q) 0 ∧ ((∀ (n : Nat), Ne (Polynomial.eval (x n) q) 0) ∧ LRA.Analysis.Sequences.ConvergesTo x L)) → LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv (Polynomial.eval (x n) p) (Polynomial.eval (x n) q)) (instHDiv.hDiv (Polynomial.eval L p) (Polynomial.eval L q))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    p q : Polynomial ℝ
    hqL : q.eval L ≠ 0
    h : ConvergesTo x L
  Prove
    ((Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } L q = 0 → False) ∧ ((∀ (n : Nat), Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } (x n) q = 0 → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } (x n) p) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } (x n) q)) n) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } L p) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } L q)))) ε

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
