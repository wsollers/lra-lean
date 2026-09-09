
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.MeanValueTheorem
import LRA.Analysis.Differentiation.GraphReading
import LRA.Analysis.Limits

namespace LRA.Analysis.Differentiation

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Df Dg α : ℝ}

/--
`ConstantMultipleRule` TODO

Predicate logic:

  ∀ {f : Real → Real} {A : Set Real} {c Df : Real}, LRA.Analysis.Differentiation.Derivative Df f A c → ∀ (α : Real), LRA.Analysis.Differentiation.Derivative (instHMul.hMul α Df) (fun x => instHMul.hMul α (f x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    hf : Derivative Df f A c
    α : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) → ∀ (α ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul α (f x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul α (f x)) c)) h) ({ hMul := fun a b => Real.instMul.mul a b }.hMul α Df))) ε))

Logical form (Lean):

```lean
theorem ConstantMultipleRule (hf : Derivative Df f A c) (α : ℝ) :
    Derivative (α * Df) (fun x => α * f x) A c
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
theorem ConstantMultipleRule (hf : Derivative Df f A c) (α : ℝ) :
    Derivative (α * Df) (fun x => α * f x) A c := by
  sorry
/--
`SumRule` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Df Dg : Real}, (LRA.Analysis.Differentiation.Derivative Df f A c ∧ LRA.Analysis.Differentiation.Derivative Dg g A c) → LRA.Analysis.Differentiation.Derivative (instHAdd.hAdd Df Dg) (fun x => instHAdd.hAdd (f x) (g x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    hf : Derivative Df f A c
    hg : Derivative Dg g A c
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (g c)) h) Dg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) c)) h) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd Df Dg))) ε))

Logical form (Lean):

```lean
theorem SumRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df + Dg) (fun x => f x + g x) A c
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
theorem SumRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df + Dg) (fun x => f x + g x) A c := by
  sorry
/--
`ProductRule` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Df Dg : Real}, (LRA.Analysis.Differentiation.Derivative Df f A c ∧ LRA.Analysis.Differentiation.Derivative Dg g A c) → LRA.Analysis.Differentiation.Derivative (instHAdd.hAdd (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg)) (fun x => instHMul.hMul (f x) (g x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    hf : Derivative Df f A c
    hg : Derivative Dg g A c
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (g c)) h) Dg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) c)) h) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul Df (g c)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f c) Dg)))) ε))

Logical form (Lean):

```lean
theorem ProductRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c
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
theorem ProductRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c := by
  sorry
/--
`QuotientRule` TODO

Predicate logic:

  ∀ {f g : Real → Real} {A : Set Real} {c Df Dg : Real}, (LRA.Analysis.Differentiation.Derivative Df f A c ∧ (LRA.Analysis.Differentiation.Derivative Dg g A c ∧ Ne (g c) 0)) → LRA.Analysis.Differentiation.Derivative (instHDiv.hDiv (instHSub.hSub (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg)) (instHPow.hPow (g c) 2)) (fun x => instHDiv.hDiv (f x) (g x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    hf : Derivative Df f A c
    hg : Derivative Dg g A c
    hgc : g c ≠ 0
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (g c)) h) Dg)) ε))) ∧ (g c = 0 → False))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) c)) h) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul Df (g c)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f c) Dg)) (instHPow.1 (g c) 2)))) ε))

Logical form (Lean):

```lean
theorem QuotientRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c)
    (hgc : g c ≠ 0) :
    Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c
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
theorem QuotientRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c)
    (hgc : g c ≠ 0) :
    Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c := by
  sorry
/--
`FiniteSumRule` TODO

