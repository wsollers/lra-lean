
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/--
`DivergenceToInfinityImpliesRealDivergence` TODO

Predicate logic:

  IsDivergent x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Or (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M (x n)) (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (x n) M) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (x n) L))) ε) → False

Logical form (Lean):

```lean
theorem DivergenceToInfinityImpliesRealDivergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem DivergenceToInfinityImpliesRealDivergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x := by
  sorry

/--
`TwoSubsequentialLimitsForceDivergence` TODO

Predicate logic:

  (IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K) → IsDivergent x

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (L = K → False ∧ (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε) ∧ (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) K) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) K))) ε) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (x n) L))) ε))) → False

Logical form (Lean):

```lean
theorem TwoSubsequentialLimitsForceDivergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x
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
theorem TwoSubsequentialLimitsForceDivergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x := by
  sorry

/--
`UnboundedAboveHasPositiveInfinitySubsequence` TODO

Predicate logic:

  ∃ σ ∈ ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ DivergesToPosInf (fun k => x (σ k))

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ((Exists fun M => ∀ (n : Nat), Real.instLE.1 (x n) M) → False) → Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M ((fun k => x (σ k)) n))

Logical form (Lean):

```lean
theorem UnboundedAboveHasPositiveInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k))
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
theorem UnboundedAboveHasPositiveInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k)) := by
  sorry

/--
`UnboundedBelowHasNegativeInfinitySubsequence` TODO

Predicate logic:

  ∃ σ ∈ ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ DivergesToNegInf (fun k => x (σ k))

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ((Exists fun m => ∀ (n : Nat), Real.instLE.1 m (x n)) → False) → Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 ((fun k => x (σ k)) n) M)

Logical form (Lean):

```lean
theorem UnboundedBelowHasNegativeInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k))
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
theorem UnboundedBelowHasNegativeInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k)) := by
  sorry

/--
`BoundedDivergenceProducesTwoSubsequentialLimits` TODO

Predicate logic:

  (IsDivergent x) → ∃ L K ∈ ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K

Predicate logic (unfolded):

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (n : Nat), Real.instLE.1 (SemilatticeSup.toMax.1 (x n) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (x n))) M) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (x n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (x n) L))) ε) → False) → Exists fun L => Exists fun K => (L = K → False ∧ (Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) L))) ε) ∧ Exists fun σ => (∀ (k l : Nat), instLTNat.1 k l → instLTNat.1 (σ k) (σ l) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun k => x (σ k)) n) K) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun k => x (σ k)) n) K))) ε)))

Logical form (Lean):

```lean
theorem BoundedDivergenceProducesTwoSubsequentialLimits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K
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
theorem BoundedDivergenceProducesTwoSubsequentialLimits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

end LRA.Analysis.Sequences
