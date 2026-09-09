
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Sequences

/--
`Sequence` TODO

Predicate logic:

  abbrev Sequence (X : Type*) : Type _ := ℕ → X

Predicate logic (unfolded):

  abbrev Sequence (X : Type*) : Type _ := ℕ → X (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Sequence (X : Type*) : Type _ := ℕ → X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev Sequence (X : Type*) : Type _ := ℕ → X

/--
`RealSequence` TODO

Predicate logic:

  abbrev RealSequence : Type := ℕ → ℝ

Predicate logic (unfolded):

  abbrev RealSequence : Type := ℕ → ℝ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RealSequence : Type := ℕ → ℝ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev RealSequence : Type := ℕ → ℝ

/--
`ConvergesTo` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (x n) L)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n - L| < ε
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
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n - L| < ε

/--
`IsDivergent` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), (Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → False

Logical form (Lean):

```lean
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L
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
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L

/--
`DivergesToPosInf` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (M : Real), Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt M (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M (x n)

Logical form (Lean):

```lean
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n
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
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n

/--
`DivergesToNegInf` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (M : Real), Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (x n) M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) M

Logical form (Lean):

```lean
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M
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
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M

/--
`IsOscillatory` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), (LRA.Analysis.Sequences.IsDivergent x ∧ (¬ LRA.Analysis.Sequences.DivergesToPosInf x ∧ ¬ LRA.Analysis.Sequences.DivergesToNegInf x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → False) ∧ (((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M (x n)) → False) ∧ ((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) M) → False)))

Logical form (Lean):

```lean
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x

/--
`ConstantSequenceConverges` TODO

Predicate logic:

  ∀ (c : Real), LRA.Analysis.Sequences.ConvergesTo (fun x => c) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c : ℝ
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => c) n) c)) ε

Logical form (Lean):

```lean
theorem ConstantSequenceConverges (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c
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
theorem ConstantSequenceConverges (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry
/--
`ReciprocalSequenceConvergesToZero` TODO

Predicate logic:

  LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv 1 n.cast) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (Real.instNatCast.1 n)) n) 0)) ε

Logical form (Lean):

```lean
theorem ReciprocalSequenceConvergesToZero :
    ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0
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
theorem ReciprocalSequenceConvergesToZero :
    ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0 := by
  sorry
/--
`NaturalNumberSequenceDiverges` TODO

Predicate logic:

  LRA.Analysis.Sequences.DivergesToPosInf fun n => n.cast

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M ((fun n => Real.instNatCast.1 n) n)

Logical form (Lean):

```lean
theorem NaturalNumberSequenceDiverges :
    DivergesToPosInf (fun n : ℕ => (n : ℝ))
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
theorem NaturalNumberSequenceDiverges :
    DivergesToPosInf (fun n : ℕ => (n : ℝ)) := by
  sorry
end LRA.Analysis.Sequences
