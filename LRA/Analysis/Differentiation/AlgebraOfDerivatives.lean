
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

  Derivative (α * Df) (fun x => α * f x) A c

Predicate logic (unfolded):

  ∀ {f : Real → Real} {A : Real → Prop} {c Df : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε)) → ∀ (α ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => instHMul.hMul α (f x)) (instHAdd.hAdd c h)) ((fun x => instHMul.hMul α (f x)) c)) h) (instHMul.1 α Df)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => instHMul.hMul α (f x)) (instHAdd.hAdd c h)) ((fun x => instHMul.hMul α (f x)) c)) h) (instHMul.hMul α Df)))) ε)

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

  Derivative (Df + Dg) (fun x => f x + g x) A c

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {A : Real → Prop} {c Df Dg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => instHAdd.hAdd (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHAdd.hAdd (f x) (g x)) c)) h) (instHAdd.1 Df Dg)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => instHAdd.hAdd (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHAdd.hAdd (f x) (g x)) c)) h) (instHAdd.hAdd Df Dg)))) ε)

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

  Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {A : Real → Prop} {c Df Dg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => instHMul.hMul (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHMul.hMul (f x) (g x)) c)) h) (instHAdd.1 (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => instHMul.hMul (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHMul.hMul (f x) (g x)) c)) h) (instHAdd.hAdd (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg))))) ε)

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

  Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {A : Real → Prop} {c Df Dg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg))) ε) ∧ g c = Zero.toOfNat0.1 → False)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => instHDiv.hDiv (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHDiv.hDiv (f x) (g x)) c)) h) (instHDiv.1 (instHSub.hSub (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg)) (instHPow.hPow (g c) 2))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => instHDiv.hDiv (f x) (g x)) (instHAdd.hAdd c h)) ((fun x => instHDiv.hDiv (f x) (g x)) c)) h) (instHDiv.hDiv (instHSub.hSub (instHMul.hMul Df (g c)) (instHMul.hMul (f c) Dg)) (instHPow.hPow (g c) 2))))) ε)

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

  (Fin n → ℝ → ℝ ∧ Fin n → ℝ ∧ Fin n → ℝ ∧ ∀ i, Derivative (Ds i) (fs i) A c) → Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (αs Ds : Fin n → Real), (∀ (i : Fin n) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) (instHAdd.hAdd c h)) ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) c)) h) (Multiset.map (fun i => instHMul.hMul (αs i) (Ds i)) Finset.univ.val).sum) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) (instHAdd.hAdd c h)) ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) c)) h) (Finset.univ.sum fun i => instHMul.hMul (αs i) (Ds i))))) ε)

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

  (Fin n → ℝ → ℝ ∧ Fin n → ℝ ∧ ∀ i, Derivative (Ds i) (fs i) A c) → Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c) (fun x => ∏ i, fs i x) A c

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (Ds : Fin n → Real), (∀ (i : Fin n) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => Finset.univ.prod fun i => fs i x) (instHAdd.hAdd c h)) ((fun x => Finset.univ.prod fun i => fs i x) c)) h) (Multiset.map (fun k => instHMul.hMul (Ds k) ((Finset.univ.erase k).prod fun i => fs i c)) Finset.univ.val).sum) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => Finset.univ.prod fun i => fs i x) (instHAdd.hAdd c h)) ((fun x => Finset.univ.prod fun i => fs i x) c)) h) (Finset.univ.sum fun k => instHMul.hMul (Ds k) ((Finset.univ.erase k).prod fun i => fs i c))))) ε)

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

  Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c

Predicate logic (unfolded):

  ∀ {f : Real → Real} {A : Real → Prop} {c Df : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε)) → ∀ (n : Nat) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => instHPow.hPow (f x) n) (instHAdd.hAdd c h)) ((fun x => instHPow.hPow (f x) n) c)) h) (instHMul.1 (instHMul.hMul n.cast (instHPow.hPow (f c) (instHSub.hSub n 1))) Df)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => instHPow.hPow (f x) n) (instHAdd.hAdd c h)) ((fun x => instHPow.hPow (f x) n) c)) h) (instHMul.hMul (instHMul.hMul n.cast (instHPow.hPow (f c) (instHSub.hSub n 1))) Df)))) ε)

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

  (Fin n → ℝ → ℝ ∧ Fin n → ℝ ∧ Fin n → ℝ ∧ ∀ i, Derivative (Ds i) (fs i) A c) → Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {c : Real} (n : Nat) (fs : Fin n → Real → Real) (αs Ds : Fin n → Real), (∀ (i : Fin n) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fs i (instHAdd.hAdd c h)) (fs i c)) h) (Ds i)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) (instHAdd.hAdd c h)) ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) c)) h) (Multiset.map (fun i => instHMul.hMul (αs i) (Ds i)) Finset.univ.val).sum) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) (instHAdd.hAdd c h)) ((fun x => Finset.univ.sum fun i => instHMul.hMul (αs i) (fs i x)) c)) h) (Finset.univ.sum fun i => instHMul.hMul (αs i) (Ds i))))) ε)

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

  (∀ hI ∈ I.OrdConnected), (∀ x ∈ I, Derivative (fD x) f I x ∧ ∀ x ∈ I, Derivative (gD x) g I x) → (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧ (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧ (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x)

Predicate logic (unfolded):

  ∀ (I : Real → Prop), Set.OrdConnected I → ∀ (f g fD gD : Real → Real) (α : Real), (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)))) ε)) → (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun y => instHMul.hMul α (f y)) (instHAdd.hAdd x h)) ((fun y => instHMul.hMul α (f y)) x)) h) (instHMul.1 α (fD x))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun y => instHMul.hMul α (f y)) (instHAdd.hAdd x h)) ((fun y => instHMul.hMul α (f y)) x)) h) (instHMul.hMul α (fD x))))) ε) ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun y => instHAdd.hAdd (f y) (g y)) (instHAdd.hAdd x h)) ((fun y => instHAdd.hAdd (f y) (g y)) x)) h) (instHAdd.1 (fD x) (gD x))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun y => instHAdd.hAdd (f y) (g y)) (instHAdd.hAdd x h)) ((fun y => instHAdd.hAdd (f y) (g y)) x)) h) (instHAdd.hAdd (fD x) (gD x))))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun y => instHMul.hMul (f y) (g y)) (instHAdd.hAdd x h)) ((fun y => instHMul.hMul (f y) (g y)) x)) h) (instHAdd.1 (instHMul.hMul (fD x) (g x)) (instHMul.hMul (f x) (gD x)))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun y => instHMul.hMul (f y) (g y)) (instHAdd.hAdd x h)) ((fun y => instHMul.hMul (f y) (g y)) x)) h) (instHAdd.hAdd (instHMul.hMul (fD x) (g x)) (instHMul.hMul (f x) (gD x)))))) ε)))

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

  (IsOpen I ∧ IsClassC1 f fD1 I ∧ c ∈ I) → ∃ U V ∈ Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧ Set.BijOn f U V ∧ ∃ g ∈ ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧ ∃ gD1 ∈ ℝ → ℝ, IsClassC1 g gD1 V ∧ ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1

