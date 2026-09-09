
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity

namespace LRA.Analysis.Sequences

/--
`IsStrictlyIncreasingIndexMap` TODO

Predicate logic:

  ∀ (σ : Nat → Nat) (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instLTNat.lt k l → instLTNat.lt (σ k) (σ l)

Logical form (Lean):

```lean
def IsStrictlyIncreasingIndexMap (σ : ℕ → ℕ) : Prop :=
  ∀ k l : ℕ, k < l → σ k < σ l
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
def IsStrictlyIncreasingIndexMap (σ : ℕ → ℕ) : Prop :=
  ∀ k l : ℕ, k < l → σ k < σ l

/--
`IsSubsequenceOf` TODO

Predicate logic:

  ∀ (y x : LRA.Analysis.Sequences.RealSequence), Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ (∀ (k : Nat), y k = x (σ k)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (k : Nat), y k = x (σ k)))

Logical form (Lean):

```lean
def IsSubsequenceOf (y x : RealSequence) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, y k = x (σ k)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsSubsequenceOf (y x : RealSequence) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, y k = x (σ k)

/--
`IsSubsequentialLimit` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (L : Real), Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ LRA.Analysis.Sequences.ConvergesTo (fun k => x (σ k)) L)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))

Logical form (Lean):

```lean
def IsSubsequentialLimit (x : RealSequence) (L : ℝ) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ConvergesTo (fun k => x (σ k)) L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsSubsequentialLimit (x : RealSequence) (L : ℝ) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ConvergesTo (fun k => x (σ k)) L

/--
`HasConvergentSubsequence` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun L => LRA.Analysis.Sequences.IsSubsequentialLimit x L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))

Logical form (Lean):

```lean
def HasConvergentSubsequence (x : RealSequence) : Prop :=
  ∃ L : ℝ, IsSubsequentialLimit x L
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
def HasConvergentSubsequence (x : RealSequence) : Prop :=
  ∃ L : ℝ, IsSubsequentialLimit x L

/--
`SubsequenceIndicesDominateIdentity` TODO

Predicate logic:

  ∀ {σ : Nat → Nat}, LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ → ∀ (k : Nat), instLENat.le k (σ k)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    σ : ℕ → ℕ
  Prove
    (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) → ∀ (k : Nat), instLENat.le k (σ k)

Logical form (Lean):

```lean
theorem SubsequenceIndicesDominateIdentity {σ : ℕ → ℕ}
    (h : IsStrictlyIncreasingIndexMap σ) : ∀ k, k ≤ σ k
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
theorem SubsequenceIndicesDominateIdentity {σ : ℕ → ℕ}
    (h : IsStrictlyIncreasingIndexMap σ) : ∀ k, k ≤ σ k := by
  sorry
/--
`SubsequencesPreserveLimits` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real} {σ : Nat → Nat}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → LRA.Analysis.Sequences.ConvergesTo (fun k => x (σ k)) L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    σ : ℕ → ℕ
    hx : ConvergesTo x L
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε

Logical form (Lean):

```lean
theorem SubsequencesPreserveLimits {x : RealSequence} {L : ℝ} {σ : ℕ → ℕ}
    (hx : ConvergesTo x L) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ConvergesTo (fun k => x (σ k)) L
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
theorem SubsequencesPreserveLimits {x : RealSequence} {L : ℝ} {σ : ℕ → ℕ}
    (hx : ConvergesTo x L) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ConvergesTo (fun k => x (σ k)) L := by
  sorry
/--
`SubsequentialLimitOfConvergentSequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (LRA.Analysis.Sequences.ConvergesTo x L ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x K) → K = L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L K : ℝ
    hL : ConvergesTo x L
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) ∧ (Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) K)) ε)))) → K = L

Logical form (Lean):

```lean
theorem SubsequentialLimitOfConvergentSequence {x : RealSequence}
    {L K : ℝ} (hL : ConvergesTo x L) (hK : IsSubsequentialLimit x K) :
    K = L
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
theorem SubsequentialLimitOfConvergentSequence {x : RealSequence}
    {L K : ℝ} (hL : ConvergesTo x L) (hK : IsSubsequentialLimit x K) :
    K = L := by
  sorry
/--
`DivergenceByTwoSubsequentialLimits` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L K : Real}, (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ (LRA.Analysis.Sequences.IsSubsequentialLimit x K ∧ Ne L K)) → LRA.Analysis.Sequences.IsDivergent x

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L K : ℝ
    hLK : L ≠ K
  Prove
    ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) ∧ ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) K)) ε))) ∧ ((L = K → False) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε)))) → False

Logical form (Lean):

