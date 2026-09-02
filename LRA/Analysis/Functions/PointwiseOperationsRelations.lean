
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fin.Basic

namespace LRA.Analysis.Functions

/--
`AtPointOperation` TODO

Predicate logic:

  def AtPointOperation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : ℝ :=
  Φ (fun i => f i x)

Predicate logic (unfolded):

  def AtPointOperation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : ℝ :=
  Φ (fun i => f i x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AtPointOperation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : ℝ :=
  Φ (fun i => f i x)
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
def AtPointOperation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : ℝ :=
  Φ (fun i => f i x)

/--
`PointwiseOperationOnSet` TODO

Predicate logic:

  def PointwiseOperationOnSet {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) : ℝ → ℝ :=
  fun x => Φ (fun i => f i x)

Predicate logic (unfolded):

  def PointwiseOperationOnSet {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) : ℝ → ℝ :=
  fun x => Φ (fun i => f i x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PointwiseOperationOnSet {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) : ℝ → ℝ :=
  fun x => Φ (fun i => f i x)
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
def PointwiseOperationOnSet {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) : ℝ → ℝ :=
  fun x => Φ (fun i => f i x)

/--
`AtPointRelation` TODO

Predicate logic:

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (x : Real), R fun i => f i x

Predicate logic (unfolded):

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (x : Real), R fun i => f i x

Logical form (Lean):

```lean
def AtPointRelation {n : ℕ} (R : (Fin n → ℝ) → Prop) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : Prop :=
  R (fun i => f i x)
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
def AtPointRelation {n : ℕ} (R : (Fin n → ℝ) → Prop) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : Prop :=
  R (fun i => f i x)

/--
`PointwiseRelationOnSet` TODO

Predicate logic:

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → R fun i => f i x

Predicate logic (unfolded):

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → R fun i => f i x

Logical form (Lean):

```lean
def PointwiseRelationOnSet {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, R (fun i => f i x)
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
def PointwiseRelationOnSet {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, R (fun i => f i x)

/--
`PointwiseRelationNearPoint` TODO

Predicate logic:

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → R fun i => f i x)

Predicate logic (unfolded):

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (c : Real) (A : Real → Prop), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → R fun i => f i x)

Logical form (Lean):

```lean
def PointwiseRelationNearPoint {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → R (fun i => f i x)
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
def PointwiseRelationNearPoint {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → R (fun i => f i x)

/--
`PointwiseOperationEvaluation` TODO

Predicate logic:

  ((Fin n → ℝ) → ℝ ∧ Fin n → (ℝ → ℝ)) → ∀ x ∈ A, PointwiseOperationOnSet Φ f x = AtPointOperation Φ f x

Predicate logic (unfolded):

  ∀ {n : Nat} (Φ : (Fin n → Real) → Real) (f : Fin n → Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → Φ fun i => f i x = Φ fun i => f i x

Logical form (Lean):

```lean
theorem PointwiseOperationEvaluation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseOperationOnSet Φ f x = AtPointOperation Φ f x
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
theorem PointwiseOperationEvaluation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseOperationOnSet Φ f x = AtPointOperation Φ f x := by
  sorry
/--
`PointwiseRelationEvaluation` TODO

Predicate logic:

  ((Fin n → ℝ) → Prop ∧ Fin n → (ℝ → ℝ)) → PointwiseRelationOnSet R f A ↔ ∀ x ∈ A, AtPointRelation R f x

Predicate logic (unfolded):

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (A : Real → Prop), ∀ (x : Real), Set.instMembership.1 A x → R fun i => f i x ↔ ∀ (x : Real), Set.instMembership.1 A x → R fun i => f i x

Logical form (Lean):

```lean
theorem PointwiseRelationEvaluation {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    PointwiseRelationOnSet R f A ↔ ∀ x ∈ A, AtPointRelation R f x
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
theorem PointwiseRelationEvaluation {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    PointwiseRelationOnSet R f A ↔ ∀ x ∈ A, AtPointRelation R f x := by
  sorry
/--
`PointwiseRelationNearUnpacking` TODO

Predicate logic:

  ((Fin n → ℝ) → Prop ∧ Fin n → (ℝ → ℝ)) → PointwiseRelationNearPoint R f c A ↔ ∃ δ > 0, ∀ x ∈ A, (0 < |x - c| ∧ |x - c| < δ) → R (fun i => f i x)

Predicate logic (unfolded):

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (c : Real) (A : Real → Prop), Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → R fun i => f i x) ↔ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ) → R fun i => f i x)

Logical form (Lean):

```lean
theorem PointwiseRelationNearUnpacking {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) :
    PointwiseRelationNearPoint R f c A ↔
      ∃ δ > 0, ∀ x ∈ A, (0 < |x - c| ∧ |x - c| < δ) → R (fun i => f i x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem PointwiseRelationNearUnpacking {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) :
    PointwiseRelationNearPoint R f c A ↔
      ∃ δ > 0, ∀ x ∈ A, (0 < |x - c| ∧ |x - c| < δ) → R (fun i => f i x) := by
  sorry
end LRA.Analysis.Functions
