
import Mathlib.Order.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

/--
`ExampleConstantSequence` TODO

Predicate logic:

  ConvergesTo fun _ ∈ ℕ => c c

Predicate logic (unfolded):

  ∀ (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => c) n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => c) n) c))) ε

Logical form (Lean):

```lean
theorem ExampleConstantSequence (c : ℝ) :
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
theorem ExampleConstantSequence (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

/--
`ExampleReciprocalSequence` TODO

Predicate logic:

  ∀ n ∈ ℕ, 1 ∈ ℝ / (n + 2 < 1 / (n + 1)) ∧ ∀ n ∈ ℕ, 0 ≤ 1 / (n ∈ ℝ + 1) ∧ ConvergesTo fun n ∈ ℕ => 1 / (n ∈ ℝ + 1) 0

Predicate logic (unfolded):

  (∀ (n : Nat), Real.instLT.1 (instHDiv.1 One.toOfNat1.1 (instHAdd.1 (Real.instNatCast.1 n) instOfNatAtLeastTwo.1)) (instHDiv.1 One.toOfNat1.1 (instHAdd.1 (Real.instNatCast.1 n) One.toOfNat1.1)) ∧ (∀ (n : Nat), Real.instLE.1 Zero.toOfNat0.1 (instHDiv.1 One.toOfNat1.1 (instHAdd.1 (Real.instNatCast.1 n) One.toOfNat1.1)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 1 (instHAdd.hAdd n.cast 1)) n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1)) n) 0))) ε))

Logical form (Lean):

```lean
theorem ExampleReciprocalSequence :
    (∀ n : ℕ, (1 : ℝ) / (n + 2) < 1 / (n + 1)) ∧
      (∀ n : ℕ, 0 ≤ 1 / ((n : ℝ) + 1)) ∧
      ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 1)) 0
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
theorem ExampleReciprocalSequence :
    (∀ n : ℕ, (1 : ℝ) / (n + 2) < 1 / (n + 1)) ∧
      (∀ n : ℕ, 0 ≤ 1 / ((n : ℝ) + 1)) ∧
      ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 1)) 0 := by
  sorry

/--
`ExampleAlternatingNullSequence` TODO

Predicate logic:

  ¬ Monotone fun n ∈ ℕ => -1 ∈ ℝ ^ n / (n + 1) ∧ ConvergesTo fun n ∈ ℕ => -1 ∈ ℝ ^ n / (n + 1) 0

Predicate logic (unfolded):

  ((∀ ⦃a b : Nat⦄, Nat.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 ((fun n => instHDiv.1 (instHPow.1 (Real.instNeg.1 1) n) (instHAdd.1 (Real.instNatCast.natCast n) One.toOfNat1.1)) a) ((fun n => instHDiv.1 (instHPow.1 (Real.instNeg.1 1) n) (instHAdd.1 (Real.instNatCast.natCast n) One.toOfNat1.1)) b)) → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 (instHPow.hPow (-1) n) (instHAdd.hAdd n.cast 1)) n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv (instHPow.hPow (-1) n) (instHAdd.hAdd n.cast 1)) n) 0))) ε)

Logical form (Lean):

```lean
theorem ExampleAlternatingNullSequence :
    ¬ Monotone (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ExampleAlternatingNullSequence :
    ¬ Monotone (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) 0 := by
  sorry

/--
`ExampleOscillatingSequence` TODO

Predicate logic:

  BoundedSeq fun n ∈ ℕ => -1 ∈ ℝ ^ n ∧ IsOscillatory fun n ∈ ℕ => -1 ∈ ℝ ^ n ∧ ConvergesTo fun n ∈ ℕ => -1 ∈ ℝ ^ (2 * n) 1 ∧ ConvergesTo fun n ∈ ℕ => -1 ∈ ℝ ^ (2 * n + 1) (-1)

Predicate logic (unfolded):

  (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 ((fun n => instHPow.1 (Real.instNeg.1 1) n) n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun n => instHPow.1 (-1) n) n))) M) ∧ (((Exists fun L => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L))) ε) → False ∧ ((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M ((fun n => instHPow.1 (Real.instNeg.1 1) n) n)) → False ∧ (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 ((fun n => instHPow.1 (Real.instNeg.1 1) n) n) M) → False)) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHPow.1 (-1) (instHMul.hMul 2 n)) n) One.toOfNat1.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHPow.hPow (-1) (instHMul.hMul 2 n)) n) 1))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHPow.1 (-1) (instHAdd.hAdd (instHMul.hMul 2 n) 1)) n) (Real.instNeg.1 1)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHPow.hPow (-1) (instHAdd.hAdd (instHMul.hMul 2 n) 1)) n) (-1)))) ε)))

Logical form (Lean):

```lean
theorem ExampleOscillatingSequence :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n)) 1 ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n + 1)) (-1)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ExampleOscillatingSequence :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n)) 1 ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n + 1)) (-1) := by
  sorry

