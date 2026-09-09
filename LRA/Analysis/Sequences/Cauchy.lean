
import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

/--
`IsCauchy` TODO

Predicate logic:

  ∀ (x : LRA.Analysis.Sequences.RealSequence) (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (x m) (x n))) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε

Logical form (Lean):

```lean
def IsCauchy (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε
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
def IsCauchy (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε

/--
`ConvergentSequencesAreCauchy` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L) → LRA.Analysis.Sequences.IsCauchy x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε

Logical form (Lean):

```lean
theorem ConvergentSequencesAreCauchy {x : RealSequence}
    (h : ∃ L : ℝ, ConvergesTo x L) : IsCauchy x
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
theorem ConvergentSequencesAreCauchy {x : RealSequence}
    (h : ∃ L : ℝ, ConvergesTo x L) : IsCauchy x := by
  sorry
/--
`CauchySequencesAreBounded` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsCauchy x → LRA.Analysis.Sequences.BoundedSeq x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) → Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs (x n)) M))

Logical form (Lean):

```lean
theorem CauchySequencesAreBounded {x : RealSequence} (h : IsCauchy x) :
    BoundedSeq x
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
theorem CauchySequencesAreBounded {x : RealSequence} (h : IsCauchy x) :
    BoundedSeq x := by
  sorry
/--
`CauchyConvergentSubsequenceConverges` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {L : Real}, (LRA.Analysis.Sequences.IsCauchy x ∧ LRA.Analysis.Sequences.IsSubsequentialLimit x L) → LRA.Analysis.Sequences.ConvergesTo x L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    L : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (Exists fun σ => ((∀ (k l : Nat), instLTNat.lt k l → instLTNat.lt (σ k) (σ l)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun k => x (σ k)) n) L)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x n) L)) ε

Logical form (Lean):

```lean
theorem CauchyConvergentSubsequenceConverges {x : RealSequence} {L : ℝ}
    (hcauchy : IsCauchy x) (hsub : IsSubsequentialLimit x L) :
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

Related proof moves: TODO

-/
theorem CauchyConvergentSubsequenceConverges {x : RealSequence} {L : ℝ}
    (hcauchy : IsCauchy x) (hsub : IsSubsequentialLimit x L) :
    ConvergesTo x L := by
  sorry
/--
`CauchyCriterionRealSequences` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.IsCauchy x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    Exists fun L => LRA.Analysis.Sequences.ConvergesTo x L ↔ LRA.Analysis.Sequences.IsCauchy x

Logical form (Lean):

```lean
theorem CauchyCriterionRealSequences {x : RealSequence} :
    (∃ L : ℝ, ConvergesTo x L) ↔ IsCauchy x
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
theorem CauchyCriterionRealSequences {x : RealSequence} :
    (∃ L : ℝ, ConvergesTo x L) ↔ IsCauchy x := by
  sorry
/--
`CauchyCriterionViaTails` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsCauchy x ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (p q : Nat), Real.instLT.lt (abs (instHSub.hSub (x (instHAdd.hAdd N p)) (x (instHAdd.hAdd N q)))) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.IsCauchy x ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (p q : Nat), Real.instLT.lt (abs (instHSub.hSub (x (instHAdd.hAdd N p)) (x (instHAdd.hAdd N q)))) ε

Logical form (Lean):

```lean
theorem CauchyCriterionViaTails {x : RealSequence} :
    IsCauchy x ↔ ∀ ε > 0, ∃ N : ℕ, ∀ p q : ℕ, |x (N + p) - x (N + q)| < ε
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
theorem CauchyCriterionViaTails {x : RealSequence} :
    IsCauchy x ↔ ∀ ε > 0, ∃ N : ℕ, ∀ p q : ℕ, |x (N + p) - x (N + q)| < ε := by
  sorry