Predicate logic:

  ∀ {A : Set Real} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (αs Ds : Fin n → Real), (∀ (i : Fin n), LRA.Analysis.Differentiation.Derivative (Ds i) (fs i) A c) → LRA.Analysis.Differentiation.Derivative (Finset.univ.sum fun i => instHMul.hMul (αs i) (Ds i)) (fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    n : ℕ
    fs : Fin n → ℝ → ℝ
    αs : Fin n → ℝ
    Ds : Fin n → ℝ
  Prove
    (∀ (i : Fin n) (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fs i ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fs i c)) h) (Ds i))) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (fs i x)) l)) ⋯)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (fs i x)) l)) ⋯)) c)) h) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (Ds i)) l)) ⋯)))) ε))

Logical form (Lean):

```lean
theorem FiniteSumRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c
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
theorem FiniteSumRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry
/--
`ExtendedProductRule` TODO

Predicate logic:

  ∀ {A : Set Real} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (Ds : Fin n → Real), (∀ (i : Fin n), LRA.Analysis.Differentiation.Derivative (Ds i) (fs i) A c) → LRA.Analysis.Differentiation.Derivative (Finset.univ.sum fun k => instHMul.hMul (Ds k) ((Finset.univ.erase k).prod fun i => fs i c)) (fun x => Finset.univ.prod fun i => fs i x) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    n : ℕ
    fs : Fin n → ℝ → ℝ
    Ds : Fin n → ℝ
  Prove
    (∀ (i : Fin n) (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fs i ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fs i c)) h) (Ds i))) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hMul := fun a b => Real.instCommMonoid.toMulOneClass.mul a b }.hMul x1 x2) 1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => fs i x) l)) ⋯)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hMul := fun a b => Real.instCommMonoid.toMulOneClass.mul a b }.hMul x1 x2) 1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => fs i x) l)) ⋯)) c)) h) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun k => instHMul.hMul (Ds k) ((Finset.univ.erase k).prod fun i => fs i c)) l)) ⋯)))) ε))

Logical form (Lean):

```lean
theorem ExtendedProductRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c)
      (fun x => ∏ i, fs i x) A c
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
theorem ExtendedProductRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c)
      (fun x => ∏ i, fs i x) A c := by
  sorry
/--
`PowerRuleSpecialCase` TODO

Predicate logic:

  ∀ {f : Real → Real} {A : Set Real} {c Df : Real}, LRA.Analysis.Differentiation.Derivative Df f A c → ∀ (n : Nat), LRA.Analysis.Differentiation.Derivative (instHMul.hMul (instHMul.hMul n.cast (instHPow.hPow (f c) (instHSub.hSub n 1))) Df) (fun x => instHPow.hPow (f x) n) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    hf : Derivative Df f A c
    n : ℕ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) → ∀ (n : Nat) (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => instHPow.1 (f x) n) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => instHPow.1 (f x) n) c)) h) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hMul := fun a b => Real.instMul.mul a b }.hMul (Real.instNatCast.1 n) (instHPow.1 (f c) ({ hSub := fun a b => instSubNat.sub a b }.hSub n 1))) Df))) ε))

Logical form (Lean):

