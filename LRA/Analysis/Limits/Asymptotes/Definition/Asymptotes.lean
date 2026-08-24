import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition
import LRA.Analysis.Limits.Divergence.Definition

namespace LRA.Analysis.Limits

/--
`HasHorizontalAsymptoteAtPosInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε

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

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε

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

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 M (f x))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 M (f x))) (Or (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (f x) M)) (∀ (M : Real), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (f x) M))))

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

  ∀ (f : Real → Real) (X : Set Real) (m b ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (m b ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.1 (f x) (instHAdd.1 (instHMul.hMul m x) b)) x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHSub.1 (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) Zero.toOfNat0.1))) ε

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

  ∀ (f : Real → Real) (X : Set Real) (m b ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub ((fun x => instHSub.hSub (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) 0)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (m b ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.1 (f x) (instHAdd.1 (instHMul.hMul m x) b)) x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHSub.1 (f x) (instHAdd.hAdd (instHMul.hMul m x) b)) x) Zero.toOfNat0.1))) ε

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