```lean
theorem DivergenceByTwoSubsequentialLimits {x : RealSequence}
    {L K : ℝ} (hL : IsSubsequentialLimit x L) (hK : IsSubsequentialLimit x K)
    (hLK : L ≠ K) : IsDivergent x
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
theorem DivergenceByTwoSubsequentialLimits {x : RealSequence}
    {L K : ℝ} (hL : IsSubsequentialLimit x L) (hK : IsSubsequentialLimit x K)
    (hLK : L ≠ K) : IsDivergent x := by
  sorry
/--
`BoundednessPassesToSubsequences` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {σ : Nat → Nat}, (LRA.Analysis.Sequences.BoundedSeq x ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → LRA.Analysis.Sequences.BoundedSeq fun k => x (σ k)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    x : RealSequence
    σ : ℕ → ℕ
    hx : BoundedSeq x
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs ((fun k => x (σ k)) n)) M))

Logical form (Lean):

```lean
theorem BoundednessPassesToSubsequences {x : RealSequence} {σ : ℕ → ℕ}
    (hx : BoundedSeq x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    BoundedSeq (fun k => x (σ k))
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
theorem BoundednessPassesToSubsequences {x : RealSequence} {σ : ℕ → ℕ}
    (hx : BoundedSeq x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    BoundedSeq (fun k => x (σ k)) := by
  sorry
/--
`MonotonicityPassesToSubsequencesIncr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {σ : Nat → Nat}, (LRA.Analysis.Sequences.IsIncreasing x ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → LRA.Analysis.Sequences.IsIncreasing fun k => x (σ k)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    x : RealSequence
    σ : ℕ → ℕ
  Prove
    ((∀ (n : Nat), Real.instLE.le (x n) (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → ∀ (n : Nat), Real.instLE.le ((fun k => x (σ k)) n) ((fun k => x (σ k)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))

Logical form (Lean):

```lean
theorem MonotonicityPassesToSubsequencesIncr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsIncreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsIncreasing (fun k => x (σ k))
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
theorem MonotonicityPassesToSubsequencesIncr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsIncreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsIncreasing (fun k => x (σ k)) := by
  sorry
/--
`MonotonicityPassesToSubsequencesDecr` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {σ : Nat → Nat}, (LRA.Analysis.Sequences.IsDecreasing x ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → LRA.Analysis.Sequences.IsDecreasing fun k => x (σ k)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    x : RealSequence
    σ : ℕ → ℕ
  Prove
    ((∀ (n : Nat), Real.instLE.le (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n)) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → ∀ (n : Nat), Real.instLE.le ((fun k => x (σ k)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ((fun k => x (σ k)) n)

Logical form (Lean):

```lean
theorem MonotonicityPassesToSubsequencesDecr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsDecreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsDecreasing (fun k => x (σ k))
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
theorem MonotonicityPassesToSubsequencesDecr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsDecreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsDecreasing (fun k => x (σ k)) := by
  sorry
/--
`SubsequenceOfSubsequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {σ τ : Nat → Nat}, (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap τ) → LRA.Analysis.Sequences.IsSubsequenceOf (fun k => x (σ (τ k))) x

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    x : RealSequence
    σ τ : ℕ → ℕ
  Prove
    ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (τ k) (τ l))) → Exists fun σ_1 => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ_1 k) (σ_1 l)) ∧ (∀ (k : Nat), (fun k => x (σ (τ k))) k = x (σ_1 k)))

Logical form (Lean):

```lean
theorem SubsequenceOfSubsequence {x : RealSequence} {σ τ : ℕ → ℕ}
    (hσ : IsStrictlyIncreasingIndexMap σ) (hτ : IsStrictlyIncreasingIndexMap τ) :
    IsSubsequenceOf (fun k => x (σ (τ k))) x
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
theorem SubsequenceOfSubsequence {x : RealSequence} {σ τ : ℕ → ℕ}
    (hσ : IsStrictlyIncreasingIndexMap σ) (hτ : IsStrictlyIncreasingIndexMap τ) :
    IsSubsequenceOf (fun k => x (σ (τ k))) x := by
  sorry
/--
`EventualPropertiesPassToSubsequences` TODO

Predicate logic:

  ∀ {P : Nat → Prop} {σ : Nat → Nat}, ((Exists fun N => ∀ (n : Nat), GE.ge n N → P n) ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → Exists fun K => ∀ (k : Nat), GE.ge k K → P (σ k)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    P : ℕ → Prop
    σ : ℕ → ℕ
  Prove
    ((Exists fun N => ∀ (n : Nat), instLENat.le N n → P n) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → Exists fun K => ∀ (k : Nat), instLENat.le K k → P (σ k)

Logical form (Lean):

```lean
theorem EventualPropertiesPassToSubsequences {P : ℕ → Prop} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, P n) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, P (σ k)
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
theorem EventualPropertiesPassToSubsequences {P : ℕ → Prop} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, P n) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, P (σ k) := by
  sorry
