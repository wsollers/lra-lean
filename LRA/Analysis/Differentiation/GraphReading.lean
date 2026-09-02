
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.DerivativeGeometry
import LRA.Analysis.Differentiation.ChainRule
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.Continuity.UniformContinuity

namespace LRA.Analysis.Differentiation

/--
`IsIncreasingAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) (f c) ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (f c) (f x)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (f x) (f c) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (f c) (f x)))

Logical form (Lean):

```lean
def IsIncreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f x < f c) ∧
    (∀ x ∈ A, c < x → x < c + δ → f c < f x)
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
def IsIncreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f x < f c) ∧
    (∀ x ∈ A, c < x → x < c + δ → f c < f x)

/--
`IsDecreasingAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f c) (f x) ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (f x) (f c)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (f c) (f x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (f x) (f c)))

Logical form (Lean):

```lean
def IsDecreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f c < f x) ∧
    (∀ x ∈ A, c < x → x < c + δ → f x < f c)
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
def IsDecreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f c < f x) ∧
    (∀ x ∈ A, c < x → x < c + δ → f x < f c)

/--
`OrderReversing` TODO

Predicate logic:

  ∀ (f : Real → Real) (I : Set Real) (x : Real), Set.instMembership.mem I x → ∀ (y : Real), (Set.instMembership.mem I y ∧ Real.instLT.lt x y) → Real.instLE.le (f y) (f x)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop) (x : Real), Set.instMembership.1 I x → ∀ (y : Real), (Set.instMembership.1 I y ∧ Real.instLT.1 x y) → Real.instLE.1 (f y) (f x)

Logical form (Lean):

```lean
def OrderReversing (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ x ∈ I, ∀ y ∈ I, x < y → f y ≤ f x
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
def OrderReversing (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ x ∈ I, ∀ y ∈ I, x < y → f y ≤ f x

/--
`NonincreasingIffNonposDerivative` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ ∀ x ∈ I, IsDifferentiable f I x) → OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLT.1 x y → Real.instLE.1 (f y) (f x) ↔ ∀ (x : Real), Set.instMembership.1 I x → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLE.1 D Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem NonincreasingIffNonposDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0
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
theorem NonincreasingIffNonposDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0 := by
  sorry
/--
`ZeroDerivativeImpliesConstant` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ ∧ ∀ x ∈ I, Derivative 0 f I x) → ∃ k ∈ ℝ, ∀ x ∈ I, f x = k

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) 0))) ε)) → Exists fun k => ∀ (x : Real), Set.instMembership.1 I x → f x = k

Logical form (Lean):

```lean
theorem ZeroDerivativeImpliesConstant (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, Derivative 0 f I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x = k
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
theorem ZeroDerivativeImpliesConstant (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, Derivative 0 f I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x = k := by
  sorry
/--
`EqualDerivativesConstantDifference` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (∀ x ∈ I, ∀ D, Derivative D f I x ↔ Derivative D g I x) → ∃ k ∈ ℝ, ∀ x ∈ I, f x - g x = k

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (D : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd x h)) (g x)) h) D))) ε)) → Exists fun k => ∀ (x : Real), Set.instMembership.1 I x → instHSub.1 (f x) (g x) = k

Logical form (Lean):

```lean
theorem EqualDerivativesConstantDifference (f g : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, ∀ D, Derivative D f I x ↔ Derivative D g I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x - g x = k
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem EqualDerivativesConstantDifference (f g : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, ∀ D, Derivative D f I x ↔ Derivative D g I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x - g x = k := by
  sorry
/--
`FirstDerivativeTestMaximum` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ interior A ∧ ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0 ∧ ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0) → IsRelativeMaximum f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t A)) c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε) ∧ (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLT.1 Zero.toOfNat0.1 D) ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLT.1 D Zero.toOfNat0.1)))) → (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f x) (f c)))

Logical form (Lean):

```lean
theorem FirstDerivativeTestMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0) :
    IsRelativeMaximum f A c
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
theorem FirstDerivativeTestMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0) :
    IsRelativeMaximum f A c := by
  sorry
/--
`FirstDerivativeTestMinimum` TODO

Predicate logic:

  (ℝ → ℝ ∧ c ∈ interior A ∧ ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0 ∧ ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0) → IsRelativeMinimum f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t A)) c ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε) ∧ (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLT.1 D Zero.toOfNat0.1) ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → Real.instLT.1 Zero.toOfNat0.1 D)))) → (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f c) (f x)))

Logical form (Lean):

