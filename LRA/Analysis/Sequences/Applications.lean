
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Algebra.Order.Floor.Ring
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence

namespace LRA.Analysis.Sequences

/--
`NewtonSeqSqrtTwo` TODO

Predicate logic:

  noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2

Predicate logic (unfolded):

  noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2
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
noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2

/--
`NewtonApproximationSqrtTwo` TODO

Predicate logic:

  ConvergesTo NewtonSeqSqrtTwo (Real.sqrt 2)

Predicate logic (unfolded):

  ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Sequences.NewtonSeqSqrtTwo n) instOfNatAtLeastTwo.1.sqrt) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.NewtonSeqSqrtTwo n) (Real.sqrt 2)))) ε

Logical form (Lean):

```lean
theorem NewtonApproximationSqrtTwo :
    ConvergesTo NewtonSeqSqrtTwo (Real.sqrt 2)
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
theorem NewtonApproximationSqrtTwo :
    ConvergesTo NewtonSeqSqrtTwo (Real.sqrt 2) := by
  sorry
/--
`FactorialPartialSums` TODO

Predicate logic:

  noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)

Predicate logic (unfolded):

  noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)
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
noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)

/--
`FactorialPartialSumsApproximateE` TODO

Predicate logic:

  ConvergesTo FactorialPartialSums (Real.exp 1)

Predicate logic (unfolded):

  ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((Finset.range (instHAdd.hAdd n 1)).sum fun k => instHDiv.hDiv 1 k.factorial.cast) (Complex.exp (Complex.ofReal 1)).re) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.FactorialPartialSums n) (Real.exp 1)))) ε

Logical form (Lean):

```lean
theorem FactorialPartialSumsApproximateE :
    ConvergesTo FactorialPartialSums (Real.exp 1)
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
theorem FactorialPartialSumsApproximateE :
    ConvergesTo FactorialPartialSums (Real.exp 1) := by
  sorry
/--
`CompoundInterestSeq` TODO

Predicate logic:

  noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1)

Predicate logic (unfolded):

  noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1)
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
noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1)

/--
`CompoundInterestApproximationE` TODO

Predicate logic:

  ConvergesTo CompoundInterestSeq (Real.exp 1)

Predicate logic (unfolded):

  ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHPow.hPow (instHAdd.hAdd 1 (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1))) (instHAdd.hAdd n 1)) (Complex.exp (Complex.ofReal 1)).re) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.CompoundInterestSeq n) (Real.exp 1)))) ε

Logical form (Lean):

```lean
theorem CompoundInterestApproximationE :
    ConvergesTo CompoundInterestSeq (Real.exp 1)
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
theorem CompoundInterestApproximationE :
    ConvergesTo CompoundInterestSeq (Real.exp 1) := by
  sorry
/--
`DecimalTruncationSeq` TODO

Predicate logic:

  noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n

Predicate logic (unfolded):

  noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n
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
noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n

/--
`DecimalTruncationsConverge` TODO

Predicate logic:

  ConvergesTo (DecimalTruncationSeq α) α

Predicate logic (unfolded):

  ∀ (α ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (Int.floor (instHMul.hMul (instHPow.hPow 10 n) α)).cast (instHPow.hPow 10 n)) α) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Sequences.DecimalTruncationSeq α n) α))) ε

Logical form (Lean):

```lean
theorem DecimalTruncationsConverge (α : ℝ) :
    ConvergesTo (DecimalTruncationSeq α) α
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
theorem DecimalTruncationsConverge (α : ℝ) :
    ConvergesTo (DecimalTruncationSeq α) α := by
  sorry
end LRA.Analysis.Sequences
