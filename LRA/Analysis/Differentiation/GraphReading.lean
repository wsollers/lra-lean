
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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun δ => (GT.gt δ 0 ∧ ((∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) (f c)) ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (f c) (f x))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ ((∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) (f c)) ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (f c) (f x))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun δ => (GT.gt δ 0 ∧ ((∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f c) (f x)) ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (f x) (f c))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ ((∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f c) (f x)) ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (f x) (f c))))

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

  ∀ (f : Real → Real) (I : Set Real) (x : Real), x ∈ I → ∀ (y : Real), (y ∈ I ∧ Real.instLT.lt x y) → Real.instLE.le (f y) (f x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ I → ∀ (y : Real), (y ∈ I ∧ Real.instLT.lt x y) → Real.instLE.le (f y) (f x)

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.IsDifferentiable f I x)) → LRA.Analysis.Differentiation.OrderReversing f I ↔ ∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x → Real.instLE.le D 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.IsDifferentiable f I x)) → LRA.Analysis.Differentiation.OrderReversing f I ↔ ∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x → Real.instLE.le D 0

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

  ∀ (f : Real → Real) (I : Set Real), (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative 0 f I x)) → Exists fun k => ∀ (x : Real), x ∈ I → f x = k

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) 0)) ε)))) → Exists fun k => ∀ (x : Real), x ∈ I → f x = k

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

  ∀ (f g : Real → Real) (I : Set Real), (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x ↔ LRA.Analysis.Differentiation.Derivative D g I x)) → Exists fun k => ∀ (x : Real), x ∈ I → instHSub.hSub (f x) (g x) = k

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (I.OrdConnected ∧ (∀ (x : Real), x ∈ I → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f I x ↔ LRA.Analysis.Differentiation.Derivative D g I x)) → Exists fun k => ∀ (x : Real), x ∈ I → instHSub.hSub (f x) (g x) = k

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ interior A ∧ (LRA.Analysis.Differentiation.Derivative 0 f A c ∧ ((Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f A x → GT.gt D 0))) ∧ (Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f A x → Real.instLT.lt D 0)))))) → LRA.Analysis.Differentiation.IsRelativeMaximum f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    hcrit : Derivative 0 f A c
  Prove
    ((c ∈ Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ { le := Set.Subset }.le t A)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) 0)) ε))) ∧ ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) → Real.instLT.lt 0 D))) ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) → Real.instLT.lt D 0)))))) → (c ∈ A ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (f x) (f c)))))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), (c ∈ interior A ∧ (LRA.Analysis.Differentiation.Derivative 0 f A c ∧ ((Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f A x → Real.instLT.lt D 0))) ∧ (Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → ∀ (D : Real), LRA.Analysis.Differentiation.Derivative D f A x → GT.gt D 0)))))) → LRA.Analysis.Differentiation.IsRelativeMinimum f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    hcrit : Derivative 0 f A c
  Prove
    ((c ∈ Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ { le := Set.Subset }.le t A)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) 0)) ε))) ∧ ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) → Real.instLT.lt D 0))) ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → ∀ (D : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε))) → Real.instLT.lt 0 D)))))) → (c ∈ A ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (f c) (f x)))))

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

  ∀ (D2 : Real) (a fD1 : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (h : Real), instHAdd.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD1 (instHAdd.hAdd c h)) (fD1 c)) h) D2)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD1 c)) h) D2)) ε))

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

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Set Real) (n : Nat) (c : Real), (fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → LRA.Analysis.Differentiation.Derivative (fD (instHAdd.hAdd k 1) c) (fD k) A c))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD k c)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) c))) ε))))

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

  ∀ (f fD1 fD2 : Real → Real) (I : Set Real), (I.OrdConnected ∧ ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD1 x) f I x) ∧ ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD2 x) fD1 I x) ∧ (∀ (x : Real), x ∈ I → GE.ge (fD2 x) 0)))) → LRA.Analysis.Differentiation.IsConvexOn f I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f fD1 fD2 : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (Set.OrdConnected I ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD1 x)) h) (fD2 x))) ε))) ∧ (∀ (x : Real), x ∈ I → Real.instLE.le 0 (fD2 x))))) → (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y)))))

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

  ∀ (f fD1 fD2 : Real → Real) (I : Set Real), (I.OrdConnected ∧ ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD1 x) f I x) ∧ ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD2 x) fD1 I x) ∧ (∀ (x : Real), x ∈ I → Real.instLE.le (fD2 x) 0)))) → LRA.Analysis.Differentiation.IsConcaveOn f I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f fD1 fD2 : ℝ → ℝ
    I : Set ℝ
    hI : I.OrdConnected
  Prove
    (Set.OrdConnected I ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD1 x)) h) (fD2 x))) ε))) ∧ (∀ (x : Real), x ∈ I → Real.instLE.le (fD2 x) 0)))) → (Set.OrdConnected I ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y))) (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y)))))

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

  ∀ (f fD1 fD2 : Real → Real) (A : Set Real) (c : Real), (LRA.Analysis.Differentiation.Derivative 0 f A c ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Differentiation.Derivative (fD1 x) f A x) ∧ LRA.Analysis.Differentiation.Derivative (fD2 c) fD1 A c)) → ((GT.gt (fD2 c) 0 → LRA.Analysis.Differentiation.IsRelativeMinimum f A c) ∧ (Real.instLT.lt (fD2 c) 0 → LRA.Analysis.Differentiation.IsRelativeMaximum f A c))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f fD1 fD2 : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    hD1c : Derivative 0 f A c
    hD2c : Derivative (fD2 c) fD1 A c
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) 0)) ε))) ∧ ((∀ (x : Real), x ∈ A → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD1 c)) h) (fD2 c))) ε))))) → ((Real.instLT.lt 0 (fD2 c) → (c ∈ A ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (f c) (f x)))))) ∧ (Real.instLT.lt (fD2 c) 0 → (c ∈ A ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (f x) (f c)))))))

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

  ∀ (f fD1 fD2 : Real → Real) (A : Set Real) (c : Real), (LRA.Analysis.Differentiation.IsInflection f c ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Differentiation.Derivative (fD1 x) f A x) ∧ ((∀ (x : Real), x ∈ A → LRA.Analysis.Differentiation.Derivative (fD2 x) fD1 A x) ∧ LRA.Analysis.Continuity.ContinuousAtPoint fD2 A c))) → fD2 c = 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f fD1 fD2 : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    hcont : LRA.Analysis.Continuity.ContinuousAtPoint fD2 A c
  Prove
    ((Or (Exists fun δ => (Real.instLT.lt 0 δ ∧ (((Set.OrdConnected fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c)) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c) → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y))))) ∧ ((Set.OrdConnected fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y))) (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y)))))))) (Exists fun δ => (Real.instLT.lt 0 δ ∧ (((Set.OrdConnected fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c)) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x ∧ Real.instPreorder.1.le x c) → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y))) (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y))))) ∧ ((Set.OrdConnected fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) → ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le c x ∧ Real.instPreorder.1.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ)) → ∀ (t : Real), Real.instLE.le 0 t → Real.instLE.le t 1 → Real.instLE.le (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) y))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul t (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 t) (f y))))))))) ∧ ((∀ (x : Real), x ∈ A → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ ((∀ (x : Real), x ∈ A → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD1 x)) h) (fD2 x))) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD2 x) (fD2 c))) ε)))))) → fD2 c = 0

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

  ∀ (f : Real → Real) (a b : Real), (Real.instLT.lt a b ∧ (∀ (x : Real), x ∈ Set.Icc a b → LRA.Analysis.Differentiation.IsDifferentiable f (Set.Icc a b) x)) → ∀ (Da Db : Real), (LRA.Analysis.Differentiation.Derivative Da f (Set.Icc a b) a ∧ LRA.Analysis.Differentiation.Derivative Db f (Set.Icc a b) b) → ∀ (k : Real), Or ((Real.instLT.lt Da k ∧ Real.instLT.lt k Db)) ((Real.instLT.lt Db k ∧ Real.instLT.lt k Da)) → Exists fun c => (c ∈ Set.Ioo a b ∧ LRA.Analysis.Differentiation.Derivative k f (Set.Icc a b) c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    Da Db : ℝ
    hDa : Derivative Da f (Set.Icc a b) a
    hDb : Derivative Db f (Set.Icc a b) b
    k : ℝ
  Prove
    (Real.instLT.lt a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) D)) ε)))) → ∀ (Da Db : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd a h ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a h)) (f a)) h) Da)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd b h ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd b h)) (f b)) h) Db)) ε)))) → ∀ (k : Real), Or ((Real.instLT.lt Da k ∧ Real.instLT.lt k Db)) ((Real.instLT.lt Db k ∧ Real.instLT.lt k Da)) → Exists fun c => ((c ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) k)) ε))))

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

  ∀ (f fD1 : Real → Real) (I : Set Real), ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.Derivative (fD1 x) f I x) ∧ LRA.Analysis.Continuity.ContinuousOn' fD1 I)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε))))

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

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (k : Nat), ((∀ (x : Real), x ∈ I → LRA.Analysis.Differentiation.HigherDerivativeAt f fD I k x) ∧ LRA.Analysis.Continuity.ContinuousOn' (fD k) I)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Real), x ∈ I → (fD 0 = f ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : Real), x ∈ I → (fD 0 = f ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))))

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

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (a : Real), a ∈ I → Exists fun r => (GT.gt r 0 ∧ (∀ (x : Real), x ∈ Set.Ioo (instHSub.hSub a r) (instHAdd.hAdd a r) ∩ I → Filter.Tendsto (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) Filter.atTop (nhds (f x))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a ∈ I → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub a r) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a r)) ∩ I → Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => setOf fun x_2 => (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_2 ∈ x_1 ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x))))

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

  ∀ (I : Set Real), I.Nontrivial → ((∀ (f : Real → Real) (fD : Nat → Real → Real) (k : Nat), LRA.Analysis.Differentiation.IsClassCk f fD I (instHAdd.hAdd k 1) → LRA.Analysis.Differentiation.IsClassCk f fD I k) ∧ (∀ (f : Real → Real) (fD : Nat → Real → Real), LRA.Analysis.Differentiation.IsClassCOmega f fD I → LRA.Analysis.Differentiation.IsClassCInfty f fD I))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I : Set ℝ
    hI : I.Nontrivial
  Prove
    (Exists fun x => (x ∈ I ∧ (Exists fun y => (y ∈ I ∧ (x = y → False))))) → ((∀ (f : Real → Real) (fD : Nat → Real → Real) (k : Nat), ((∀ (x : Real), x ∈ I → (fD 0 = f ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) x_1) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) x))) ε)))) → ((∀ (x : Real), x ∈ I → (fD 0 = f ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))))) ∧ (∀ (f : Real → Real) (fD : Nat → Real → Real), (∀ (a : Real), a ∈ I → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub a r) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a r)) ∩ I → Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => Set.preimage (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_1 ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (f x))))) → ∀ (k : Nat), ((∀ (x : Real), x ∈ I → (fD 0 = f ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), instHAdd.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))))))

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

  ∀ (f fD1 : Real → Real) (I : Set Real), (LRA.Analysis.Differentiation.IsClassC1 f fD1 I ∧ (Exists fun L => (GE.ge L 0 ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I L)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε)))) ∧ (Exists fun L => (Real.instLE.le 0 L ∧ (Real.instLE.le 0 L ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x) (fD1 y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))))))))

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

  ∀ (I : Set Real), I.Nontrivial → ∀ (f fD1 : Real → Real), LRA.Analysis.Differentiation.IsClassC11 f fD1 I → LRA.Analysis.Differentiation.IsClassC1 f fD1 I

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    I : Set ℝ
    hI : I.Nontrivial
  Prove
    (Exists fun x => (x ∈ I ∧ (Exists fun y => (y ∈ I ∧ (x = y → False))))) → ∀ (f fD1 : Real → Real), (((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε)))) ∧ (Exists fun L => (Real.instLE.le 0 L ∧ (Real.instLE.le 0 L ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x) (fD1 y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))))) → ((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε))))

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

  ∀ (f fD1 fD2 : Real → Real) (I : Set Real) (M : Real), (GE.ge M 0 ∧ (LRA.Analysis.Differentiation.IsClassCk f (fun n => ite (n = 0)f (ite (n = 1)fD1 fD2)) I 2 ∧ (∀ (x : Real), x ∈ I → Real.instLE.le (abs (fD2 x)) M))) → (LRA.Analysis.Differentiation.IsClassC11 f fD1 I ∧ LRA.Analysis.Continuity.IsLipschitzOn fD1 I M)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f fD1 fD2 : ℝ → ℝ
    I : Set ℝ
    M : ℝ
    hM : M ≥ 0
  Prove
    (Real.instLE.le 0 M ∧ (((∀ (x : Real), x ∈ I → (((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => Decidable.casesOn (motive := fun x => Real → Real) (instDecidableEqNat n 1) (fun x => fD2) fun x => fD1) h) (fun h => (fun x => f) h) (n.dec0)) = 0 = f) ∧ (∀ (k : Nat), instLTNat.lt k 2 → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => ite (n = 1)fD1 fD2) h) (fun h => (fun x => f) h) (instDecidableEqNat n 0)) k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => ite (n = 1)fD1 fD2) h) (fun h => (fun x => f) h) (instDecidableEqNat n 0)) k x)) h) ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => ite (n = 1)fD1 fD2) h) (fun h => (fun x => f) h) (instDecidableEqNat n 0)) ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => Decidable.casesOn (motive := fun x => Real → Real) (instDecidableEqNat n 1) (fun x => fD2) fun x => fD1) h) (fun h => (fun x => f) h) (n.dec0)) = 2x_1) ((fun n => Decidable.rec (motive := fun x => Real → Real) (fun h => (fun x => Decidable.casesOn (motive := fun x => Real → Real) (instDecidableEqNat n 1) (fun x => fD2) fun x => fD1) h) (fun h => (fun x => f) h) (n.dec0)) = 2x))) ε)))) ∧ (∀ (x : Real), x ∈ I → Real.instLE.le (abs (fD2 x)) M))) → ((((∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (f x)) h) (fD1 x))) ε))) ∧ (∀ (x : Real), x ∈ I → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x_1) (fD1 x))) ε)))) ∧ (Exists fun L => (Real.instLE.le 0 L ∧ (Real.instLE.le 0 L ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x) (fD1 y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y)))))))) ∧ (Real.instLE.le 0 M ∧ (∀ (x : Real), x ∈ I → ∀ (y : Real), y ∈ I → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD1 x) (fD1 y))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul M (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x y))))))

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
