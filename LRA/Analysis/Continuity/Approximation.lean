
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Polynomial.Basic
import LRA.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

/--
`IsStepFunction` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => Exists fun v => (P 0 = a ∧ (P (Fin.last n) = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P i.castSucc) (P i.succ)) ∧ (∀ (i : Fin n) (x : Real), x ∈ Set.Ioo (P i.castSucc) (P i.succ) → f x = v i))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun n => Exists fun P => Exists fun v => (P 0 = a ∧ (P ⟨n, ⋯⟩ = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) ∧ (∀ (i : Fin n) (x : Real), x ∈ fun x => (Real.instPreorder.2.lt (P ⟨i.val, ⋯⟩) x ∧ Real.instPreorder.2.lt x (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) → f x = v i))))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun g => (LRA.Analysis.Continuity.IsStepFunction g a b ∧ (∀ (x : Real), x ∈ Set.Icc a b → Real.instLT.lt (abs (instHSub.hSub (f x) (g x))) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun g => ((Exists fun n => Exists fun P => Exists fun v => (P 0 = a ∧ (P ⟨n, ⋯⟩ = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) ∧ (∀ (i : Fin n) (x : Real), x ∈ fun x => (Real.instPreorder.2.lt (P (Fin.castLE ⋯ i)) x ∧ Real.instPreorder.2.lt x (P (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt))) → g x = v i))))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x))) ε))

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

  ∀ (f : Real → Real) (a b : Real), Exists fun n => Exists fun P => (P 0 = a ∧ (P (Fin.last n) = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P i.castSucc) (P i.succ)) ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ (∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), x ∈ Set.Icc (P i.castSucc) (P i.succ) → f x = instHAdd.hAdd (instHMul.hMul m x) c)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun n => Exists fun P => (P 0 = a ∧ (P ⟨n, ⋯⟩ = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ (∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le (P ⟨i.val, ⋯⟩) x ∧ Real.instPreorder.1.le x (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) → f x = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul m x) c)))))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun g => (LRA.Analysis.Continuity.IsPiecewiseLinear g a b ∧ (∀ (x : Real), x ∈ Set.Icc a b → Real.instLT.lt (abs (instHSub.hSub (f x) (g x))) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun g => ((Exists fun n => Exists fun P => (P 0 = a ∧ (P ⟨n, ⋯⟩ = b ∧ ((∀ (i : Fin n), Real.instLT.lt (P ⟨i.1, ⋯⟩) (P (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x_1) (g x))) ε))) ∧ (∀ (i : Fin n), Exists fun m => Exists fun c => ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le (P (Fin.castLE ⋯ i)) x ∧ Real.instPreorder.1.le x (P (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt))) → g x = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul m x) c)))))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x))) ε))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun p => ∀ (x : Real), x ∈ Set.Icc a b → Real.instLT.lt (abs (instHSub.hSub (f x) (Polynomial.eval x p))) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun p => ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } x p))) ε

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

  ∀ (f : Real → Real), LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc 0 1) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → ∀ (x : Real), x ∈ Set.Icc 0 1 → Real.instLT.lt (abs (instHSub.hSub (f x) (Polynomial.eval x (LRA.Analysis.Continuity.BernsteinPolynomial f n)))) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    hf : ContinuousOn' f (Set.Icc 0 1)
  Prove
    (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (Polynomial.eval₂ { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } x (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun k => instHMul.hMul (instHMul.hMul (instHMul.hMul (RingHom.instFunLike.coe Polynomial.C (f (instHDiv.hDiv k.cast n.cast))) (RingHom.instFunLike.coe Polynomial.C (n.choose k).cast)) (instHPow.hPow Polynomial.X k)) (instHPow.hPow (instHSub.hSub 1 Polynomial.X) (instHSub.hSub n k))) (Finset.range (instHAdd.hAdd n 1)).val))))) ε

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
