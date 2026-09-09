
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Tails
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Sequences

open LRA.Analysis.Bounds (IsSupremum IsInfimum)

/--
`IsIncreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (n : Nat), Real.instLE.le (x n) (x (instHAdd.hAdd n 1))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
def IsIncreasing (x : RealSequence) : Prop := ∀ n, x n ≤ x (n + 1)
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
def IsIncreasing (x : RealSequence) : Prop := ∀ n, x n ≤ x (n + 1)

/--
`IsDecreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (n : Nat), Real.instLE.le (x (instHAdd.hAdd n 1)) (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)

Logical form (Lean):

```lean
def IsDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) ≤ x n
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
def IsDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) ≤ x n

/--
`IsStrictlyIncreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (n : Nat), Real.instLT.lt (x n) (x (instHAdd.hAdd n 1))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
def IsStrictlyIncreasing (x : RealSequence) : Prop := ∀ n, x n < x (n + 1)
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
def IsStrictlyIncreasing (x : RealSequence) : Prop := ∀ n, x n < x (n + 1)

/--
`IsStrictlyDecreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (n : Nat), Real.instLT.lt (x (instHAdd.hAdd n 1)) (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)

Logical form (Lean):

```lean
def IsStrictlyDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) < x n
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
def IsStrictlyDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) < x n

/--
`IsMonotoneSeq` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Or (LRA.Analysis.Sequences.IsIncreasing x) (LRA.Analysis.Sequences.IsDecreasing x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) (∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n))

Logical form (Lean):

```lean
def IsMonotoneSeq (x : RealSequence) : Prop := IsIncreasing x ∨ IsDecreasing x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def IsMonotoneSeq (x : RealSequence) : Prop := IsIncreasing x ∨ IsDecreasing x

/--
`IsEventuallyIncreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLE.le (x n) (x (instHAdd.hAdd n 1))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
def IsEventuallyIncreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n ≤ x (n + 1)
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
def IsEventuallyIncreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n ≤ x (n + 1)

/--
`IsEventuallyDecreasing` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLE.le (x (instHAdd.hAdd n 1)) (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)

Logical form (Lean):

```lean
def IsEventuallyDecreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x (n + 1) ≤ x n
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
def IsEventuallyDecreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x (n + 1) ≤ x n

/--
`IsEventuallyMonotone` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Or (LRA.Analysis.Sequences.IsEventuallyIncreasing x) (LRA.Analysis.Sequences.IsEventuallyDecreasing x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n))

Logical form (Lean):

```lean
def IsEventuallyMonotone (x : RealSequence) : Prop :=
  IsEventuallyIncreasing x ∨ IsEventuallyDecreasing x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def IsEventuallyMonotone (x : RealSequence) : Prop :=
  IsEventuallyIncreasing x ∨ IsEventuallyDecreasing x