```lean
theorem PowerRuleSpecialCase (hf : Derivative Df f A c) (n : ℕ) :
    Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c
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
theorem PowerRuleSpecialCase (hf : Derivative Df f A c) (n : ℕ) :
    Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c := by
  sorry
/--
`FiniteLinearCombinationRule` TODO

Predicate logic:

  ∀ {A : Set Real} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (αs Ds : Fin n → Real), (∀ (i : Fin n), LRA.Analysis.Differentiation.Derivative (Ds i) (fs i) A c) → LRA.Analysis.Differentiation.Derivative (Finset.univ.sum fun i => instHMul.hMul (αs i) (Ds i)) (fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    n : ℕ
    fs : Fin n → ℝ → ℝ
    αs : Fin n → ℝ
    Ds : Fin n → ℝ
  Prove
    (∀ (i : Fin n) (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fs i ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fs i c)) h) (Ds i))) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (fs i x)) l)) ⋯)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) ((fun x => Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (fs i x)) l)) ⋯)) c)) h) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (αs i) (Ds i)) l)) ⋯)))) ε))

Logical form (Lean):

```lean
theorem FiniteLinearCombinationRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ)
    (Ds : Fin n → ℝ) (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c
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
theorem FiniteLinearCombinationRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ)
    (Ds : Fin n → ℝ) (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry
/--
`IntervalFormsOfAlgebraRules` TODO

Predicate logic:

  ∀ (I : Set Real), I.OrdConnected → ∀ (f g fD gD : Real → Real) (α : Real), ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD x) f I x) ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (gD x) g I x)) → ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (instHMul.hMul α (fD x)) (fun y => instHMul.hMul α (f y)) I x) ∧ ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (instHAdd.hAdd (fD x) (gD x)) (fun y => instHAdd.hAdd (f y) (g y)) I x) ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (instHAdd.hAdd (instHMul.hMul (fD x) (g x)) (instHMul.hMul (f x) (gD x))) (fun y => instHMul.hMul (f y) (g y)) I x)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    I : Set ℝ
    hI : I.OrdConnected
    f g : ℝ → ℝ
    fD gD : ℝ → ℝ
    α : ℝ
  Prove
    Set.OrdConnected I → ∀ (f g fD gD : Real → Real) (α : Real), ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) (gD x))) ε)))) → ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun y => { hMul := fun a b => Real.instMul.mul a b }.hMul α (f y)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) ((fun y => { hMul := fun a b => Real.instMul.mul a b }.hMul α (f y)) x)) h) ({ hMul := fun a b => Real.instMul.mul a b }.hMul α (fD x)))) ε))) ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun y => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f y) (g y)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) ((fun y => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f y) (g y)) x)) h) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (fD x) (gD x)))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun y => { hMul := fun a b => Real.instMul.mul a b }.hMul (f y) (g y)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) ((fun y => { hMul := fun a b => Real.instMul.mul a b }.hMul (f y) (g y)) x)) h) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul (fD x) (g x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (gD x))))) ε)))))

Logical form (Lean):