```lean
theorem FirstDerivativeTestMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0) :
    IsRelativeMinimum f A c
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
theorem FirstDerivativeTestMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0) :
    IsRelativeMinimum f A c := by
  sorry
/--
`SecondDerivative` TODO

Predicate logic:

  ∀ (D2 : Real) (a fD1 : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (h : Real), Set.instMembership.mem A (instHAdd.hAdd c h) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) D2)) ε)

Predicate logic (unfolded):

  ∀ (D2 : Real) (a fD1 : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) D2) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) D2))) ε)

Logical form (Lean):

```lean
def SecondDerivative (D2 : ℝ) (f fD1 : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  Derivative D2 fD1 A c
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
def SecondDerivative (D2 : ℝ) (f fD1 : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  Derivative D2 fD1 A c

/--
`HigherDerivativeAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Set Real) (n : Nat) (c : Real), (fD 0 = f ∧ ∀ (k : Nat), instLTNat.lt k n → LRA.Analysis.Differentiation.Derivative (fD (instHAdd.hAdd k 1) c) (fD k) A c)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Real → Prop) (n : Nat) (c : Real), (fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.1 k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)))) ε))

Logical form (Lean):

```lean
def HigherDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  LRA.Analysis.Differentiation.NthDerivativeAt f fD A n c
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
def HigherDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  LRA.Analysis.Differentiation.NthDerivativeAt f fD A n c

/--
`SecondDerivativeConvexityTest` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (∀ x ∈ I, Derivative (fD1 x) f I x ∧ ∀ x ∈ I, Derivative (fD2 x) fD1 I x ∧ ∀ x ∈ I, fD2 x ≥ 0) → IsConvexOn f I

Predicate logic (unfolded):

  ∀ (f fD1 fD2 : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLE.1 Zero.toOfNat0.1 (fD2 x)))) → (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))))

Logical form (Lean):

```lean
theorem SecondDerivativeConvexityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hpos : ∀ x ∈ I, fD2 x ≥ 0) :
    IsConvexOn f I
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
theorem SecondDerivativeConvexityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hpos : ∀ x ∈ I, fD2 x ≥ 0) :
    IsConvexOn f I := by
  sorry
/--
`SecondDerivativeConcavityTest` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (∀ x ∈ I, Derivative (fD1 x) f I x ∧ ∀ x ∈ I, Derivative (fD2 x) fD1 I x ∧ ∀ x ∈ I, fD2 x ≤ 0) → IsConcaveOn f I

Predicate logic (unfolded):

  ∀ (f fD1 fD2 : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLE.1 (fD2 x) Zero.toOfNat0.1))) → (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 One.toOfNat1.1 t) y))))

Logical form (Lean):

```lean
theorem SecondDerivativeConcavityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hneg : ∀ x ∈ I, fD2 x ≤ 0) :
    IsConcaveOn f I
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
theorem SecondDerivativeConcavityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hneg : ∀ x ∈ I, fD2 x ≤ 0) :
    IsConcaveOn f I := by
  sorry
/--
`SecondDerivativeTest` TODO

Predicate logic:

  (∀ x ∈ A, Derivative (fD1 x) f A x) → (fD2 c > 0 → IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c)

Predicate logic (unfolded):

  ∀ (f fD1 fD2 : Real → Real) (A : Real → Prop) (c : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) 0))) ε) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) (fD2 c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) (fD2 c)))) ε))) → (Real.instLT.1 Zero.toOfNat0.1 (fD2 c) → (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f c) (f x))) ∧ Real.instLT.1 (fD2 c) Zero.toOfNat0.1 → (Set.instMembership.1 A c ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (f x) (f c))))

Logical form (Lean):

