
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

/--
`IsConstant` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (c : Real) (n : Nat), x n = c

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x n = c

Logical form (Lean):

```lean
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c
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
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c

/--
`IsNull` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (x n)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs (x n)) ε

Logical form (Lean):

```lean
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε
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
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε

/--
`IsUltimatelyConstant` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (c : Real), Exists fun N => ∀ (n : Nat), GE.ge n N → x n = c

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → x n = c

Logical form (Lean):

```lean
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c
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
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c

/--
`BoundedAboveSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M

Logical form (Lean):

```lean
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M
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
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M

/--
`BoundedBelowSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)

Logical form (Lean):

```lean
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n
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
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n

/--
`BoundedSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun M => (GT.gt M 0 ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))

Logical form (Lean):

```lean
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M
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
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M

/--
`ConstantSequenceConvergence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsConstant x c → LRA.Analysis.Sequences.ConvergesTo x c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    (∀ (n : Nat), x n = c) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) c)) ε

Logical form (Lean):

```lean
theorem ConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : ConvergesTo x c
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
theorem ConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : ConvergesTo x c := by
  sorry
/--
`ZeroSequenceIsNull` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsConstant x 0 → LRA.Analysis.Sequences.IsNull x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), x n = 0) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs (x n)) ε

Logical form (Lean):

```lean
theorem ZeroSequenceIsNull {x : RealSequence} (h : IsConstant x 0) :
    IsNull x
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
theorem ZeroSequenceIsNull {x : RealSequence} (h : IsConstant x 0) :
    IsNull x := by
  sorry
/--
`ConstantNullSequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsConstant x c → LRA.Analysis.Sequences.IsNull x ↔ c = 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    LRA.Analysis.Sequences.IsConstant x c → LRA.Analysis.Sequences.IsNull x ↔ c = 0

Logical form (Lean):

```lean
theorem ConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0
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
theorem ConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0 := by
  sorry
/--
`DifferenceFromLimitIsNull` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.IsNull fun n => instHSub.hSub (x n) L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.IsNull fun n => instHSub.hSub (x n) L

Logical form (Lean):

```lean
theorem DifferenceFromLimitIsNull (x : RealSequence) (L : ℝ) :
    ConvergesTo x L ↔ IsNull (fun n => x n - L)
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
theorem DifferenceFromLimitIsNull (x : RealSequence) (L : ℝ) :
    ConvergesTo x L ↔ IsNull (fun n => x n - L) := by
  sorry
/--
`UltimatelyConstantSequenceConvergence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsUltimatelyConstant x c → LRA.Analysis.Sequences.ConvergesTo x c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    (Exists fun N => ∀ (n : Nat), instLENat.le N n → x n = c) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) c)) ε

Logical form (Lean):

```lean
theorem UltimatelyConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    ConvergesTo x c
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
theorem UltimatelyConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    ConvergesTo x c := by
  sorry
/--
`ConstantImpliesUltimatelyConstant` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsConstant x c → LRA.Analysis.Sequences.IsUltimatelyConstant x c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    (∀ (n : Nat), x n = c) → Exists fun N => ∀ (n : Nat), instLENat.le N n → x n = c

Logical form (Lean):

```lean
theorem ConstantImpliesUltimatelyConstant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c
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
theorem ConstantImpliesUltimatelyConstant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c := by
  sorry
/--
`UltimatelyZeroSequenceIsNull` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsUltimatelyConstant x 0 → LRA.Analysis.Sequences.IsNull x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (Exists fun N => ∀ (n : Nat), instLENat.le N n → x n = 0) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs (x n)) ε

Logical form (Lean):

```lean
theorem UltimatelyZeroSequenceIsNull {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x
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
theorem UltimatelyZeroSequenceIsNull {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x := by
  sorry
/--
`UltimatelyConstantNullSequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsUltimatelyConstant x c → LRA.Analysis.Sequences.IsNull x ↔ c = 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    LRA.Analysis.Sequences.IsUltimatelyConstant x c → LRA.Analysis.Sequences.IsNull x ↔ c = 0

