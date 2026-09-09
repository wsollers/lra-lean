
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

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (m : Nat), ((Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ Exists fun L => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.MTail x m) L) ∧ (∀ (L : Real), LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.MTail x m) L))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    x : RealSequence
    m : ℕ
  Prove
    ((Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ Exists fun L => LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.MTail x m) L) ∧ (∀ (L : Real), LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.MTail x m) L))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} {a : LRA.Analysis.Sequences.RealSequence}, ((∀ (n : Nat), Real.instLT.lt 0 (a n)) ∧ (LRA.Analysis.Sequences.ConvergesTo a 0 ∧ (Exists fun c => (GT.gt c 0 ∧ (Exists fun m => ∀ (n : Nat), GE.ge n m → Real.instLE.le (abs (instHSub.hSub (x n) L)) (instHMul.hMul c (a n))))))) → LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    a : RealSequence
    ha_null : ConvergesTo a 0
  Prove
    ((∀ (n : Nat), Real.instLT.lt 0 (a n)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (a n) 0)) ε) ∧ (Exists fun c => (Real.instLT.lt 0 c ∧ (Exists fun m => ∀ (n : Nat), instLENat.le m n → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul c (a n))))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (∀ (n : Nat), Real.instLT.lt 0 (x n)) → ∀ {L : Real}, (LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv (x (instHAdd.hAdd n 1)) (x n)) L ∧ Real.instLT.lt L 1) → LRA.Analysis.Sequences.ConvergesTo x 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    hratio : ConvergesTo (fun n => x (n + 1) / x n) L
  Prove
    (∀ (n : Nat), Real.instLT.lt 0 (x n)) → ∀ {L : Real}, ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) n) L)) ε) ∧ Real.instLT.lt L 1) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) 0)) ε

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