```lean
theorem SecondDerivativeTest (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hD1c : Derivative 0 f A c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2c : Derivative (fD2 c) fD1 A c) :
    (fD2 c > 0 → IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c)
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
theorem SecondDerivativeTest (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hD1c : Derivative 0 f A c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2c : Derivative (fD2 c) fD1 A c) :
    (fD2 c > 0 → IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c) := by
  sorry
/--
`InflectionPointNecessaryCondition` TODO

Predicate logic:

  (IsInflection f c ∧ ∀ x ∈ A, Derivative (fD1 x) f A x ∧ ∀ x ∈ A, Derivative (fD2 x) fD1 A x) → fD2 c = 0

Predicate logic (unfolded):

  ∀ (f fD1 fD2 : Real → Real) (A : Real → Prop) (c : Real), (Or (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ((Set.OrdConnected fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLE.1 x c)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLE.1 x c)) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 1 t) (f y)))) ∧ (Set.OrdConnected fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ)) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.hAdd c δ))) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.hAdd c δ))) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 1 t) y))))))) (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ((Set.OrdConnected fun x => (Real.instPreorder.toLE.1 (instHSub.1 c δ) x ∧ Real.instPreorder.toLE.1 x c) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLE.1 x c)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 (instHSub.hSub c δ) x ∧ Real.instPreorder.toLE.1 x c)) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 1 t) (f y))) (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 1 t) y)))) ∧ (Set.OrdConnected fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.1 c δ)) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.hAdd c δ))) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 c x ∧ Real.instPreorder.toLE.1 x (instHAdd.hAdd c δ))) y → ∀ (t : Real), Real.instLE.1 Zero.toOfNat0.1 t → Real.instLE.1 t One.toOfNat1.1 → Real.instLE.1 (f (instHAdd.1 (instHMul.1 t x) (instHMul.1 (instHSub.1 1 t) y))) (instHAdd.1 (instHMul.1 t (f x)) (instHMul.1 (instHSub.1 1 t) (f y))))))) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 A x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd x h)) (fD1 x)) h) (fD2 x)))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD2 x) (fD2 c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (fD2 x) (fD2 c)))) ε)))) → fD2 c = Zero.toOfNat0.1

Logical form (Lean):

```lean
theorem InflectionPointNecessaryCondition (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hinfl : IsInflection f c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2 : ∀ x ∈ A, Derivative (fD2 x) fD1 A x)
    (hcont : LRA.Analysis.Continuity.ContinuousAtPoint fD2 A c) :
    fD2 c = 0
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
theorem InflectionPointNecessaryCondition (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hinfl : IsInflection f c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2 : ∀ x ∈ A, Derivative (fD2 x) fD1 A x)
    (hcont : LRA.Analysis.Continuity.ContinuousAtPoint fD2 A c) :
    fD2 c = 0 := by
  sorry
/--
`darboux` TODO

Predicate logic:

  (ℝ → ℝ ∧ a < b ∧ ∀ x ∈ Set.Icc a b, IsDifferentiable f (Set.Icc a b) x ∧ (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)) → ∃ c ∈ Set.Ioo a b, Derivative k f (Set.Icc a b) c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) D))) ε)) → ∀ (Da Db : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (instHAdd.1 a h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd a h)) (f a)) h) Da) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd a h)) (f a)) h) Da))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (instHAdd.1 b h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd b h)) (f b)) h) Db) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd b h)) (f b)) h) Db))) ε)) → ∀ (k : Real), Or ((Real.instLT.1 Da k ∧ Real.instLT.1 k Db)) ((Real.instLT.1 Db k ∧ Real.instLT.1 k Da)) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) k) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) k))) ε))

Logical form (Lean):

```lean
theorem darboux (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hdiff : ∀ x ∈ Set.Icc a b, IsDifferentiable f (Set.Icc a b) x)
    (Da Db : ℝ) (hDa : Derivative Da f (Set.Icc a b) a) (hDb : Derivative Db f (Set.Icc a b) b)
    (k : ℝ) (hk : (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)) :
    ∃ c ∈ Set.Ioo a b, Derivative k f (Set.Icc a b) c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem darboux (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hdiff : ∀ x ∈ Set.Icc a b, IsDifferentiable f (Set.Icc a b) x)
    (Da Db : ℝ) (hDa : Derivative Da f (Set.Icc a b) a) (hDb : Derivative Db f (Set.Icc a b) b)
    (k : ℝ) (hk : (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)) :
    ∃ c ∈ Set.Ioo a b, Derivative k f (Set.Icc a b) c := by
  sorry
/--
`IsClassC1` TODO

Predicate logic:

  ∀ (f fD1 : Real → Real) (I : Set Real), (∀ (x : Real), Set.instMembership.mem I x → LRA.Analysis.Differentiation.Derivative (fD1 x) f I x ∧ LRA.Analysis.Continuity.ContinuousOn' fD1 I)

Predicate logic (unfolded):

  ∀ (f fD1 : Real → Real) (I : Real → Prop), (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (fD1 x_1) (fD1 x)))) ε))

Logical form (Lean):

```lean
def IsClassC1 (f : ℝ → ℝ) (fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  (∀ x ∈ I, Derivative (fD1 x) f I x) ∧
    LRA.Analysis.Continuity.ContinuousOn' fD1 I
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
def IsClassC1 (f : ℝ → ℝ) (fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  (∀ x ∈ I, Derivative (fD1 x) f I x) ∧
    LRA.Analysis.Continuity.ContinuousOn' fD1 I

/--
`IsClassCk` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (k : Nat), (∀ (x : Real), Set.instMembership.mem I x → LRA.Analysis.Differentiation.HigherDerivativeAt f fD I k x ∧ LRA.Analysis.Continuity.ContinuousOn' (fD k) I)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Real → Prop) (k : Nat), (∀ (x : Real), Set.instMembership.1 I x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 k → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (fD k x_1) (fD k x)))) ε))

Logical form (Lean):

```lean
def IsClassCk (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (k : ℕ) : Prop :=
  (∀ x ∈ I, HigherDerivativeAt f fD I k x) ∧
    LRA.Analysis.Continuity.ContinuousOn' (fD k) I
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
def IsClassCk (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (k : ℕ) : Prop :=
  (∀ x ∈ I, HigherDerivativeAt f fD I k x) ∧
    LRA.Analysis.Continuity.ContinuousOn' (fD k) I

/--
`IsClassCInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (k : Nat), LRA.Analysis.Differentiation.IsClassCk f fD I k

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Real → Prop) (k : Nat), (∀ (x : Real), Set.instMembership.1 I x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 k → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD k x_1) (fD k x)))) ε))

