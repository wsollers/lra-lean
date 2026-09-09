
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

  LRA.Analysis.Sequences.ConvergesTo LRA.Analysis.Sequences.NewtonSeqSqrtTwo (Real.sqrt 2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (LRA.Analysis.Sequences.NewtonSeqSqrtTwo n) (Real.sqrt 2))) ε

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

  LRA.Analysis.Sequences.ConvergesTo LRA.Analysis.Sequences.FactorialPartialSums (Real.exp 1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun k => instHDiv.hDiv 1 k.factorial.cast) (Finset.range (instHAdd.hAdd n 1)).val)) (Complex.exp (Complex.ofReal 1)).1)) ε

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

  LRA.Analysis.Sequences.ConvergesTo LRA.Analysis.Sequences.CompoundInterestSeq (Real.exp 1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (instHPow.1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd 1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1))) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (Complex.exp (Complex.ofReal 1)).1)) ε

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

  ∀ (α : Real), LRA.Analysis.Sequences.ConvergesTo (LRA.Analysis.Sequences.DecimalTruncationSeq α) α

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    α : ℝ
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Real.instIntCast.1 (Real.instFloorRing.1 (instHMul.hMul (instHPow.hPow 10 n) α))) (instHPow.1 10 n)) α)) ε

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