/--
`ExampleGeometricSequence` TODO

Predicate logic:

  ∀ r ∈ ℝ, |r| < 1 → ConvergesTo fun n ∈ ℕ => r ^ n 0 ∧ ConvergesTo fun _ ∈ ℕ => 1 ∈ ℝ ^ 0 ∈ ℕ 1 ∧ IsOscillatory fun n ∈ ℕ => -1 ∈ ℝ ^ n ∧ ∀ r ∈ ℝ, |r| > 1 → ¬ BoundedSeq fun n ∈ ℕ => r ^ n

Predicate logic (unfolded):

  (∀ (r : Real), Real.instLT.1 (SemilatticeSup.toMax.1 r (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 r)) One.toOfNat1.1 → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHPow.1 r n) n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHPow.hPow r n) n) 0))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHPow.1 1 0) n) One.toOfNat1.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHPow.hPow 1 0) n) 1))) ε ∧ (((Exists fun L => ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L))) ε) → False ∧ ((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M ((fun n => instHPow.1 (Real.instNeg.1 1) n) n)) → False ∧ (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 ((fun n => instHPow.1 (Real.instNeg.1 1) n) n) M) → False)) ∧ ∀ (r : Real), Real.instLT.1 One.toOfNat1.1 (SemilatticeSup.toMax.1 r (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 r)) → (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 ((fun n => instHPow.1 r n) n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun n => instHPow.hPow r n) n))) M)) → False)))

Logical form (Lean):

```lean
theorem ExampleGeometricSequence :
    (∀ r : ℝ, |r| < 1 → ConvergesTo (fun n : ℕ => r ^ n) 0) ∧
      ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1 ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      (∀ r : ℝ, |r| > 1 → ¬ BoundedSeq (fun n : ℕ => r ^ n))
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
theorem ExampleGeometricSequence :
    (∀ r : ℝ, |r| < 1 → ConvergesTo (fun n : ℕ => r ^ n) 0) ∧
      ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1 ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      (∀ r : ℝ, |r| > 1 → ¬ BoundedSeq (fun n : ℕ => r ^ n)) := by
  sorry

/--
`ExampleBoundedNotConvergent` TODO

Predicate logic:

  BoundedSeq fun n ∈ ℕ => -1 ∈ ℝ ^ n ∧ IsDivergent fun n ∈ ℕ => -1 ∈ ℝ ^ n

Predicate logic (unfolded):

  (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 ((fun n => instHPow.1 (Real.instNeg.1 1) n) n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun n => instHPow.1 (-1) n) n))) M) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub ((fun n => instHPow.hPow (-1) n) n) L))) ε) → False)

Logical form (Lean):

```lean
theorem ExampleBoundedNotConvergent :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsDivergent (fun n : ℕ => (-1 : ℝ) ^ n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ExampleBoundedNotConvergent :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsDivergent (fun n : ℕ => (-1 : ℝ) ^ n) := by
  sorry

/--
`ExampleVanishingDifferencesNotCauchy` TODO

Predicate logic:

  ConvergesTo fun n ∈ ℕ => 1 / (n ∈ ℝ + 2) 0 ∧ ¬ BoundedSeq fun n ∈ ℕ => ∑ k ∈ Finset.range (n + 1, 1 / (k ∈ ℝ + 1))

Predicate logic (unfolded):

  (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun n => instHDiv.1 1 (instHAdd.hAdd n.cast 2)) n) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun n => instHDiv.hDiv 1 (instHAdd.hAdd n.cast 2)) n) 0))) ε ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 ((fun n => (Multiset.map (fun k => instHDiv.hDiv 1 (instHAdd.hAdd k.cast 1)) (Finset.range (instHAdd.hAdd n 1)).val).sum) n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHDiv.hDiv 1 (instHAdd.hAdd k.cast 1)) n))) M)) → False)

Logical form (Lean):

```lean
theorem ExampleVanishingDifferencesNotCauchy :
    ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 2)) 0 ∧
      ¬ BoundedSeq (fun n : ℕ => ∑ k ∈ Finset.range (n + 1), 1 / ((k : ℝ) + 1))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem ExampleVanishingDifferencesNotCauchy :
    ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 2)) 0 ∧
      ¬ BoundedSeq (fun n : ℕ => ∑ k ∈ Finset.range (n + 1), 1 / ((k : ℝ) + 1)) := by
  sorry

end LRA.Analysis.Sequences