/--
`FrequentPropertiesYieldSubsequences` TODO

Predicate logic:

  ∀ {P : Nat → Prop}, (∀ (N : Nat), Exists fun n => (GE.ge n N ∧ P n)) → Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ (∀ (k : Nat), P (σ k)))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    P : ℕ → Prop
  Prove
    (∀ (N : Nat), Exists fun n => (instLENat.le N n ∧ P n)) → Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (k : Nat), P (σ k)))

Logical form (Lean):

```lean
theorem FrequentPropertiesYieldSubsequences {P : ℕ → Prop}
    (h : ∀ N : ℕ, ∃ n ≥ N, P n) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, P (σ k)
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
theorem FrequentPropertiesYieldSubsequences {P : ℕ → Prop}
    (h : ∀ N : ℕ, ∃ n ≥ N, P n) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, P (σ k) := by
  sorry
/--
`SubsequentialLimitsRespectBounds` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L m M : Real}, (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ (∀ (n : Nat), (Real.instLE.le m (x n) ∧ Real.instLE.le (x n) M))) → (Real.instLE.le m L ∧ Real.instLE.le L M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L m M : ℝ
  Prove
    ((Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))) ∧ (∀ (n : Nat), (Real.instLE.le m (x n) ∧ Real.instLE.le (x n) M))) → (Real.instLE.le m L ∧ Real.instLE.le L M)

Logical form (Lean):

```lean
theorem SubsequentialLimitsRespectBounds {x : RealSequence} {L m M : ℝ}
    (hL : IsSubsequentialLimit x L) (h : ∀ n, m ≤ x n ∧ x n ≤ M) :
    m ≤ L ∧ L ≤ M
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
theorem SubsequentialLimitsRespectBounds {x : RealSequence} {L m M : ℝ}
    (hL : IsSubsequentialLimit x L) (h : ∀ n, m ≤ x n ∧ x n ≤ M) :
    m ≤ L ∧ L ≤ M := by
  sorry
/--
`SqueezePassesToSubsequences` TODO

Predicate logic:

  ∀ {a x b : LRA.Analysis.Sequences.RealSequence} {σ : Nat → Nat}, ((Exists fun N => ∀ (n : Nat), GE.ge n N → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n))) ∧ LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ) → Exists fun K => ∀ (k : Nat), GE.ge k K → (Real.instLE.le (a (σ k)) (x (σ k)) ∧ Real.instLE.le (x (σ k)) (b (σ k)))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    a x b : RealSequence
    σ : ℕ → ℕ
  Prove
    ((Exists fun N => ∀ (n : Nat), instLENat.le N n → (Real.instLE.le (a n) (x n) ∧ Real.instLE.le (x n) (b n))) ∧ (∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l))) → Exists fun K => ∀ (k : Nat), instLENat.le K k → (Real.instLE.le (a (σ k)) (x (σ k)) ∧ Real.instLE.le (x (σ k)) (b (σ k)))

Logical form (Lean):

```lean
theorem SqueezePassesToSubsequences {a x b : RealSequence} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, a (σ k) ≤ x (σ k) ∧ x (σ k) ≤ b (σ k)
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
theorem SqueezePassesToSubsequences {a x b : RealSequence} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, a (σ k) ≤ x (σ k) ∧ x (σ k) ≤ b (σ k) := by
  sorry
/--
`MonotoneSubsequenceTheorem` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence), Exists fun σ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ Or (LRA.Analysis.Sequences.IsIncreasing fun k => x (σ k)) (LRA.Analysis.Sequences.IsDecreasing fun k => x (σ k)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (Or (∀ (n : Nat), Real.instLE.le ((fun k => x (σ k)) n) ((fun k => x (σ k)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) (∀ (n : Nat), Real.instLE.le ((fun k => x (σ k)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) ((fun k => x (σ k)) n))))

Logical form (Lean):

```lean
theorem MonotoneSubsequenceTheorem (x : RealSequence) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      (IsIncreasing (fun k => x (σ k)) ∨ IsDecreasing (fun k => x (σ k)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem MonotoneSubsequenceTheorem (x : RealSequence) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      (IsIncreasing (fun k => x (σ k)) ∨ IsDecreasing (fun k => x (σ k))) := by
  sorry
/--
`BolzanoWeierstrassSequences` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.BoundedSeq x → LRA.Analysis.Sequences.HasConvergentSubsequence x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
    h : BoundedSeq x
  Prove
    (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))) → Exists fun L => Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε))

Logical form (Lean):