/--
`CauchyTailDiameterCriterion` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsCauchy x ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun N₀ => ∀ (N : Nat), GE.ge N N₀ → ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (x m) (x n))) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    LRA.Analysis.Sequences.IsCauchy x ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun N₀ => ∀ (N : Nat), GE.ge N N₀ → ∀ (m : Nat), GE.ge m N → ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (x m) (x n))) ε

Logical form (Lean):

```lean
theorem CauchyTailDiameterCriterion {x : RealSequence} :
    IsCauchy x ↔
      ∀ ε > 0, ∃ N₀ : ℕ, ∀ N ≥ N₀, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε
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
theorem CauchyTailDiameterCriterion {x : RealSequence} :
    IsCauchy x ↔
      ∀ ε > 0, ∃ N₀ : ℕ, ∀ N ≥ N₀, ∀ m ≥ N, ∀ n ≥ N, |x m - x n| < ε := by
  sorry
/--
`CauchySuccessiveDifferencesVanish` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsCauchy x → LRA.Analysis.Sequences.IsNull fun n => abs (instHSub.hSub (x (instHAdd.hAdd n 1)) (x n))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ((fun n => abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) (x n))) n)) ε

Logical form (Lean):

```lean
theorem CauchySuccessiveDifferencesVanish {x : RealSequence}
    (h : IsCauchy x) : IsNull (fun n => |x (n + 1) - x n|)
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
theorem CauchySuccessiveDifferencesVanish {x : RealSequence}
    (h : IsCauchy x) : IsNull (fun n => |x (n + 1) - x n|) := by
  sorry
/--
`ScalarMultipleCauchySequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence} {α : Real}, LRA.Analysis.Sequences.IsCauchy x → LRA.Analysis.Sequences.IsCauchy fun n => instHMul.hMul α (x n)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : RealSequence
    α : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) m) ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) n))) ε

Logical form (Lean):

```lean
theorem ScalarMultipleCauchySequence {x : RealSequence} {α : ℝ}
    (h : IsCauchy x) : IsCauchy (fun n => α * x n)
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
theorem ScalarMultipleCauchySequence {x : RealSequence} {α : ℝ}
    (h : IsCauchy x) : IsCauchy (fun n => α * x n) := by
  sorry
/--
`SumCauchySequences` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsCauchy x ∧ LRA.Analysis.Sequences.IsCauchy y) → LRA.Analysis.Sequences.IsCauchy fun n => instHAdd.hAdd (x n) (y n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : RealSequence
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y m) (y n))) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) (y n)) m) ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (x n) (y n)) n))) ε

Logical form (Lean):

```lean
theorem SumCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n + y n)
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
theorem SumCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n + y n) := by
  sorry
/--
`DifferenceCauchySequences` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsCauchy x ∧ LRA.Analysis.Sequences.IsCauchy y) → LRA.Analysis.Sequences.IsCauchy fun n => instHSub.hSub (x n) (y n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : RealSequence
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y m) (y n))) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hSub := fun a b => Real.instSub.sub a b }.hSub (x n) (y n)) m) ((fun n => { hSub := fun a b => Real.instSub.sub a b }.hSub (x n) (y n)) n))) ε

Logical form (Lean):

```lean
theorem DifferenceCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n - y n)
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
theorem DifferenceCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n - y n) := by
  sorry
/--
`LinearCombinationCauchySequences` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence} {α β : Real}, (LRA.Analysis.Sequences.IsCauchy x ∧ LRA.Analysis.Sequences.IsCauchy y) → LRA.Analysis.Sequences.IsCauchy fun n => instHAdd.hAdd (instHMul.hMul α (x n)) (instHMul.hMul β (y n))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : RealSequence
    α β : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y m) (y n))) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul β (y n))) m) ((fun n => { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (x n)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul β (y n))) n))) ε

Logical form (Lean):