Predicate logic (unfolded):

  ∀ (f fD1 : Real → Real) (I : Real → Prop), (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 I ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD1 x_1) (fD1 x)))) ε))) → ∀ (c : Real), (Set.instMembership.1 I c ∧ fD1 c = Zero.toOfNat0.1 → False) → Exists fun U => Exists fun V => (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 U ∧ (Real.pseudoMetricSpace.toUniformSpace.toTopologicalSpace.1 V ∧ (Set.instMembership.1 U c ∧ (Set.instMembership.1 V (f c) ∧ (Set.instLE.1 U I ∧ ((∀ ⦃x : Real⦄, Set.instMembership.1 U x → Set.instMembership.1 V (f x) ∧ (∀ ⦃x₁ : Real⦄, Set.instMembership.1 U x₁ → ∀ ⦃x₂ : Real⦄, Set.instMembership.1 U x₂ → f x₁ = f x₂ → x₁ = x₂ ∧ Set.instLE.1 V fun x => Exists fun a => (Set.instMembership.1 U a ∧ f a = x))) ∧ Exists fun g => (∀ (x : Real), Set.instMembership.1 U x → g (f x) = x ∧ (∀ (y : Real), Set.instMembership.1 V y → f (g y) = y ∧ Exists fun gD1 => ((∀ (x : Real), Set.instMembership.1 V x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 V (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 V x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 V x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (gD1 x_1) (gD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (gD1 x_1) (gD1 x)))) ε)) ∧ ∀ (y : Real), Set.instMembership.1 V y → Exists fun x => (Set.instMembership.1 U x ∧ (f x = y ∧ instHMul.1 (gD1 y) (fD1 x) = One.toOfNat1.1)))))))))))

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

  (∀ x ∈ U, Derivative (fD1 x) f U x ∧ ∀ x ∈ U, fD1 x ≠ 0 ∧ ∀ y ∈ V, g y ∈ U ∧ ∀ x ∈ U, g (f x) = x ∧ ∀ y ∈ V, f (g y) = y) → ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y

Predicate logic (unfolded):

  ∀ (f g fD1 : Real → Real) (U V : Real → Prop), (∀ (x : Real), Set.instMembership.1 U x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 U (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 U x → fD1 x = Zero.toOfNat0.1 → False ∧ (∀ (y : Real), Set.instMembership.1 V y → Set.instMembership.1 U (g y) ∧ (∀ (x : Real), Set.instMembership.1 U x → g (f x) = x ∧ ∀ (y : Real), Set.instMembership.1 V y → f (g y) = y)))) → ∀ (y : Real), Set.instMembership.1 V y → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 V (instHAdd.1 y h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd y h)) (g y)) h) (instHDiv.1 1 (fD1 (g y)))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd y h)) (g y)) h) (instHDiv.hDiv 1 (fD1 (g y)))))) ε)

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

  (a < b ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0 ∧ ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x) → TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε)) → D = Zero.toOfNat0.1 → False ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) 0))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) 0))) ε)))))) → ∀ (fD gD : Real → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)))) ε)) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (fD x) (gD x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (fD x) (gD x)) x) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f x) (g x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f x) (g x)) x) L))) ε)

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

  (a < b ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0 ∧ ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M ∧ ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x) → TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε)) → D = Zero.toOfNat0.1 → False ∧ ∀ (M : Real), Real.instLT.1 Zero.toOfNat0.1 M → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 M (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))))) → ∀ (fD gD : Real → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) (gD x)))) ε)) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (fD x) (gD x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (fD x) (gD x)) x) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Real.instLT.1 a x → Real.instLT.1 x (instHAdd.1 a δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f x) (g x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f x) (g x)) x) L))) ε)

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