/--
`MonotoneConvergenceTheoremIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsIncreasing x ∧ LRA.Analysis.Sequences.BoundedAboveSeq x) → Exists fun L => (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Bounds.IsSupremum L (Set.range x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedAboveSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ (Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M)) → Exists fun L => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le x_1 L) ∧ (∀ (u : Real), (∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le x_1 u) → Real.instPreorder.1.le L u)))

Logical form (Lean):

```lean
theorem MonotoneConvergenceTheoremIncreasing {x : RealSequence}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L ∧ IsSupremum L (Set.range x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem MonotoneConvergenceTheoremIncreasing {x : RealSequence}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L ∧ IsSupremum L (Set.range x) := by
  sorry
/--
`MonotoneConvergenceTheoremDecreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsDecreasing x ∧ LRA.Analysis.Sequences.BoundedBelowSeq x) → Exists fun L => (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Bounds.IsInfimum L (Set.range x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedBelowSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) ∧ (Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n))) → Exists fun L => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ ((∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le L x_1) ∧ (∀ (l : Real), (∀ (x_1 : Real), x_1 ∈ fun x_2 => Exists fun y => x y = x_2 → Real.instPreorder.1.le l x_1) → Real.instPreorder.1.le l L)))

Logical form (Lean):

```lean
theorem MonotoneConvergenceTheoremDecreasing {x : RealSequence}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L ∧ IsInfimum L (Set.range x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem MonotoneConvergenceTheoremDecreasing {x : RealSequence}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L ∧ IsInfimum L (Set.range x) := by
  sorry
/--
`StrictIncreasingImpliesIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsStrictlyIncreasing x → LRA.Analysis.Sequences.IsIncreasing x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLT.lt (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) → ∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem StrictIncreasingImpliesIncreasing {x : RealSequence}
    (h : IsStrictlyIncreasing x) : IsIncreasing x
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
theorem StrictIncreasingImpliesIncreasing {x : RealSequence}
    (h : IsStrictlyIncreasing x) : IsIncreasing x := by
  sorry
/--
`StrictDecreasingImpliesDecreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsStrictlyDecreasing x → LRA.Analysis.Sequences.IsDecreasing x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLT.lt (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) → ∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)

Logical form (Lean):

```lean
theorem StrictDecreasingImpliesDecreasing {x : RealSequence}
    (h : IsStrictlyDecreasing x) : IsDecreasing x
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
theorem StrictDecreasingImpliesDecreasing {x : RealSequence}
    (h : IsStrictlyDecreasing x) : IsDecreasing x := by
  sorry
/--
`BoundedMonotoneSequenceEquivalencesIncr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsIncreasing x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedAboveSeq x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.IsIncreasing x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedAboveSeq x

Logical form (Lean):

```lean
theorem BoundedMonotoneSequenceEquivalencesIncr {x : RealSequence}
    (h : IsIncreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedAboveSeq x
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
theorem BoundedMonotoneSequenceEquivalencesIncr {x : RealSequence}
    (h : IsIncreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedAboveSeq x := by
  sorry
/--
`BoundedMonotoneSequenceEquivalencesDecr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsDecreasing x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedBelowSeq x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.IsDecreasing x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedBelowSeq x

Logical form (Lean):

```lean
theorem BoundedMonotoneSequenceEquivalencesDecr {x : RealSequence}
    (h : IsDecreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedBelowSeq x
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
theorem BoundedMonotoneSequenceEquivalencesDecr {x : RealSequence}
    (h : IsDecreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedBelowSeq x := by
  sorry
/--
`IncreasingBoundedBelowByFirstTerm` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsIncreasing x → ∀ (n : Nat), Real.instLE.le (x 0) (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) → ∀ (n : Nat), Real.instLE.le (x 0) (x n)

Logical form (Lean):

```lean
theorem IncreasingBoundedBelowByFirstTerm {x : RealSequence}
    (h : IsIncreasing x) : ∀ n, x 0 ≤ x n
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
theorem IncreasingBoundedBelowByFirstTerm {x : RealSequence}
    (h : IsIncreasing x) : ∀ n, x 0 ≤ x n := by
  sorry
/--
`DecreasingBoundedAboveByFirstTerm` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsDecreasing x → ∀ (n : Nat), Real.instLE.le (x n) (x 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) → ∀ (n : Nat), Real.instLE.le (x n) (x 0)

Logical form (Lean):

```lean
theorem DecreasingBoundedAboveByFirstTerm {x : RealSequence}
    (h : IsDecreasing x) : ∀ n, x n ≤ x 0
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
theorem DecreasingBoundedAboveByFirstTerm {x : RealSequence}
    (h : IsDecreasing x) : ∀ n, x n ≤ x 0 := by
  sorry
/--
`BoundedMonotoneSequenceEquivalences` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsMonotoneSeq x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedSeq x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.IsMonotoneSeq x → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.BoundedSeq x

Logical form (Lean):

```lean
theorem BoundedMonotoneSequenceEquivalences {x : RealSequence}
    (h : IsMonotoneSeq x) :
    (∃ L, ConvergesTo x L) ↔ BoundedSeq x
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
theorem BoundedMonotoneSequenceEquivalences {x : RealSequence}
    (h : IsMonotoneSeq x) :
    (∃ L, ConvergesTo x L) ↔ BoundedSeq x := by
  sorry
/--
`EventuallyMonotoneConvergenceTheoremIncr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsEventuallyIncreasing x ∧ LRA.Analysis.Sequences.BoundedAboveSeq x) → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedAboveSeq x
  Prove
    ((Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ (Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M)) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem EventuallyMonotoneConvergenceTheoremIncr {x : RealSequence}
    (h : IsEventuallyIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L
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
theorem EventuallyMonotoneConvergenceTheoremIncr {x : RealSequence}
    (h : IsEventuallyIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry
/--
`EventuallyMonotoneConvergenceTheoremDecr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsEventuallyDecreasing x ∧ LRA.Analysis.Sequences.BoundedBelowSeq x) → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedBelowSeq x
  Prove
    ((Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) ∧ (Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem EventuallyMonotoneConvergenceTheoremDecr {x : RealSequence}
    (h : IsEventuallyDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L
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
theorem EventuallyMonotoneConvergenceTheoremDecr {x : RealSequence}
    (h : IsEventuallyDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry
/--
`EventuallyMonotoneConvergenceTheorem` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsEventuallyMonotone x ∧ LRA.Analysis.Sequences.BoundedSeq x) → Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
  Prove
    ((Or (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n))) ∧ (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M)))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem EventuallyMonotoneConvergenceTheorem {x : RealSequence}
    (h : IsEventuallyMonotone x) (hbdd : BoundedSeq x) :
    ∃ L, ConvergesTo x L
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
theorem EventuallyMonotoneConvergenceTheorem {x : RealSequence}
    (h : IsEventuallyMonotone x) (hbdd : BoundedSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry
/--
`UnboundedMonotoneDivergencePos` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsIncreasing x ∧ ¬ LRA.Analysis.Sequences.BoundedAboveSeq x) → LRA.Analysis.Sequences.DivergesToPosInf x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hunbdd : ¬ BoundedAboveSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ ((Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M) → False)) → ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M (x n)

Logical form (Lean):

