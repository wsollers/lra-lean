
import Mathlib.Order.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

/--
`ExampleConstantSequence` TODO

Predicate logic:

  ∀ (c : Real), LRA.Analysis.Sequences.ConvergesTo (fun x => c) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c : ℝ
  Prove
    Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => c) n) c)) ε

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

  ((∀ (n : Nat), Real.instLT.lt (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 2)) (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1))) ∧ ((∀ (n : Nat), Real.instLE.le 0 (instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1))) ∧ LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv 1 (instHAdd.hAdd n.cast 1)) 0))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (n : Nat), Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 2)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1))) ∧ ((∀ (n : Nat), Real.instLE.le 0 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1)) n) 0)) ε)))

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

  (¬ Monotone fun n => instHDiv.hDiv (instHPow.hPow (-1) n) (instHAdd.hAdd n.cast 1) ∧ LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv (instHPow.hPow (-1) n) (instHAdd.hAdd n.cast 1)) 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ ⦃a b : Nat⦄, Nat.instPreorder.1.le a b → Real.instPreorder.1.le ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (instHPow.1 (-1) n) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1)) a) ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (instHPow.1 (-1) n) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1)) b)) → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (instHPow.1 (-1) n) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 1)) n) 0)) ε))

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

  (LRA.Analysis.Sequences.BoundedSeq fun n => instHPow.hPow (-1) n ∧ (LRA.Analysis.Sequences.IsOscillatory fun n => instHPow.hPow (-1) n ∧ (LRA.Analysis.Sequences.ConvergesTo (fun n => instHPow.hPow (-1) (instHMul.hMul 2 n)) 1 ∧ LRA.Analysis.Sequences.ConvergesTo (fun n => instHPow.hPow (-1) (instHAdd.hAdd (instHMul.hMul 2 n) 1)) (-1))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs ((fun n => instHPow.1 (-1) n) n)) M))) ∧ ((((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 (-1) n) n) L)) ε) → False) ∧ (((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M ((fun n => instHPow.1 (-1) n) n)) → False) ∧ ((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt ((fun n => instHPow.1 (-1) n) n) M) → False))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 (-1) ({ hMul := fun a b => instMulNat.mul a b }.hMul 2 n)) n) 1)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 (-1) ({ hAdd := fun a b => instAddNat.add a b }.hAdd ({ hMul := fun a b => instMulNat.mul a b }.hMul 2 n) 1)) n) (-1))) ε))))

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

  ((∀ (r : Real), Real.instLT.lt (abs r) 1 → LRA.Analysis.Sequences.ConvergesTo (fun n => instHPow.hPow r n) 0) ∧ (LRA.Analysis.Sequences.ConvergesTo (fun x => instHPow.hPow 1 0) 1 ∧ (LRA.Analysis.Sequences.IsOscillatory fun n => instHPow.hPow (-1) n ∧ (∀ (r : Real), GT.gt (abs r) 1 → ¬ LRA.Analysis.Sequences.BoundedSeq fun n => instHPow.hPow r n))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (r : Real), Real.instLT.lt (abs r) 1 → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 r n) n) 0)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => instHPow.1 1 0) n) 1)) ε) ∧ ((((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 (-1) n) n) L)) ε) → False) ∧ (((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M ((fun n => instHPow.1 (-1) n) n)) → False) ∧ ((∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt ((fun n => instHPow.1 (-1) n) n) M) → False))) ∧ (∀ (r : Real), Real.instLT.lt 1 (abs r) → (Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs ((fun n => instHPow.1 r n) n)) M))) → False))))

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

  (LRA.Analysis.Sequences.BoundedSeq fun n => instHPow.hPow (-1) n ∧ LRA.Analysis.Sequences.IsDivergent fun n => instHPow.hPow (-1) n)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs ((fun n => instHPow.1 (-1) n) n)) M))) ∧ ((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => instHPow.1 (-1) n) n) L)) ε) → False))

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

  (LRA.Analysis.Sequences.ConvergesTo (fun n => instHDiv.hDiv 1 (instHAdd.hAdd n.cast 2)) 0 ∧ ¬ LRA.Analysis.Sequences.BoundedSeq fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHDiv.hDiv 1 (instHAdd.hAdd k.cast 1))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (Real.instNatCast.1 n) 2)) n) 0)) ε) ∧ ((Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (n : Nat), Real.instLE.le (abs ((fun n => Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun k => instHDiv.hDiv 1 (instHAdd.hAdd k.cast 1)) (Finset.range (instHAdd.hAdd n 1)).val)) n)) M))) → False))

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
