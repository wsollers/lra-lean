
import Mathlib.Data.Real.Basic
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

/--
`ContinuousOn'` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → LRA.Analysis.Continuity.ContinuousAtPoint f A x

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 A x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x_1) (f x)))) ε)

Logical form (Lean):

```lean
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x
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
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x

/--
`BoundedOnSet` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real), Exists fun M => (GT.gt M 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (abs (f x)) M)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)

Logical form (Lean):

```lean
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M
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
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M

/--
`BoundednessTheorem` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → BoundedOnSet f (Set.Icc a b)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)

Logical form (Lean):

```lean
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b)
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
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b) := by
  sorry

/--
`IsAbsoluteMaximum` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (f x) (f c))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f c))

Logical form (Lean):

```lean
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c
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
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c

/--
`IsAbsoluteMinimum` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (Set.instMembership.mem A c ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLE.le (f c) (f x))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Set.instMembership.1 A c ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f c) (f x))

Logical form (Lean):

```lean
def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x
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
def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x

/--
`ExtremeValueTheorem` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧ (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → (Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) c ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (f x) (f c)) ∧ Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) c ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (f c) (f x)))

Logical form (Lean):

```lean
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c)
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
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c) := by
  sorry

/--
`LocationOfRoots` TODO

Predicate logic:

  (ℝ → ℝ ∧ a < b ∧ f a * f b < 0) → ∃ c ∈ Set.Ioo a b, f c = 0

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ Real.instLT.1 (instHMul.1 (f a) (f b)) Zero.toOfNat0.1)) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ f c = Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0
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
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0 := by
  sorry

/--
`BolzanoIntermediateValue` TODO

Predicate logic:

  (ℝ → ℝ ∧ a < b ∧ (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) → ∃ c ∈ Set.Ioo a b, f c = y

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b y : Real), (Real.instLT.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ Or ((Real.instLT.1 (f a) y ∧ Real.instLT.1 y (f b))) ((Real.instLT.1 (f b) y ∧ Real.instLT.1 y (f a))))) → Exists fun c => (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) c ∧ f c = y)

Logical form (Lean):

```lean
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y
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
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y := by
  sorry

/--
`PreservationOfIntervals` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ) → (f '' I).OrdConnected

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Set.OrdConnected fun x => Exists fun a => (Set.instMembership.1 I a ∧ f a = x)

Logical form (Lean):

```lean
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected
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
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected := by
  sorry

/--
`DarbouxProperty` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (a : Real), Set.instMembership.mem A a → ∀ (b : Real), Set.instMembership.mem A b → ∀ (y : Real), Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a))) → Exists fun c => (Set.instMembership.mem A c ∧ f c = y)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (a : Real), Set.instMembership.1 A a → ∀ (b : Real), Set.instMembership.1 A b → ∀ (y : Real), Or ((Real.instLT.1 (f a) y ∧ Real.instLT.1 y (f b))) ((Real.instLT.1 (f b) y ∧ Real.instLT.1 y (f a))) → Exists fun c => (Set.instMembership.1 A c ∧ f c = y)

Logical form (Lean):

```lean
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y
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
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y

/--
`ContinuousImpliesDarbouxProperty` TODO

Predicate logic:

  (∀ hI ∈ I.OrdConnected), (ℝ → ℝ) → DarbouxProperty f I

Predicate logic (unfolded):

  ∀ (f : Real → Real) (I : Real → Prop), (Set.OrdConnected I ∧ ∀ (x : Real), Set.instMembership.1 I x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 I x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (a : Real), Set.instMembership.1 I a → ∀ (b : Real), Set.instMembership.1 I b → ∀ (y : Real), Or ((Real.instLT.1 (f a) y ∧ Real.instLT.1 y (f b))) ((Real.instLT.1 (f b) y ∧ Real.instLT.1 y (f a))) → Exists fun c => (Set.instMembership.1 I c ∧ f c = y)

Logical form (Lean):

```lean
theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I
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
theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I := by
  sorry

/--
`HeineCantor` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b, |x - y| < δ → |f x - f y| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε)

Logical form (Lean):

```lean
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε
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
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε := by
  sorry

/--
`ImageOfClosedBoundedInterval` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Exists fun m => Exists fun M => (Real.instLE.1 m M ∧ fun x => Exists fun a_2 => (Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) a_2 ∧ f a_2 = x) = funx => (Real.instPreorder.toLE.1 m x ∧ Real.instPreorder.toLE.1 x M))

Logical form (Lean):

```lean
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M
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
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M := by
  sorry

end LRA.Analysis.Continuity
