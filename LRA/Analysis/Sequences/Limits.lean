
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

/--
`UniquenessOfLimits` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.ConvergesTo x K) → L = K

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L K : ℝ
    hL : ConvergesTo x L
    hK : ConvergesTo x K
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) K)) ε)) → L = K

Logical form (Lean):

```lean
theorem UniquenessOfLimits {x : RealSequence} {L K : ℝ}
    (hL : ConvergesTo x L) (hK : ConvergesTo x K) : L = K
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
theorem UniquenessOfLimits {x : RealSequence} {L K : ℝ}
    (hL : ConvergesTo x L) (hK : ConvergesTo x K) : L = K := by
  sorry
/--
`LimitPreservesEventualOrder` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ (LRA.Analysis.Sequences.ConvergesTo y M ∧ (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (x n) (y n)))) → Real.instLE.le L M

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    L M : ℝ
    hL : ConvergesTo x L
    hM : ConvergesTo y M
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) M)) ε) ∧ (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → Real.instLE.le (x n) (y n)))) → Real.instLE.le L M

Logical form (Lean):

```lean
theorem LimitPreservesEventualOrder {x y : RealSequence} {L M : ℝ}
    (hL : ConvergesTo x L) (hM : ConvergesTo y M)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n ≤ y n) : L ≤ M
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
theorem LimitPreservesEventualOrder {x y : RealSequence} {L M : ℝ}
    (hL : ConvergesTo x L) (hM : ConvergesTo y M)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n ≤ y n) : L ≤ M := by
  sorry
/--
`StrictLimitSeparationGivesEventualOrder` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (LRA.Analysis.Sequences.ConvergesTo y B ∧ Real.instLT.lt A B)) → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (x n) (y n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
    hB : ConvergesTo y B
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) B)) ε) ∧ Real.instLT.lt A B)) → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) (y n)

Logical form (Lean):

```lean
theorem StrictLimitSeparationGivesEventualOrder {x y : RealSequence}
    {A B : ℝ} (hA : ConvergesTo x A) (hB : ConvergesTo y B) (hAB : A < B) :
    ∃ N : ℕ, ∀ n ≥ N, x n < y n
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
theorem StrictLimitSeparationGivesEventualOrder {x y : RealSequence}
    {A B : ℝ} (hA : ConvergesTo x A) (hB : ConvergesTo y B) (hAB : A < B) :
    ∃ N : ℕ, ∀ n ≥ N, x n < y n := by
  sorry
/--
`EventualStrictComparisonPreservesWeakLimitOrderLt` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (LRA.Analysis.Sequences.ConvergesTo y B ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (x n) (y n)))) → Real.instLE.le A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
    hB : ConvergesTo y B
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) B)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) (y n)))) → Real.instLE.le A B

Logical form (Lean):

```lean
theorem EventualStrictComparisonPreservesWeakLimitOrderLt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n < y n) : A ≤ B
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
theorem EventualStrictComparisonPreservesWeakLimitOrderLt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n < y n) : A ≤ B := by
  sorry
/--
`EventualStrictComparisonPreservesWeakLimitOrderGt` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (LRA.Analysis.Sequences.ConvergesTo y B ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → GT.gt (x n) (y n)))) → GE.ge A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
    hB : ConvergesTo y B
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y n) B)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (y n) (x n)))) → Real.instLE.le B A

Logical form (Lean):

```lean
theorem EventualStrictComparisonPreservesWeakLimitOrderGt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n > y n) : A ≥ B
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
theorem EventualStrictComparisonPreservesWeakLimitOrderGt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n > y n) : A ≥ B := by
  sorry
/--
`ConstantComparisonSequenceLimitsLe` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLE.le (x n) B)) → Real.instLE.le A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le (x n) B)) → Real.instLE.le A B

Logical form (Lean):

```lean
theorem ConstantComparisonSequenceLimitsLe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ B) : A ≤ B
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
theorem ConstantComparisonSequenceLimitsLe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ B) : A ≤ B := by
  sorry
/--
`ConstantComparisonSequenceLimitsLt` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (x n) B)) → Real.instLE.le A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) B)) → Real.instLE.le A B

