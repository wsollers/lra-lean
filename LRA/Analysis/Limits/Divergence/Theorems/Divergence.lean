import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Divergence.Definition

namespace LRA.Analysis.Limits

/--
`HasJumpAtImpliesLimitDoesNotExist` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Limits.HasJumpAt f A c → LRA.Analysis.Limits.LimitDoesNotExist f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    ((Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) ∧ (L₁ = L₂ → False)))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε)))) → False

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Limits.Oscillates f A c → LRA.Analysis.Limits.LimitDoesNotExist f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    h : Oscillates f A c
  Prove
    ((Exists fun xs => Exists fun ys => (((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε))) ∧ (((∀ (n : Nat), ys n ∈ A) ∧ ((∀ (n : Nat), ys n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (ys n) c)) ε))) ∧ (Exists fun L₁ => Exists fun L₂ => ((L₁ = L₂ → False) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (Function.comp f xs) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₁) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (Function.comp f ys) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₂))))))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε)))) → False

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), ((∀ (δ : Real), GT.gt δ 0 → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ))) ∧ LRA.Analysis.Limits.DivergesToInftyAt f A c) → LRA.Analysis.Limits.LimitDoesNotExist f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    h : DivergesToInftyAt f A c
  Prove
    ((∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun x => (x ∈ A ∧ (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ))) ∧ ((∀ (M : Real), Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt M (f x)))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε))))) → False

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

  LRA.Analysis.Limits.HasJumpAt (fun x => ite (Real.instLT.lt x 0) 0 1) Set.univ 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun _a => True → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub 0 δ) x → Real.instLT.lt x 0 → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => Decidable.rec (fun h => (fun x => 1) h) (fun h => (fun x => 0) h) (Real.linearOrder.toDecidableLT x 0)) x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun _a => True → Real.instLT.lt 0 x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd 0 δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => Decidable.rec (fun h => (fun x => 1) h) (fun h => (fun x => 0) h) (Real.linearOrder.toDecidableLT x 0)) x) L₂)) ε))) ∧ (L₁ = L₂ → False)))

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

  LRA.Analysis.Limits.Oscillates (fun x => Real.sin (instHDiv.hDiv 1 x)) (setOf fun x => Ne x 0) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun xs => Exists fun ys => (((∀ (n : Nat), xs n ∈ fun x => x = 0 → False) ∧ ((∀ (n : Nat), xs n = 0 → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) 0)) ε))) ∧ (((∀ (n : Nat), ys n ∈ fun x => x = 0 → False) ∧ ((∀ (n : Nat), ys n = 0 → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (ys n) 0)) ε))) ∧ (Exists fun L₁ => Exists fun L₂ => ((L₁ = L₂ → False) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (Function.comp (fun x => Real.sin (instHDiv.hDiv 1 x)) xs) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₁) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (Function.comp (fun x => Real.sin (instHDiv.hDiv 1 x)) ys) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L₂))))))

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