Logical form (Lean):

```lean
def IsClassCInfty (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ k : ℕ, IsClassCk f fD I k
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
def IsClassCInfty (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ k : ℕ, IsClassCk f fD I k

/--
`IsClassCOmega` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (a : Real), Set.instMembership.mem I a → Exists fun r => (GT.gt r 0 ∧ ∀ (x : Real), Set.instMembership.mem (Set.instInter.inter (Set.Ioo (instHSub.hSub a r) (instHAdd.hAdd a r)) I) x → Filter.Tendsto (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) Filter.atTop (nhds (f x)))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Real → Prop) (a : Real), Set.instMembership.1 I a → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.1 a r) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 a r))) I) x → Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.1 Filter.atTop.sets (Set.preimage (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x)))

Logical form (Lean):

```lean
def IsClassCOmega (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ a ∈ I, ∃ r > 0, ∀ x ∈ Set.Ioo (a - r) (a + r) ∩ I,
    Filter.Tendsto (fun n => ∑ k ∈ Finset.range (n + 1),
      fD k a / (Nat.factorial k) * (x - a) ^ k) Filter.atTop (nhds (f x))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsClassCOmega (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ a ∈ I, ∃ r > 0, ∀ x ∈ Set.Ioo (a - r) (a + r) ∩ I,
    Filter.Tendsto (fun n => ∑ k ∈ Finset.range (n + 1),
      fD k a / (Nat.factorial k) * (x - a) ^ k) Filter.atTop (nhds (f x))

/--
`SmoothnessTower` TODO

Predicate logic:

  (∀ hI ∈ I.Nontrivial), (∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f fD I k) ∧ (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I)

Predicate logic (unfolded):

  ∀ (I : Real → Prop), (Exists fun x => (Set.instMembership.1 I x ∧ Exists fun y => (Set.instMembership.1 I y ∧ x = y → False))) → (∀ (f : Real → Real) (fD : Nat → Real → Real) (k : Nat), (∀ (x : Real), Set.instMembership.1 I x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 (instHAdd.1 k (instOfNatNat 1).1) → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD (instHAdd.hAdd k 1) x_1) (fD (instHAdd.hAdd k 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD (instHAdd.hAdd k 1) x_1) (fD (instHAdd.hAdd k 1) x)))) ε)) → (∀ (x : Real), Set.instMembership.1 I x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 k → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD k x_1) (fD k x)))) ε)) ∧ ∀ (f : Real → Real) (fD : Nat → Real → Real), (∀ (a : Real), Set.instMembership.1 I a → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.hSub a r) x ∧ Real.instPreorder.toLT.1 x (instHAdd.hAdd a r))) I) x → Filter.instPartialOrder.toLE.1 { sets := fun x_1 => Set.instMembership.mem Filter.atTop.sets (Set.preimage (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x)))) → ∀ (k : Nat), (∀ (x : Real), Set.instMembership.1 I x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.hAdd x h) → Real.instLT.1 0 (abs h) → Real.instLT.1 (abs h) δ → Real.instLT.1 (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD k x_1) (fD k x)))) ε)))

Logical form (Lean):

