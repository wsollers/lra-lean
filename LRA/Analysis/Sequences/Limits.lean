
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

/--
`UniquenessOfLimits` TODO

Predicate logic:

  L = K

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) K) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) K))) ε) → L = K

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

  (∃ N₀ ∈ ℕ, ∀ n ≥ N₀, x n ≤ y n) → L ≤ M

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {L M : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) M) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) M))) ε ∧ Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → Real.instLE.1 (x n) (y n))) → Real.instLE.1 L M

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

  (A < B) → ∃ N ∈ ℕ, ∀ n ≥ N, x n < y n

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) B) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) B))) ε ∧ Real.instLT.1 A B)) → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (x n) (y n)

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n < y n) → A ≤ B

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) B) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) B))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (x n) (y n))) → Real.instLE.1 A B

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n > y n) → A ≥ B

Predicate logic (unfolded):

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (y n) B) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (y n) B))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (y n) (x n))) → Real.instLE.1 B A

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n ≤ B) → A ≤ B

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLE.1 (x n) B) → Real.instLE.1 A B

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n < B) → A ≤ B

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (x n) B) → Real.instLE.1 A B

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n ≥ B) → A ≥ B

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLE.1 B (x n)) → Real.instLE.1 B A

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

  (∃ N ∈ ℕ, ∀ n ≥ N, x n > B) → A ≥ B

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {A B : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) A) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) A))) ε ∧ Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 B (x n)) → Real.instLE.1 B A

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

  (∃ N₀ ∈ ℕ, ∀ n ≥ N₀, L ≤ x n ∧ x n ≤ L) → ConvergesTo x L

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → (Real.instLE.1 L (x n) ∧ Real.instLE.1 (x n) L)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε

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

  (∃ N₀ ∈ ℕ, ∀ n ≥ N₀, a n ≤ x n ∧ x n ≤ b n) → ConvergesTo x L

Predicate logic (unfolded):

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (a n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (a n) L))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (b n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (b n) L))) ε ∧ Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → (Real.instLE.1 (a n) (x n) ∧ Real.instLE.1 (x n) (b n)))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε

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

  (∃ N₀ ∈ ℕ, ∀ n ≥ N₀, |x n - L| ≤ u n) → ConvergesTo x L

Predicate logic (unfolded):

  ∀ {x u : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (u n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (u n) 0))) ε ∧ Exists fun N₀ => ∀ (n : Nat), instLENat.1 N₀ n → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) (u n)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε

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

  BoundedSeq x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (x n) L))) ε) → Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M)

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