```lean
theorem UnboundedMonotoneDivergencePos {x : RealSequence}
    (hinc : IsIncreasing x) (hunbdd : ¬ BoundedAboveSeq x) :
    DivergesToPosInf x
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
theorem UnboundedMonotoneDivergencePos {x : RealSequence}
    (hinc : IsIncreasing x) (hunbdd : ¬ BoundedAboveSeq x) :
    DivergesToPosInf x := by
  sorry
/--
`UnboundedMonotoneDivergenceNeg` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsDecreasing x ∧ ¬ LRA.Analysis.Sequences.BoundedBelowSeq x) → LRA.Analysis.Sequences.DivergesToNegInf x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hunbdd : ¬ BoundedBelowSeq x
  Prove
    ((∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) ∧ ((Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)) → False)) → ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) M

Logical form (Lean):

```lean
theorem UnboundedMonotoneDivergenceNeg {x : RealSequence}
    (hdec : IsDecreasing x) (hunbdd : ¬ BoundedBelowSeq x) :
    DivergesToNegInf x
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
theorem UnboundedMonotoneDivergenceNeg {x : RealSequence}
    (hdec : IsDecreasing x) (hunbdd : ¬ BoundedBelowSeq x) :
    DivergesToNegInf x := by
  sorry
/--
`TranslationPreservesIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsIncreasing x → LRA.Analysis.Sequences.IsIncreasing fun n => instHAdd.hAdd (x n) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    (∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) → ∀ (n : Nat), Real.instLE.le ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) c) n) ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) c) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem TranslationPreservesIncreasing {x : RealSequence} {c : ℝ}
    (h : IsIncreasing x) : IsIncreasing (fun n => x n + c)
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
theorem TranslationPreservesIncreasing {x : RealSequence} {c : ℝ}
    (h : IsIncreasing x) : IsIncreasing (fun n => x n + c) := by
  sorry
/--
`TranslationPreservesDecreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {c : Real}, LRA.Analysis.Sequences.IsDecreasing x → LRA.Analysis.Sequences.IsDecreasing fun n => instHAdd.hAdd (x n) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    c : ℝ
  Prove
    (∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) → ∀ (n : Nat), Real.instLE.le ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) c) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) c) n)

Logical form (Lean):

```lean
theorem TranslationPreservesDecreasing {x : RealSequence} {c : ℝ}
    (h : IsDecreasing x) : IsDecreasing (fun n => x n + c)
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
theorem TranslationPreservesDecreasing {x : RealSequence} {c : ℝ}
    (h : IsDecreasing x) : IsDecreasing (fun n => x n + c) := by
  sorry
/--
`PositiveScalarPreservesIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {α : Real}, (LRA.Analysis.Sequences.IsIncreasing x ∧ GT.gt α 0) → LRA.Analysis.Sequences.IsIncreasing fun n => instHMul.hMul α (x n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    α : ℝ
    hα : α > 0
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ Real.instLT.lt 0 α) → ∀ (n : Nat), Real.instLE.le ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) n) ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem PositiveScalarPreservesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α > 0) : IsIncreasing (fun n => α * x n)
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
theorem PositiveScalarPreservesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α > 0) : IsIncreasing (fun n => α * x n) := by
  sorry
/--
`NegativeScalarReversesIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {α : Real}, (LRA.Analysis.Sequences.IsIncreasing x ∧ Real.instLT.lt α 0) → LRA.Analysis.Sequences.IsDecreasing fun n => instHMul.hMul α (x n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    α : ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ Real.instLT.lt α 0) → ∀ (n : Nat), Real.instLE.le ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) n)

Logical form (Lean):

```lean
theorem NegativeScalarReversesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α < 0) : IsDecreasing (fun n => α * x n)
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
theorem NegativeScalarReversesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α < 0) : IsDecreasing (fun n => α * x n) := by
  sorry
/--
`NegationReversesIncreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsIncreasing x → LRA.Analysis.Sequences.IsDecreasing fun n => Real.instNeg.neg (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) → ∀ (n : Nat), Real.instLE.le ((fun n => Real.instNeg.neg (x n)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ((fun n => Real.instNeg.neg (x n)) n)

Logical form (Lean):

```lean
theorem NegationReversesIncreasing {x : RealSequence}
    (h : IsIncreasing x) : IsDecreasing (fun n => -x n)
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
theorem NegationReversesIncreasing {x : RealSequence}
    (h : IsIncreasing x) : IsDecreasing (fun n => -x n) := by
  sorry
/--
`NegationReversesDecreasing` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsDecreasing x → LRA.Analysis.Sequences.IsIncreasing fun n => Real.instNeg.neg (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) → ∀ (n : Nat), Real.instLE.le ((fun n => Real.instNeg.neg (x n)) n) ((fun n => Real.instNeg.neg (x n)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem NegationReversesDecreasing {x : RealSequence}
    (h : IsDecreasing x) : IsIncreasing (fun n => -x n)
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
theorem NegationReversesDecreasing {x : RealSequence}
    (h : IsDecreasing x) : IsIncreasing (fun n => -x n) := by
  sorry
end LRA.Analysis.Sequences
