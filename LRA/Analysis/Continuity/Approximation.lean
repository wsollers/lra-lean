
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Polynomial.Basic
import LRA.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

/--
`IsStepFunction` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => Exists fun v => (P 0 = a ∧ (P (Fin.last n) = b ∧ (∀ (i : Fin n), Real.instLT.lt (P i.castSucc) (P i.succ) ∧ ∀ (i : Fin n) (x : Real), Set.instMembership.mem (Set.Ioo (P i.castSucc) (P i.succ)) x → f x = v i)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => Exists fun v => (P Fin.instOfNat.1 = a ∧ (P ⟨n, ⋯⟩ = b ∧ (∀ (i : Fin n), Real.instLT.1 (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i (instOfNatNat 1).1, ⋯⟩) val isLt) val isLt) i)) ∧ ∀ (i : Fin n) (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 (P (Fin.castLE ⋯ i)) x ∧ Real.instPreorder.toLT.1 x (P (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)))) x → f x = v i)))

Logical form (Lean):

```lean
def IsStepFunction (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ) (v : Fin n → ℝ),
    P 0 = a ∧ P (Fin.last n) = b ∧ (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ∀ i : Fin n, ∀ x ∈ Set.Ioo (P i.castSucc) (P i.succ), f x = v i
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
def IsStepFunction (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ) (v : Fin n → ℝ),
    P 0 = a ∧ P (Fin.last n) = b ∧ (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ∀ i : Fin n, ∀ x ∈ Set.Ioo (P i.castSucc) (P i.succ), f x = v i

/--
`StepFunctionApproximation` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → ∀ ε > 0, ∃ g ∈ ℝ → ℝ, IsStepFunction g a b ∧ ∀ x ∈ Set.Icc a b, |f x - g x| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun g => (Exists fun n => Exists fun P => Exists fun v => (P Fin.instOfNat.1 = a ∧ (P ⟨n, ⋯⟩ = b ∧ (∀ (i : Fin n), Real.instLT.1 (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i 1, ⋯⟩) val isLt) val isLt) i)) ∧ ∀ (i : Fin n) (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 (P (Fin.castAdd 1 i)) x ∧ Real.instPreorder.toLT.1 x (P (Fin.succ.match_1 (fun x => Fin (instHAdd.hAdd n 1)) i fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩)))) x → g x = v i))) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (g x)))) ε)

Logical form (Lean):

```lean
theorem StepFunctionApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsStepFunction g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε
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
theorem StepFunctionApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsStepFunction g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε := by
  sorry
/--
`IsPiecewiseLinear` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => (P 0 = a ∧ (P (Fin.last n) = b ∧ (∀ (i : Fin n), Real.instLT.lt (P i.castSucc) (P i.succ) ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ ∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), Set.instMembership.mem (Set.Icc (P i.castSucc) (P i.succ)) x → f x = instHAdd.hAdd (instHMul.hMul m x) c))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => (P Fin.instOfNat.1 = a ∧ (P ⟨n, ⋯⟩ = b ∧ (∀ (i : Fin n), Real.instLT.1 (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i (instOfNatNat 1).1, ⋯⟩) val isLt) val isLt) i)) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ ∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (P (Fin.castLE ⋯ i)) x ∧ Real.instPreorder.toLE.1 x (P (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)))) x → f x = instHAdd.1 (instHMul.1 m x) c))))

Logical form (Lean):

