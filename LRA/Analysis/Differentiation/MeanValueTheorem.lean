
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.UniformContinuity

namespace LRA.Analysis.Differentiation

/--
`RollesTheorem` TODO

Predicate logic:

  (ℝ → ℝ ∧ a < b ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x ∧ f a = f b) → ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε) ∧ f a = f b))) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε))

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

  (ℝ → ℝ ∧ a < b ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) → ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε))) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) (instHDiv.1 (instHSub.hSub (f b) (f a)) (instHSub.hSub b a))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) (instHDiv.hDiv (instHSub.hSub (f b) (f a)) (instHSub.hSub b a))))) ε))

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

  (a < b ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x ∧ ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) → ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧ Derivative Dg g (Set.Ioo a b) c ∧ Df * (g b - g a) = Dg * (f b - f a)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x_1) (g x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (g x_1) (g x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) 0) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) 0))) ε)) → False))))) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ Exists fun Df => Exists fun Dg => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) h) Dg))) ε) ∧ instHMul.1 Df (instHSub.1 (g b) (g a)) = instHMul.1 Dg (instHSub.1 (f b) (f a)))))

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

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ ∀ x ∈ I, IsDifferentiable f I x) → MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → ∀ ⦃a : Real⦄, Set.instMembership.1 I a → ∀ ⦃b : Real⦄, Set.instMembership.1 I b → Real.instPreorder.toLE.1 a b → Real.instPreorder.toLE.1 (f a) (f b) ↔ ∀ (x : Real), Set.instMembership.1 I x → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLE.1 Zero.toOfNat0.1 D

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

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ ∀ x ∈ I, IsDifferentiable f I x ∧ ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) → LRA.Analysis.Continuity.IsLipschitzOn f I M

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → ∀ (M : Real), (Real.instLE.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLE.1 (SemilatticeSup.toMax.1 D (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 D)) M) → (Real.instLE.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) (instHMul.1 M (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y)))))

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