Logical form (Lean):

```lean
theorem UltimatelyConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0
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
theorem UltimatelyConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0 := by
  sorry
/--
`TailEqualityPreservesConvergence` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → x n = y n) → ∀ (L : Real), LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.ConvergesTo y L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L : ℝ
  Prove
    (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → x n = y n) → ∀ (L : Real), LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.ConvergesTo y L

Logical form (Lean):

```lean
theorem TailEqualityPreservesConvergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    ConvergesTo x L ↔ ConvergesTo y L
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
theorem TailEqualityPreservesConvergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    ConvergesTo x L ↔ ConvergesTo y L := by
  sorry
/--
`EventuallyBoundedAboveTailFormulation` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.BoundedAboveSeq x ↔ Exists fun N₀ => Exists fun M => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (x n) M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.BoundedAboveSeq x ↔ Exists fun N₀ => Exists fun M => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (x n) M

Logical form (Lean):

```lean
theorem EventuallyBoundedAboveTailFormulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M
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
theorem EventuallyBoundedAboveTailFormulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M := by
  sorry
/--
`EventuallyBoundedBelowTailFormulation` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.BoundedBelowSeq x ↔ Exists fun N₀ => Exists fun m => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le m (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.BoundedBelowSeq x ↔ Exists fun N₀ => Exists fun m => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le m (x n)

Logical form (Lean):

```lean
theorem EventuallyBoundedBelowTailFormulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n
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
theorem EventuallyBoundedBelowTailFormulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n := by
  sorry
/--
`EventuallyBoundedTailFormulation` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.BoundedSeq x ↔ Exists fun N₀ => Exists fun M => (GT.gt M 0 ∧ (∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (abs (x n)) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.BoundedSeq x ↔ Exists fun N₀ => Exists fun M => (GT.gt M 0 ∧ (∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (abs (x n)) M))

Logical form (Lean):

```lean
theorem EventuallyBoundedTailFormulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M
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
theorem EventuallyBoundedTailFormulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M := by
  sorry
/--
`BoundedSequenceBoundedAboveBelow` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), LRA.Analysis.Sequences.BoundedSeq x ↔ (LRA.Analysis.Sequences.BoundedAboveSeq x ∧ LRA.Analysis.Sequences.BoundedBelowSeq x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.BoundedSeq x ↔ (LRA.Analysis.Sequences.BoundedAboveSeq x ∧ LRA.Analysis.Sequences.BoundedBelowSeq x)

Logical form (Lean):

```lean
theorem BoundedSequenceBoundedAboveBelow (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x)
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
theorem BoundedSequenceBoundedAboveBelow (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x) := by
  sorry
/--
`AbsoluteBoundUpperLowerBounds` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {K : Real}, (GT.gt K 0 ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) K)) → ∀ (n : Nat), (Real.instLE.le (Real.instNeg.neg K) (x n) ∧ Real.instLE.le (x n) K)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    K : ℝ
    hK : K > 0
  Prove
    (Real.instLT.lt 0 K ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) K)) → ∀ (n : Nat), (Real.instLE.le (Real.instNeg.neg K) (x n) ∧ Real.instLE.le (x n) K)

Logical form (Lean):

```lean
theorem AbsoluteBoundUpperLowerBounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K
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
theorem AbsoluteBoundUpperLowerBounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K := by
  sorry
/--
`UpperLowerBoundsAbsoluteBound` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {m M : Real}, (∀ (n : Nat), (Real.instLE.le m (x n) ∧ Real.instLE.le (x n) M)) → Exists fun K => (GT.gt K 0 ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) K))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    m M : ℝ
  Prove
    (∀ (n : Nat), (Real.instLE.le m (x n) ∧ Real.instLE.le (x n) M)) → Exists fun K => (Real.instLT.lt 0 K ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) K))

Logical form (Lean):

```lean
theorem UpperLowerBoundsAbsoluteBound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K
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
theorem UpperLowerBoundsAbsoluteBound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K := by
  sorry
end LRA.Analysis.Sequences