```lean
theorem IntervalFormsOfAlgebraRules (I : Set ℝ) (hI : I.OrdConnected)
    (f g : ℝ → ℝ) (fD gD : ℝ → ℝ) (α : ℝ)
    (hf : ∀ x ∈ I, Derivative (fD x) f I x) (hg : ∀ x ∈ I, Derivative (gD x) g I x) :
    (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧
    (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧
    (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x)
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
theorem IntervalFormsOfAlgebraRules (I : Set ℝ) (hI : I.OrdConnected)
    (f g : ℝ → ℝ) (fD gD : ℝ → ℝ) (α : ℝ)
    (hf : ∀ x ∈ I, Derivative (fD x) f I x) (hg : ∀ x ∈ I, Derivative (gD x) g I x) :
    (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧
    (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧
    (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x) := by
  sorry
/--
`InverseFunctionTheoremOneVariable` TODO

Predicate logic:

  ∀ (f fD1 : Real → Real) (I : Set Real), (IsOpen I ∧ LRA.Analysis.Differentiation.IsClassC1 f fD1 I) → ∀ (c : Real), (c ∈ I ∧ Ne (fD1 c) 0) → Exists fun U => Exists fun V => (IsOpen U ∧ (IsOpen V ∧ (c ∈ U ∧ (f c ∈ V ∧ (Set.instLE.le U I ∧ (Set.BijOn f U V ∧ (Exists fun g => ((∀ (x : Real), x ∈ U → g (f x) = x) ∧ ((∀ (y : Real), y ∈ V → f (g y) = y) ∧ (Exists fun gD1 => (LRA.Analysis.Differentiation.IsClassC1 g gD1 V ∧ (∀ (y : Real), y ∈ V → Exists fun x => (x ∈ U ∧ (f x = y ∧ instHMul.hMul (gD1 y) (fD1 x) = 1))))))))))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    f fD1 : ℝ → ℝ
    I : Set ℝ
    c : ℝ
    hnz : fD1 c ≠ 0
  Prove
    (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 I ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε))))) → ∀ (c : Real), (c ∈ I ∧ (fD1 c = 0 → False)) → Exists fun U => Exists fun V => (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 U ∧ (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 V ∧ (c ∈ U ∧ (f c ∈ V ∧ (({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le U I) ∧ (((∀ ⦃x : Real⦄, x ∈ U → f x ∈ V) ∧ ((∀ ⦃x₁ : Real⦄, x₁ ∈ U → ∀ ⦃x₂ : Real⦄, x₂ ∈ U → f x₁ = f x₂ → x₁ = x₂) ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le V fun x => Exists fun a => (a ∈ U ∧ f a = x)))) ∧ (Exists fun g => ((∀ (x : Real), x ∈ U → g (f x) = x) ∧ ((∀ (y : Real), y ∈ V → f (g y) = y) ∧ (Exists fun gD1 => (((∀ (x : Real), x ∈ V → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ V → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) (gD1 x))) ε))) ∧ (∀ (x : Real), x ∈ V → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ V → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (gD1 x_1) (gD1 x))) ε)))) ∧ (∀ (y : Real), y ∈ V → Exists fun x => (x ∈ U ∧ (f x = y ∧ { hMul := fun a b => Real.instMul.mul a b }.hMul (gD1 y) (fD1 x) = 1))))))))))))))

Logical form (Lean):

```lean
theorem InverseFunctionTheoremOneVariable (f fD1 : ℝ → ℝ) (I : Set ℝ) (hI : IsOpen I)
    (hclass : IsClassC1 f fD1 I) (c : ℝ) (hc : c ∈ I) (hnz : fD1 c ≠ 0) :
    ∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧
      Set.BijOn f U V ∧
      ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧
        ∃ gD1 : ℝ → ℝ, IsClassC1 g gD1 V ∧
          ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1
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
theorem InverseFunctionTheoremOneVariable (f fD1 : ℝ → ℝ) (I : Set ℝ) (hI : IsOpen I)
    (hclass : IsClassC1 f fD1 I) (c : ℝ) (hc : c ∈ I) (hnz : fD1 c ≠ 0) :
    ∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧
      Set.BijOn f U V ∧
      ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧
        ∃ gD1 : ℝ → ℝ, IsClassC1 g gD1 V ∧
          ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1 := by
  sorry
/--
`InverseFunctionDerivative` TODO

Predicate logic:

  ∀ (f g fD1 : Real → Real) (U V : Set Real), ((∀ (x : Real), x ∈ U → LRA.Analysis.Differentiation.Derivative (fD1 x) f U x) ∧ ((∀ (x : Real), x ∈ U → Ne (fD1 x) 0) ∧ ((∀ (y : Real), y ∈ V → g y ∈ U) ∧ ((∀ (x : Real), x ∈ U → g (f x) = x) ∧ (∀ (y : Real), y ∈ V → f (g y) = y))))) → ∀ (y : Real), y ∈ V → LRA.Analysis.Differentiation.Derivative (instHDiv.hDiv 1 (fD1 (g y))) g V y

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    f g fD1 : ℝ → ℝ
    U V : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ U → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ U → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ ((∀ (x : Real), x ∈ U → fD1 x = 0 → False) ∧ ((∀ (y : Real), y ∈ V → g y ∈ U) ∧ ((∀ (x : Real), x ∈ U → g (f x) = x) ∧ (∀ (y : Real), y ∈ V → f (g y) = y))))) → ∀ (y : Real), y ∈ V → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd y h ∈ V → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd y h)) (g y)) h) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (fD1 (g y))))) ε))

Logical form (Lean):

