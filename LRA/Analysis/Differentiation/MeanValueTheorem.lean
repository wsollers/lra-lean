
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.UniformContinuity

namespace LRA.Analysis.Differentiation

/--
`RollesTheorem` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Ioo a b) x) ∧ f a = f b))) → Exists fun c => (c ∈ Set.Ioo a b ∧ LRA.Analysis.Differentiation.Derivative 0 f (Set.Ioo a b) c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) ∧ f a = f b))) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) 0)) ε))))

Logical form (Lean):

```lean
theorem RollesTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hfab : f a = f b) :
    ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c
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
theorem RollesTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hfab : f a = f b) :
    ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c := by
  sorry
/--
`MeanValueTheorem` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ (∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Ioo a b) x))) → Exists fun c => (c ∈ Set.Ioo a b ∧ LRA.Analysis.Differentiation.Derivative (instHDiv.hDiv (instHSub.hSub (f b) (f a)) (instHSub.hSub b a)) f (Set.Ioo a b) c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))))) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f b) (f a)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub b a)))) ε))))

Logical form (Lean):

```lean
theorem MeanValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c
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
theorem MeanValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c := by
  sorry
/--
`CauchyMeanValueTheorem` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ (LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Ioo a b) x) ∧ ((∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.IsDifferentiable g (Set.Ioo a b) x) ∧ (∀ (x : Real), x ∈ Set.Ioo a b → ¬ LRA.Analysis.Differentiation.Derivative 0 g (Set.Ioo a b) x)))))) → Exists fun c => (c ∈ Set.Ioo a b ∧ (Exists fun Df => Exists fun Dg => (LRA.Analysis.Differentiation.Derivative Df f (Set.Ioo a b) c ∧ (LRA.Analysis.Differentiation.Derivative Dg g (Set.Ioo a b) c ∧ instHMul.hMul Df (instHSub.hSub (g b) (g a)) = instHMul.hMul Dg (instHSub.hSub (f b) (f a))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
    hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x_1) (g x))) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) D)) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (g x)) h) 0)) ε))) → False)))))) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ (Exists fun Df => Exists fun Dg => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) Df)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (g c)) h) Dg)) ε))) ∧ { hMul := fun a b => Real.instMul.mul a b }.hMul Df ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g b) (g a)) = { hMul := fun a b => Real.instMul.mul a b }.hMul Dg ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f b) (f a))))))

Logical form (Lean):

```lean
theorem CauchyMeanValueTheorem (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b))
    (hfdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧
      Derivative Dg g (Set.Ioo a b) c ∧
      Df * (g b - g a) = Dg * (f b - f a)
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
theorem CauchyMeanValueTheorem (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b))
    (hfdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧
      Derivative Dg g (Set.Ioo a b) c ∧
      Df * (g b - g a) = Dg * (f b - f a) := by
  sorry
/--
`NondecreasingIffNonnegDerivative` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.IsDifferentiable f I x)) → MonotoneOn f I ↔ ∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x → GE.ge D 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.IsDifferentiable f I x)) → MonotoneOn f I ↔ ∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x → GE.ge D 0

Logical form (Lean):

```lean
theorem NondecreasingIffNonnegDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem NondecreasingIffNonnegDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0 := by
  sorry
/--
`DerivativeBoundImpliesLipschitz` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.IsDifferentiable f I x)) → ∀ (M : Real), (GE.ge M 0 ∧ (∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x → Real.instLE.le (abs D) M)) → LRA.Analysis.Continuity.IsLipschitzOn f I M

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    M : ℝ
    hM : M ≥ 0
  Prove
    (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε)))) → ∀ (M : Real), (Real.instLE.le 0 M ∧ (∀ (x : Real), x ∈ I → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) → Real.instLE.le (abs D) M)) → (Real.instLE.le 0 M ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul M (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))

Logical form (Lean):

```lean
theorem DerivativeBoundImpliesLipschitz (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) (M : ℝ) (hM : M ≥ 0)
    (hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) :
    LRA.Analysis.Continuity.IsLipschitzOn f I M
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
theorem DerivativeBoundImpliesLipschitz (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) (M : ℝ) (hM : M ≥ 0)
    (hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) :
    LRA.Analysis.Continuity.IsLipschitzOn f I M := by
  sorry
end LRA.Analysis.Differentiation
