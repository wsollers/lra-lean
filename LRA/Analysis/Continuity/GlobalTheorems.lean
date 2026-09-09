
import Mathlib.Data.Real.Basic
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

/--
`ContinuousOn'` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (x : Real), x ∈ A → LRA.Analysis.Continuity.ContinuousAtPoint f A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))

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

  ∀ (f : Real → Real) (A : Set Real), Exists fun M => (GT.gt M 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) M))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (abs (f x)) M))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Exists fun M => (Real.instLT.lt 0 M ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (abs (f x)) M))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f c)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (f c)))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f c) (f x)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (c ∈ A ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f c) (f x)))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → (Exists fun c => LRA.Analysis.Continuity.IsAbsoluteMaximum f (Set.Icc a b) c ∧ Exists fun c => LRA.Analysis.Continuity.IsAbsoluteMinimum f (Set.Icc a b) c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ((Exists fun c => ((c ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (f x) (f c)))) ∧ (Exists fun c => ((c ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (f c) (f x)))))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ Real.instLT.lt (instHMul.hMul (f a) (f b)) 0)) → Exists fun c => (c ∈ Set.Ioo a b ∧ f c = 0)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ Real.instLT.lt ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f a) (f b)) 0)) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ f c = 0)

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

  ∀ (f : Real → Real) (a b y : Real), (Real.instLT.lt a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ (Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a)))))) → Exists fun c => (c ∈ Set.Ioo a b ∧ f c = y)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b y : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLT.lt a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ (Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a)))))) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ f c = y)

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ LRA.Analysis.Continuity.ContinuousOn' f I) → (Set.image f I).OrdConnected

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hf : ContinuousOn' f I
  Prove
    (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Set.OrdConnected fun x => Exists fun a => (a ∈ I ∧ f a = x)

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

  ∀ (f : Real → Real) (A : Set Real) (a : Real), a ∈ A → ∀ (b : Real), b ∈ A → ∀ (y : Real), Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a))) → Exists fun c => (c ∈ A ∧ f c = y)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a ∈ A → ∀ (b : Real), b ∈ A → ∀ (y : Real), Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a))) → Exists fun c => (c ∈ A ∧ f c = y)

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ LRA.Analysis.Continuity.ContinuousOn' f I) → LRA.Analysis.Continuity.DarbouxProperty f I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
    hf : ContinuousOn' f I
  Prove
    (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (a : Real), a ∈ I → ∀ (b : Real), b ∈ I → ∀ (y : Real), Or ((Real.instLT.lt (f a) y ∧ Real.instLT.lt y (f b))) ((Real.instLT.lt (f b) y ∧ Real.instLT.lt y (f a))) → Exists fun c => (c ∈ I ∧ f c = y)

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ Set.Icc a b → ∀ (y : Real), y ∈ Set.Icc a b → Real.instLT.lt (abs (instHSub.hSub x y)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f y))) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f y))) ε))

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → Exists fun m => Exists fun M => (Real.instLE.le m M ∧ Set.image f (Set.Icc a b) = Set.Icc m M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    hf : ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Exists fun m => Exists fun M => (Real.instLE.le m M ∧ (fun x => Exists fun a_2 => ((a_2 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) ∧ f a_2 = x) = funx => (Real.instPreorder.1.le m x ∧ Real.instPreorder.1.le x M)))

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