```lean
theorem SmoothnessTower (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f fD I k) ∧
    (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I)
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
theorem SmoothnessTower (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f fD I k) ∧
    (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I) := by
  sorry
/--
`IsClassC11` TODO

Predicate logic:

  ∀ (f fD1 : Real → Real) (I : Set Real), (LRA.Analysis.Differentiation.IsClassC1 f fD1 I ∧ Exists fun L => (GE.ge L 0 ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I L))

Predicate logic (unfolded):

  ∀ (f fD1 : Real → Real) (I : Real → Prop), ((∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD1 x_1) (fD1 x)))) ε)) ∧ Exists fun L => (Real.instLE.1 Zero.toOfNat0.1 L ∧ (Real.instLE.1 Zero.toOfNat0.1 L ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD1 x) (fD1 y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (fD1 x) (fD1 y)))) (instHMul.1 L (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y)))))))

Logical form (Lean):

```lean
def IsClassC11 (f fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  IsClassC1 f fD1 I ∧ ∃ L ≥ 0,
    LRA.Analysis.Continuity.IsLipschitzOn fD1 I L
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
def IsClassC11 (f fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  IsClassC1 f fD1 I ∧ ∃ L ≥ 0,
    LRA.Analysis.Continuity.IsLipschitzOn fD1 I L

/--
`C11Placement` TODO

Predicate logic:

  (∀ hI ∈ I.Nontrivial), (∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1 I)

Predicate logic (unfolded):

  ∀ (I : Real → Prop), (Exists fun x => (Set.instMembership.1 I x ∧ Exists fun y => (Set.instMembership.1 I y ∧ x = y → False))) → ∀ (f fD1 : Real → Real), ((∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD1 x_1) (fD1 x)))) ε)) ∧ Exists fun L => (Real.instLE.1 Zero.toOfNat0.1 L ∧ (Real.instLE.1 Zero.toOfNat0.1 L ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD1 x) (fD1 y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (fD1 x) (fD1 y)))) (instHMul.1 L (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))))))) → (∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD1 x_1) (fD1 x)))) ε))

Logical form (Lean):

```lean
theorem C11Placement (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1 I)
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
theorem C11Placement (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1 I) := by
  sorry
/--
`BoundedSecondDerivativeImpliesC11` TODO

Predicate logic:

  (IsClassCk f (fun n => if n = 0 then f else if n = 1 then fD1 else fD2) I 2 ∧ ∀ x ∈ I, |fD2 x| ≤ M) → IsClassC11 f fD1 I ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I M

Predicate logic (unfolded):

  ∀ (f fD1 fD2 : Real → Real) (I : Real → Prop) (M : Real), (Real.instLE.1 Zero.toOfNat0.1 M ∧ ((∀ (x : Real), Set.instMembership.1 I x → ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => Decidable.casesOn (motive := fun x => Real → Real) (instDecidableEqNat n 1) (fun x => fD2) fun x => fD1) h) (fun h => (fun x => f) h) (n.dec0)) = instOfNatNat 0.1 = f ∧ ∀ (k : Nat), instLTNat.1 k (instOfNatNat 2).1 → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.max h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (instHDiv.hDiv (instHSub.hSub ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) k (instHAdd.hAdd x h)) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) k x)) h) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) (instHAdd.hAdd k 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) k (instHAdd.hAdd x h)) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) k x)) h) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) (instHAdd.hAdd k 1) x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) 2 x_1) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) 2 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) 2 x_1) ((fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) 2 x)))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLE.1 (SemilatticeSup.toMax.1 (fD2 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (fD2 x))) M)) → (((∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd x h)) (f x)) h) (fD1 x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (fD1 x_1) (fD1 x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD1 x_1) (fD1 x)))) ε)) ∧ Exists fun L => (Real.instLE.1 Zero.toOfNat0.1 L ∧ (Real.instLE.1 Zero.toOfNat0.1 L ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD1 x) (fD1 y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (fD1 x) (fD1 y)))) (instHMul.1 L (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y))))))) ∧ (Real.instLE.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (y : Real), Set.instMembership.1 I y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD1 x) (fD1 y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (fD1 x) (fD1 y)))) (instHMul.1 M (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))))))

Logical form (Lean):

```lean
theorem BoundedSecondDerivativeImpliesC11 (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (M : ℝ)
    (hM : M ≥ 0) (hclass : IsClassCk f (fun n => if n = 0 then f else if n = 1 then fD1 else fD2) I 2)
    (hbound : ∀ x ∈ I, |fD2 x| ≤ M) :
    IsClassC11 f fD1 I ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I M
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
theorem BoundedSecondDerivativeImpliesC11 (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (M : ℝ)
    (hM : M ≥ 0) (hclass : IsClassCk f (fun n => if n = 0 then f else if n = 1 then fD1 else fD2) I 2)
    (hbound : ∀ x ∈ I, |fD2 x| ≤ M) :
    IsClassC11 f fD1 I ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I M := by
  sorry
end LRA.Analysis.Differentiation
