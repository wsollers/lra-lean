
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`IsRelativeMinimum` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLE.le (f c) (f x)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f c) (f x)))

Logical form (Lean):

```lean
def IsRelativeMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f c ≤ f x
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
def IsRelativeMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f c ≤ f x

/--
`IsRelativeMaximum` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLE.le (f x) (f c)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f x) (f c)))

Logical form (Lean):

```lean
def IsRelativeMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f x ≤ f c
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
def IsRelativeMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f x ≤ f c

/--
`NecessaryConditionExtremum` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ interior A ∧ IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) → ¬ IsDifferentiable f A c ∨ Derivative 0 f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t A)) c ∧ Or ((Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f c) (f x)))) ((Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f x) (f c))))) → Or ((Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)) → False) (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε))

Logical form (Lean):

```lean
theorem NecessaryConditionExtremum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    ¬ IsDifferentiable f A c ∨ Derivative 0 f A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem NecessaryConditionExtremum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    ¬ IsDifferentiable f A c ∨ Derivative 0 f A c := by
  sorry

/--
`RelativeExtremumNecessaryCondition` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ interior A ∧ IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) → Derivative 0 f A c ∨ ¬ IsDifferentiable f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t A)) c ∧ Or ((Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f c) (f x)))) ((Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f x) (f c))))) → Or (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε)) ((Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)) → False)

Logical form (Lean):

```lean
theorem RelativeExtremumNecessaryCondition (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    Derivative 0 f A c ∨ ¬ IsDifferentiable f A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem RelativeExtremumNecessaryCondition (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    Derivative 0 f A c ∨ ¬ IsDifferentiable f A c := by
  sorry

/--
`IsConvexOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ ∀ (x : Real), Set.instMembership.mem I x → ∀ (y : Real), Set.instMembership.mem I y → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le (f (instHAdd.hAdd (instHMul.hMul t x) (instHMul.hMul (instHSub.hSub 1 t) y))) (instHAdd.hAdd (instHMul.hMul t (f x)) (instHMul.hMul (instHSub.hSub 1 t) (f y))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))))

Logical form (Lean):

```lean
def IsConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    f (t * x + (1 - t) * y) ≤ t * f x + (1 - t) * f y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    f (t * x + (1 - t) * y) ≤ t * f x + (1 - t) * f y

/--
`IsConcaveOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ ∀ (x : Real), Set.instMembership.mem I x → ∀ (y : Real), Set.instMembership.mem I y → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le (instHAdd.hAdd (instHMul.hMul t (f x)) (instHMul.hMul (instHSub.hSub 1 t) (f y))) (f (instHAdd.hAdd (instHMul.hMul t x) (instHMul.hMul (instHSub.hSub 1 t) y))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))))

Logical form (Lean):

```lean
def IsConcaveOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    t * f x + (1 - t) * f y ≤ f (t * x + (1 - t) * y)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsConcaveOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    t * f x + (1 - t) * f y ≤ f (t * x + (1 - t) * y)

/--
`IsInflection` TODO

Predicate logic:

  ∀ (f : Real → Real) (c : Real), Or (Exists fun δ => (GT.gt δ 0 ∧ (LRA.Analysis.Differentiation.IsConvexOn f (Set.Icc (instHSub.hSub c δ) c) ∧ LRA.Analysis.Differentiation.IsConcaveOn f (Set.Icc c (instHAdd.hAdd c δ))))) (Exists fun δ => (GT.gt δ 0 ∧ (LRA.Analysis.Differentiation.IsConcaveOn f (Set.Icc (instHSub.hSub c δ) c) ∧ LRA.Analysis.Differentiation.IsConvexOn f (Set.Icc c (instHAdd.hAdd c δ)))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real), Or (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ((Set.OrdConnected fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c)) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y)))) ∧ (Set.OrdConnected fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ)) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ))) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ))) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))))))) (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ((Set.OrdConnected fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c)) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y)))) ∧ (Set.OrdConnected fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ)) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ))) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ))) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y)))))))

Logical form (Lean):

```lean
def IsInflection (f : ℝ → ℝ) (c : ℝ) : Prop :=
  (∃ δ > 0, IsConvexOn f (Set.Icc (c - δ) c) ∧ IsConcaveOn f (Set.Icc c (c + δ))) ∨
  (∃ δ > 0, IsConcaveOn f (Set.Icc (c - δ) c) ∧ IsConvexOn f (Set.Icc c (c + δ)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use, unfold

-/
def IsInflection (f : ℝ → ℝ) (c : ℝ) : Prop :=
  (∃ δ > 0, IsConvexOn f (Set.Icc (c - δ) c) ∧ IsConcaveOn f (Set.Icc c (c + δ))) ∨
  (∃ δ > 0, IsConcaveOn f (Set.Icc (c - δ) c) ∧ IsConvexOn f (Set.Icc c (c + δ)))

end LRA.Analysis.Differentiation
