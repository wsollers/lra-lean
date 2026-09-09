import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition
import LRA.Analysis.Limits.Divergence.Definition

namespace LRA.Analysis.Limits

/--
`HasHorizontalAsymptoteAtPosInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε

Logical form (Lean):

```lean
def HasHorizontalAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToInfty f X L
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
def HasHorizontalAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToInfty f X L

/--
`HasHorizontalAsymptoteAtNegInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε

Logical form (Lean):

```lean
def HasHorizontalAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToNegInfty f X L
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
def HasHorizontalAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToNegInfty f X L

/--
`HasVerticalAsymptoteAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Or (LRA.Analysis.Limits.DivergesToInftyFromRight f A c) (Or (LRA.Analysis.Limits.DivergesToInftyFromLeft f A c) (Or (LRA.Analysis.Limits.DivergesToNegInftyFromRight f A c) (LRA.Analysis.Limits.DivergesToNegInftyFromLeft f A c)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (∀ (M : Real), Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt M (f x)))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt M (f x)))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (f x) M))) (∀ (M : Real), Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (f x) M)))))

Logical form (Lean):

```lean
def HasVerticalAsymptoteAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  DivergesToInftyFromRight f A c ∨ DivergesToInftyFromLeft f A c ∨
    DivergesToNegInftyFromRight f A c ∨ DivergesToNegInftyFromLeft f A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def HasVerticalAsymptoteAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  DivergesToInftyFromRight f A c ∨ DivergesToInftyFromLeft f A c ∨
    DivergesToNegInftyFromRight f A c ∨ DivergesToNegInftyFromLeft f A c

/--
`HasObliqueAsymptoteAtPosInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (m b ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul m x) b)) x) 0)) ε

Logical form (Lean):

```lean
def HasObliqueAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToInfty (fun x => f x - (m * x + b)) X 0
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
def HasObliqueAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToInfty (fun x => f x - (m * x + b)) X 0

/--
`HasObliqueAsymptoteAtNegInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (m b ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul m x) b)) x) 0)) ε

Logical form (Lean):

```lean
def HasObliqueAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToNegInfty (fun x => f x - (m * x + b)) X 0
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
def HasObliqueAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToNegInfty (fun x => f x - (m * x + b)) X 0

end LRA.Analysis.Limits
