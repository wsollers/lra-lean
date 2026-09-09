
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/--
`DivergenceToInfinityImpliesRealDivergence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, Or (LRA.Analysis.Sequences.DivergesToPosInf x) (LRA.Analysis.Sequences.DivergesToNegInf x) → LRA.Analysis.Sequences.IsDivergent x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : DivergesToPosInf x ∨ DivergesToNegInf x
  Prove
    ((Or (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M (x n)) (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (x n) M)) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)) → False

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (Ne L K ∧ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x K)) → LRA.Analysis.Sequences.IsDivergent x

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L K : ℝ
    hLK : L ≠ K
  Prove
    ((L = K → False) ∧ ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) ∧ ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) K)) ε))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)))) → False

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ¬ LRA.Analysis.Sequences.BoundedAboveSeq x → Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ LRA.Analysis.Sequences.DivergesToPosInf fun k => x (σ k))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : ¬ BoundedAboveSeq x
  Prove
    ((Exists fun M => ∀ (n : Nat), Real.instLE.le (x n) M) → False) → Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M ((fun k => x (σ k)) n)))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, ¬ LRA.Analysis.Sequences.BoundedBelowSeq x → Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ LRA.Analysis.Sequences.DivergesToNegInf fun k => x (σ k))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : ¬ BoundedBelowSeq x
  Prove
    ((Exists fun m => ∀ (n : Nat), Real.instLE.le m (x n)) → False) → Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt ((fun k => x (σ k)) n) M))

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

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.BoundedSeq x ∧ LRA.Analysis.Sequences.IsDivergent x) → Exists fun L => Exists fun K => (Ne L K ∧ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x K))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    hbdd : BoundedSeq x
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ ((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → False)) → Exists fun L => Exists fun K => ((L = K → False) ∧ ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) ∧ (Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) K)) ε)))))

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
