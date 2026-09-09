
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    R fun i => f i x

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

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (A : Set Real) (x : Real), x ∈ A → R fun i => f i x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → R fun i => f i x

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

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (c : Real) (A : Set Real), Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → R fun i => f i x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ) → R fun i => f i x))

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

  ∀ {n : Nat} (Φ : (Fin n → Real) → Real) (f : Fin n → Real → Real) (A : Set Real) (x : Real), x ∈ A → LRA.Analysis.Functions.PointwiseOperationOnSet Φ f x = LRA.Analysis.Functions.AtPointOperation Φ f x

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    Φ : (Fin n → ℝ) → ℝ
    f : Fin n → (ℝ → ℝ)
    A : Set ℝ
  Prove
    x ∈ A → Φ fun i => f i x = Φ fun i => f i x

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

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (A : Set Real), LRA.Analysis.Functions.PointwiseRelationOnSet R f A ↔ ∀ (x : Real), x ∈ A → LRA.Analysis.Functions.AtPointRelation R f x

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    R : (Fin n → ℝ) → Prop
    f : Fin n → (ℝ → ℝ)
    A : Set ℝ
  Prove
    LRA.Analysis.Functions.PointwiseRelationOnSet R f A ↔ ∀ (x : Real), x ∈ A → LRA.Analysis.Functions.AtPointRelation R f x

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

  ∀ {n : Nat} (R : (Fin n → Real) → Prop) (f : Fin n → Real → Real) (c : Real) (A : Set Real), LRA.Analysis.Functions.PointwiseRelationNearPoint R f c A ↔ Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → R fun i => f i x))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    R : (Fin n → ℝ) → Prop
    f : Fin n → (ℝ → ℝ)
    c : ℝ
    A : Set ℝ
  Prove
    LRA.Analysis.Functions.PointwiseRelationNearPoint R f c A ↔ Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (abs (instHSub.hSub x c)) ∧ Real.instLT.lt (abs (instHSub.hSub x c)) δ) → R fun i => f i x))

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