```lean
theorem InverseFunctionDerivative (f g fD1 : ℝ → ℝ) (U V : Set ℝ)
    (hf : ∀ x ∈ U, Derivative (fD1 x) f U x) (hnz : ∀ x ∈ U, fD1 x ≠ 0)
    (hgVU : ∀ y ∈ V, g y ∈ U)
    (hinv : ∀ x ∈ U, g (f x) = x) (hinv' : ∀ y ∈ V, f (g y) = y) :
    ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y
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
theorem InverseFunctionDerivative (f g fD1 : ℝ → ℝ) (U V : Set ℝ)
    (hf : ∀ x ∈ U, Derivative (fD1 x) f U x) (hnz : ∀ x ∈ U, fD1 x ≠ 0)
    (hgVU : ∀ y ∈ V, g y ∈ U)
    (hinv : ∀ x ∈ U, g (f x) = x) (hinv' : ∀ y ∈ V, f (g y) = y) :
    ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y := by
  sorry
open LRA.Analysis.Limits in

/--
`LhopitalZeroOverZero` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Ioo a b) x) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable g (Set.Ioo a b) x) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D g (Set.Ioo a b) x → Ne D 0) ∧ (LRA.Analysis.Limits.TendsToRight f (Set.Ioo a b) a 0 ∧ LRA.Analysis.Limits.TendsToRight g (Set.Ioo a b) a 0))))) → ∀ (fD gD : Real → Real), ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.Derivative (fD x) f (Set.Ioo a b) x) ∧ (∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.Derivative (gD x) g (Set.Ioo a b) x)) → ∀ (L : Real), LRA.Analysis.Limits.TendsToRight (fun x => instHDiv.hDiv (fD x) (gD x)) (Set.Ioo a b) a L → LRA.Analysis.Limits.TendsToRight (fun x => instHDiv.hDiv (f x) (g x)) (Set.Ioo a b) a L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    f g : ℝ → ℝ
    a b : ℝ
    hf0 : TendsToRight f (Set.Ioo a b) a 0
    hg0 : TendsToRight g (Set.Ioo a b) a 0
    fD gD : ℝ → ℝ
    L : ℝ
    hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) D)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) D)) ε))) → D = 0 → False) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) 0)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) 0)) ε)))))))) → ∀ (fD gD : Real → Real), ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD x))) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) (gD x))) ε)))) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (fD x) (gD x)) x) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x) L)) ε))

Logical form (Lean):

```lean
theorem LhopitalZeroOverZero (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hf0 : TendsToRight f (Set.Ioo a b) a 0) (hg0 : TendsToRight g (Set.Ioo a b) a 0)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L
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
theorem LhopitalZeroOverZero (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hf0 : TendsToRight f (Set.Ioo a b) a 0) (hg0 : TendsToRight g (Set.Ioo a b) a 0)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry
open LRA.Analysis.Limits in

/--
`LhopitalInfinityOverInfinity` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Ioo a b) x) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable g (Set.Ioo a b) x) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D g (Set.Ioo a b) x → Ne D 0) ∧ (∀ (M : Real), GT.gt M 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ Set.Ioo a b → Real.instLT.lt x (instHAdd.hAdd a δ) → GT.gt (abs (g x)) M))))))) → ∀ (fD gD : Real → Real), ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.Derivative (fD x) f (Set.Ioo a b) x) ∧ (∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.Derivative (gD x) g (Set.Ioo a b) x)) → ∀ (L : Real), LRA.Analysis.Limits.TendsToRight (fun x => instHDiv.hDiv (fD x) (gD x)) (Set.Ioo a b) a L → LRA.Analysis.Limits.TendsToRight (fun x => instHDiv.hDiv (f x) (g x)) (Set.Ioo a b) a L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    c Df Dg α : ℝ
    f g : ℝ → ℝ
    a b : ℝ
    fD gD : ℝ → ℝ
    L : ℝ
    hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) D)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) D)) ε))) → D = 0 → False) ∧ (∀ (M : Real), Real.instLT.lt 0 M → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt M (abs (g x))))))))) → ∀ (fD gD : Real → Real), ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD x))) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) (gD x))) ε)))) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (fD x) (gD x)) x) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt a x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x) L)) ε))

Logical form (Lean):

```lean
theorem LhopitalInfinityOverInfinity (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hgInf : ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L
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
theorem LhopitalInfinityOverInfinity (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hgInf : ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry
end LRA.Analysis.Differentiation