```lean
theorem BolzanoWeierstrassSequences {x : RealSequence} (h : BoundedSeq x) :
    HasConvergentSubsequence x
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
theorem BolzanoWeierstrassSequences {x : RealSequence} (h : BoundedSeq x) :
    HasConvergentSubsequence x := by
  sorry
/--
`SequentialCompactnessClosedBoundedInterval` TODO

Predicate logic:

  ∀ {a b : Real} {x : LRA.Analysis.Sequences.RealSequence}, (Real.instLE.le a b ∧ (∀ (n : Nat), (Real.instLE.le a (x n) ∧ Real.instLE.le (x n) b))) → Exists fun σ => Exists fun L => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ ∧ (LRA.Analysis.Sequences.ConvergesTo (fun k => x (σ k)) L ∧ (Real.instLE.le a L ∧ Real.instLE.le L b)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    x : RealSequence
  Prove
    (Real.instLE.le a b ∧ (∀ (n : Nat), (Real.instLE.le a (x n) ∧ Real.instLE.le (x n) b))) → Exists fun σ => Exists fun L => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε) ∧ (Real.instLE.le a L ∧ Real.instLE.le L b)))

Logical form (Lean):

```lean
theorem SequentialCompactnessClosedBoundedInterval {a b : ℝ} {x : RealSequence}
    (hab : a ≤ b) (hx : ∀ n, a ≤ x n ∧ x n ≤ b) :
    ∃ σ : ℕ → ℕ, ∃ L : ℝ, IsStrictlyIncreasingIndexMap σ ∧
      ConvergesTo (fun k => x (σ k)) L ∧ a ≤ L ∧ L ≤ b
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
theorem SequentialCompactnessClosedBoundedInterval {a b : ℝ} {x : RealSequence}
    (hab : a ≤ b) (hx : ∀ n, a ≤ x n ∧ x n ≤ b) :
    ∃ σ : ℕ → ℕ, ∃ L : ℝ, IsStrictlyIncreasingIndexMap σ ∧
      ConvergesTo (fun k => x (σ k)) L ∧ a ≤ L ∧ L ≤ b := by
  sorry
/--
`SubsequencePrinciple` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (σ : Nat → Nat), LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ → Exists fun τ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap τ ∧ LRA.Analysis.Sequences.ConvergesTo (fun k => x (σ (τ k))) L)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    LRA.Analysis.Sequences.ConvergesTo x L ↔ ∀ (σ : Nat → Nat), LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap σ → Exists fun τ => (LRA.Analysis.Sequences.IsStrictlyIncreasingIndexMap τ ∧ LRA.Analysis.Sequences.ConvergesTo (fun k => x (σ (τ k))) L)

Logical form (Lean):

```lean
theorem SubsequencePrinciple {x : RealSequence} {L : ℝ} :
    ConvergesTo x L ↔
      ∀ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ →
        ∃ τ : ℕ → ℕ, IsStrictlyIncreasingIndexMap τ ∧
          ConvergesTo (fun k => x (σ (τ k))) L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem SubsequencePrinciple {x : RealSequence} {L : ℝ} :
    ConvergesTo x L ↔
      ∀ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ →
        ∃ τ : ℕ → ℕ, IsStrictlyIncreasingIndexMap τ ∧
          ConvergesTo (fun k => x (σ (τ k))) L := by
  sorry
/--
`BoundedSequenceConvergesIffUniqueSubsequentialLimit` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, LRA.Analysis.Sequences.BoundedSeq x → LRA.Analysis.Sequences.ConvergesTo x L ↔ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ (∀ (K : Real), LRA.Analysis.Sequences.IsSubsequentialLimit x K → K = L))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
    hbdd : BoundedSeq x
  Prove
    LRA.Analysis.Sequences.BoundedSeq x → LRA.Analysis.Sequences.ConvergesTo x L ↔ (LRA.Analysis.Sequences.IsSubsequentialLimit x L ∧ (∀ (K : Real), LRA.Analysis.Sequences.IsSubsequentialLimit x K → K = L))

Logical form (Lean):

```lean
theorem BoundedSequenceConvergesIffUniqueSubsequentialLimit
    {x : RealSequence} {L : ℝ} (hbdd : BoundedSeq x) :
    ConvergesTo x L ↔
      (IsSubsequentialLimit x L ∧ ∀ K, IsSubsequentialLimit x K → K = L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem BoundedSequenceConvergesIffUniqueSubsequentialLimit
    {x : RealSequence} {L : ℝ} (hbdd : BoundedSeq x) :
    ConvergesTo x L ↔
      (IsSubsequentialLimit x L ∧ ∀ K, IsSubsequentialLimit x K → K = L) := by
  sorry
end LRA.Analysis.Sequences
