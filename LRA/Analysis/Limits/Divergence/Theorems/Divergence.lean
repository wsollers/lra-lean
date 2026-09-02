import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Divergence.Definition

namespace LRA.Analysis.Limits

/--
`HasJumpAtImpliesLimitDoesNotExist` TODO

Predicate logic:

  (ℝ → ℝ ∧ HasJumpAt f A c) → LimitDoesNotExist f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x) L₂))) ε) ∧ L₁ = L₂ → False)) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε)) → False

Logical form (Lean):

```lean
theorem HasJumpAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : HasJumpAt f A c) :
    LimitDoesNotExist f A c
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
theorem HasJumpAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : HasJumpAt f A c) :
    LimitDoesNotExist f A c := by
  sorry
/--
`OscillatesImpliesLimitDoesNotExist` TODO

Predicate logic:

  (ℝ → ℝ) → LimitDoesNotExist f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Exists fun xs => Exists fun ys => ((∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (xs n) c))) ε)) ∧ ((∀ (n : Nat), Set.instMembership.1 A (ys n) ∧ (∀ (n : Nat), ys n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (ys n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (ys n) c))) ε)) ∧ Exists fun L₁ => Exists fun L₂ => (L₁ = L₂ → False ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp f xs) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₁) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp f ys) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₂))))) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε)) → False

Logical form (Lean):

```lean
theorem OscillatesImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : Oscillates f A c) :
    LimitDoesNotExist f A c
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
theorem OscillatesImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : Oscillates f A c) :
    LimitDoesNotExist f A c := by
  sorry
/--
`DivergesToInftyAtImpliesLimitDoesNotExist` TODO

Predicate logic:

  (ℝ → ℝ ∧ ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ) → LimitDoesNotExist f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun x => (Set.instMembership.1 A x ∧ (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ)) ∧ (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 M (f x)) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (f x) L))) ε))) → False

Logical form (Lean):

```lean
theorem DivergesToInftyAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h : DivergesToInftyAt f A c) :
    LimitDoesNotExist f A c
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
theorem DivergesToInftyAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h : DivergesToInftyAt f A c) :
    LimitDoesNotExist f A c := by
  sorry
/--
`StepFunctionHasJumpAtZero` TODO

Predicate logic:

  HasJumpAt fun x ∈ ℝ => if x < 0 then 0 ∈ ℝ else 1 Set.univ 0

Predicate logic (unfolded):

  Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun _a => True) x → Real.instLT.1 (instHSub.1 Zero.toOfNat0.1 δ) x → Real.instLT.1 x Zero.toOfNat0.1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => ite (Real.instLT.lt x 0) 0 1) x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => ite (Real.instLT.lt x 0) 0 1) x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun _a => True) x → Real.instLT.1 Zero.toOfNat0.1 x → Real.instLT.1 x (instHAdd.1 Zero.toOfNat0.1 δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => ite (Real.instLT.lt x 0) 0 1) x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub ((fun x => ite (Real.instLT.lt x 0) 0 1) x) L₂))) ε) ∧ L₁ = L₂ → False))

Logical form (Lean):

```lean
theorem StepFunctionHasJumpAtZero :
    HasJumpAt (fun x : ℝ => if x < 0 then (0 : ℝ) else 1) Set.univ 0
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
theorem StepFunctionHasJumpAtZero :
    HasJumpAt (fun x : ℝ => if x < 0 then (0 : ℝ) else 1) Set.univ 0 := by
  sorry
/--
`SinOfReciprocalOscillatesAtZero` TODO

Predicate logic:

  Oscillates fun x ∈ ℝ => Real.sin (1 / x) {x : ℝ | x ≠ 0} 0

Predicate logic (unfolded):

  Exists fun xs => Exists fun ys => ((∀ (n : Nat), Set.instMembership.1 (fun x => x = 0 → False) (xs n) ∧ (∀ (n : Nat), xs n = Zero.toOfNat0.1 → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (xs n) 0))) ε)) ∧ ((∀ (n : Nat), Set.instMembership.1 (fun x => x = 0 → False) (ys n) ∧ (∀ (n : Nat), ys n = Zero.toOfNat0.1 → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (ys n) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (ys n) 0))) ε)) ∧ Exists fun L₁ => Exists fun L₂ => (L₁ = L₂ → False ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp (fun x => Real.sin (instHDiv.hDiv 1 x)) xs) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₁) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp (fun x => Real.sin (instHDiv.hDiv 1 x)) ys) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₂)))))

Logical form (Lean):

```lean
theorem SinOfReciprocalOscillatesAtZero :
    Oscillates (fun x : ℝ => Real.sin (1 / x)) {x : ℝ | x ≠ 0} 0
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
theorem SinOfReciprocalOscillatesAtZero :
    Oscillates (fun x : ℝ => Real.sin (1 / x)) {x : ℝ | x ≠ 0} 0 := by
  sorry
end LRA.Analysis.Limits