```lean
def IsPiecewiseLinear (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ), P 0 = a ∧ P (Fin.last n) = b ∧
    (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ContinuousOn' f (Set.Icc a b) ∧
    ∀ i : Fin n, ∃ m c : ℝ, ∀ x ∈ Set.Icc (P i.castSucc) (P i.succ), f x = m * x + c
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
def IsPiecewiseLinear (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ), P 0 = a ∧ P (Fin.last n) = b ∧
    (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ContinuousOn' f (Set.Icc a b) ∧
    ∀ i : Fin n, ∃ m c : ℝ, ∀ x ∈ Set.Icc (P i.castSucc) (P i.succ), f x = m * x + c

/--
`PiecewiseLinearApproximation` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → ∀ ε > 0, ∃ g ∈ ℝ → ℝ, IsPiecewiseLinear g a b ∧ ∀ x ∈ Set.Icc a b, |f x - g x| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun g => (Exists fun n => Exists fun P => (P Fin.instOfNat.1 = a ∧ (P ⟨n, ⋯⟩ = b ∧ (∀ (i : Fin n), Real.instLT.1 (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i 1, ⋯⟩) val isLt) val isLt) i)) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (g x_1) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (g x_1) (g x)))) ε) ∧ ∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (P (Fin.castAdd 1 i)) x ∧ Real.instPreorder.toLE.1 x (P (Fin.succ.match_1 (fun x => Fin (instHAdd.hAdd n 1)) i fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩)))) x → g x = instHAdd.1 (instHMul.1 m x) c)))) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (g x)))) ε)

Logical form (Lean):

```lean
theorem PiecewiseLinearApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsPiecewiseLinear g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε
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
theorem PiecewiseLinearApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsPiecewiseLinear g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε := by
  sorry
/--
`WeierstrassApproximation` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → ∀ ε > 0, ∃ p ∈ Polynomial ℝ, ∀ x ∈ Set.Icc a b, |f x - p.eval x| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun p => ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } x p)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (Polynomial.eval₂ (RingHom.id Real) x p)))) ε

Logical form (Lean):

```lean
theorem WeierstrassApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ p : Polynomial ℝ, ∀ x ∈ Set.Icc a b, |f x - p.eval x| < ε
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
theorem WeierstrassApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ p : Polynomial ℝ, ∀ x ∈ Set.Icc a b, |f x - p.eval x| < ε := by
  sorry
/--
`BernsteinPolynomial` TODO

Predicate logic:

  noncomputable def BernsteinPolynomial (f : ℝ → ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    Polynomial.C (f (k / n : ℝ)) *
      (Polynomial.C ((n.choose k : ℝ))) *
      Polynomial.X ^ k * (1 - Polynomial.X) ^ (n - k)

Predicate logic (unfolded):

  noncomputable def BernsteinPolynomial (f : ℝ → ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    Polynomial.C (f (k / n : ℝ)) *
      (Polynomial.C ((n.choose k : ℝ))) *
      Polynomial.X ^ k * (1 - Polynomial.X) ^ (n - k) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def BernsteinPolynomial (f : ℝ → ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    Polynomial.C (f (k / n : ℝ)) *
      (Polynomial.C ((n.choose k : ℝ))) *
      Polynomial.X ^ k * (1 - Polynomial.X) ^ (n - k)
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
noncomputable def BernsteinPolynomial (f : ℝ → ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    Polynomial.C (f (k / n : ℝ)) *
      (Polynomial.C ((n.choose k : ℝ))) *
      Polynomial.X ^ k * (1 - Polynomial.X) ^ (n - k)

/--
`BernsteinApproximation` TODO

Predicate logic:

  (ℝ → ℝ) → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, ∀ x ∈ Set.Icc 0 ∈ ℝ 1, |f x - (BernsteinPolynomial f n).eval x| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 0 x ∧ Real.instPreorder.toLE.1 x 1)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } x ((Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHMul.hMul (instHMul.hMul (RingHom.instFunLike.coe Polynomial.C (f (instHDiv.hDiv k.cast n.cast))) (RingHom.instFunLike.coe Polynomial.C (n.choose k).cast)) (instHPow.hPow Polynomial.X k)) (instHPow.hPow (instHSub.hSub 1 Polynomial.X) (instHSub.hSub n k))))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (Polynomial.eval₂ (RingHom.id Real) x (LRA.Analysis.Continuity.BernsteinPolynomial f n))))) ε

Logical form (Lean):

```lean
theorem BernsteinApproximation (f : ℝ → ℝ) (hf : ContinuousOn' f (Set.Icc 0 1)) :
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, ∀ x ∈ Set.Icc (0:ℝ) 1,
      |f x - (BernsteinPolynomial f n).eval x| < ε
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
theorem BernsteinApproximation (f : ℝ → ℝ) (hf : ContinuousOn' f (Set.Icc 0 1)) :
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, ∀ x ∈ Set.Icc (0:ℝ) 1,
      |f x - (BernsteinPolynomial f n).eval x| < ε := by
  sorry
end LRA.Analysis.Continuity