```lean
theorem LinearCombinationCauchySequences {x y : RealSequence} {α β : ℝ}
    (hx : IsCauchy x) (hy : IsCauchy y) :
    IsCauchy (fun n => α * x n + β * y n)
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
theorem LinearCombinationCauchySequences {x y : RealSequence} {α β : ℝ}
    (hx : IsCauchy x) (hy : IsCauchy y) :
    IsCauchy (fun n => α * x n + β * y n) := by
  sorry
/--
`ProductCauchySequences` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsCauchy x ∧ LRA.Analysis.Sequences.IsCauchy y) → LRA.Analysis.Sequences.IsCauchy fun n => instHMul.hMul (x n) (y n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : RealSequence
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y m) (y n))) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul (x n) (y n)) m) ((fun n => { hMul := fun a b => Real.instMul.mul a b }.hMul (x n) (y n)) n))) ε

Logical form (Lean):

```lean
theorem ProductCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n * y n)
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
theorem ProductCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y) : IsCauchy (fun n => x n * y n) := by
  sorry
/--
`ReciprocalCauchySequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsCauchy x ∧ (Exists fun c => (GT.gt c 0 ∧ (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le c (abs (x n)))))) → LRA.Analysis.Sequences.IsCauchy fun n => instHDiv.hDiv 1 (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ (Exists fun c => (Real.instLT.lt 0 c ∧ (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → Real.instLE.le c (abs (x n)))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (x n)) m) ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (x n)) n))) ε

Logical form (Lean):

```lean
theorem ReciprocalCauchySequence {x : RealSequence}
    (hx : IsCauchy x) (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |x n|) :
    IsCauchy (fun n => 1 / x n)
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
theorem ReciprocalCauchySequence {x : RealSequence}
    (hx : IsCauchy x) (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |x n|) :
    IsCauchy (fun n => 1 / x n) := by
  sorry
/--
`QuotientCauchySequences` TODO

Predicate logic:

  ∀ {x y : LRA.Analysis.Sequences.RealSequence}, (LRA.Analysis.Sequences.IsCauchy x ∧ (LRA.Analysis.Sequences.IsCauchy y ∧ (Exists fun c => (GT.gt c 0 ∧ (Exists fun N₀ => ∀ (n : Nat), GE.ge n N₀ → Real.instLE.le c (abs (y n))))))) → LRA.Analysis.Sequences.IsCauchy fun n => instHDiv.hDiv (x n) (y n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x y : RealSequence
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (y m) (y n))) ε) ∧ (Exists fun c => (Real.instLT.lt 0 c ∧ (Exists fun N₀ => ∀ (n : Nat), instLENat.le N₀ n → Real.instLE.le c (abs (y n))))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (x n) (y n)) m) ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (x n) (y n)) n))) ε

Logical form (Lean):

```lean
theorem QuotientCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y)
    (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |y n|) :
    IsCauchy (fun n => x n / y n)
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
theorem QuotientCauchySequences {x y : RealSequence}
    (hx : IsCauchy x) (hy : IsCauchy y)
    (h : ∃ c > 0, ∃ N₀ : ℕ, ∀ n ≥ N₀, c ≤ |y n|) :
    IsCauchy (fun n => x n / y n) := by
  sorry
/--
`AbsoluteValueCauchySequence` TODO

Predicate logic:

  ∀ {x : LRA.Analysis.Sequences.RealSequence}, LRA.Analysis.Sequences.IsCauchy x → LRA.Analysis.Sequences.IsCauchy fun n => abs (x n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : RealSequence
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (x m) (x n))) ε) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (m : Nat), instLENat.le N m → ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => abs (x n)) m) ((fun n => abs (x n)) n))) ε

Logical form (Lean):

```lean
theorem AbsoluteValueCauchySequence {x : RealSequence} (h : IsCauchy x) :
    IsCauchy (fun n => |x n|)
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
theorem AbsoluteValueCauchySequence {x : RealSequence} (h : IsCauchy x) :
    IsCauchy (fun n => |x n|) := by
  sorry
end LRA.Analysis.Sequences