Logical form (Lean):

```lean
theorem ConstantComparisonSequenceLimitsLt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n < B) : A ≤ B
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
theorem ConstantComparisonSequenceLimitsLt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n < B) : A ≤ B := by
  sorry
/--
`ConstantComparisonSequenceLimitsGe` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → GE.ge (x n) B)) → GE.ge A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLE.le B (x n))) → Real.instLE.le B A

Logical form (Lean):

```lean
theorem ConstantComparisonSequenceLimitsGe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≥ B) : A ≥ B
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
theorem ConstantComparisonSequenceLimitsGe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≥ B) : A ≥ B := by
  sorry
/--
`ConstantComparisonSequenceLimitsGt` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (LRA.Analysis.Sequences.ConvergesTo x A ∧ (Exists fun N => ∀ (n : Nat), GE.ge n N → GT.gt (x n) B)) → GE.ge A B

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    A B : ℝ
    hA : ConvergesTo x A
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) A)) ε) ∧ (Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt B (x n))) → Real.instLE.le B A

Logical form (Lean):

```lean
theorem ConstantComparisonSequenceLimitsGt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n > B) : A ≥ B
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
theorem ConstantComparisonSequenceLimitsGt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n > B) : A ≥ B := by
  sorry
/--
`ConstantSqueezeTheorem` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → (Real.instLE.le L (x n) ∧ Real.instLE.le (x n) L)) → LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → (Real.instLE.le L (x n) ∧ Real.instLE.le (x n) L)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem ConstantSqueezeTheorem {x : RealSequence} {L : ℝ}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, L ≤ x n ∧ x n ≤ L) : ConvergesTo x L
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
theorem ConstantSqueezeTheorem {x : RealSequence} {L : ℝ}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, L ≤ x n ∧ x n ≤ L) : ConvergesTo x L := by
  sorry
/--
`SequenceSqueezeTheorem` TODO

Predicate logic:

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence} {L : Real}, (LRA.Analysis.Sequences.ConvergesTo a L ∧ (LRA.Analysis.Sequences.ConvergesTo b L ∧ (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n))))) → LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a x b : RealSequence
    L : ℝ
    ha : ConvergesTo a L
    hb : ConvergesTo b L
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (a n) L)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (b n) L)) ε) ∧ (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem SequenceSqueezeTheorem {a x b : RealSequence} {L : ℝ}
    (ha : ConvergesTo a L) (hb : ConvergesTo b L)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, a n ≤ x n ∧ x n ≤ b n) : ConvergesTo x L
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
theorem SequenceSqueezeTheorem {a x b : RealSequence} {L : ℝ}
    (ha : ConvergesTo a L) (hb : ConvergesTo b L)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, a n ≤ x n ∧ x n ≤ b n) : ConvergesTo x L := by
  sorry
/--
`AbsoluteValueSqueezeTheorem` TODO

Predicate logic:

  ∀ {x u : LRA.Analysis.Sequences.RealSequence} {L : Real}, (LRA.Analysis.Sequences.ConvergesTo u 0 ∧ (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le (abs (instHSub.hSub (x n) L)) (u n))) → LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x u : RealSequence
    L : ℝ
    hu : ConvergesTo u 0
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (u n) 0)) ε) ∧ (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) (u n))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem AbsoluteValueSqueezeTheorem {x u : RealSequence} {L : ℝ}
    (hu : ConvergesTo u 0) (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, |x n - L| ≤ u n) :
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
theorem AbsoluteValueSqueezeTheorem {x u : RealSequence} {L : ℝ}
    (hu : ConvergesTo u 0) (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, |x n - L| ≤ u n) :
    ConvergesTo x L := by
  sorry
/--
`ConvergentSequenceIsBounded` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L → LRA.Analysis.Sequences.BoundedSeq x

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    h : ConvergesTo x L
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))

Logical form (Lean):

```lean
theorem ConvergentSequenceIsBounded {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : BoundedSeq x
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
theorem ConvergentSequenceIsBounded {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : BoundedSeq x := by
  sorry
end LRA.Analysis.Sequences
