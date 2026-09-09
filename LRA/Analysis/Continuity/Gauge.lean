
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

/--
`IntervalPartition` TODO

Predicate logic:

  structure IntervalPartition (a b : ℝ) where
    n : ℕ
    points : Fin (n + 1) → ℝ
    first_eq : points 0 = a
    last_eq : points (Fin.last n) = b
    mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j

Predicate logic (unfolded):

  structure IntervalPartition (a b : ℝ) where
    n : ℕ
    points : Fin (n + 1) → ℝ
    first_eq : points 0 = a
    last_eq : points (Fin.last n) = b
    mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntervalPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j
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
structure IntervalPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j

/--
`TaggedPartition` TODO

Predicate logic:

  structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
    tag : Fin n → ℝ
    tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

Predicate logic (unfolded):

  structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
    tag : Fin n → ℝ
    tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)
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
structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

/--
`IsGauge` TODO

Predicate logic:

  ∀ (a b : Real) (δ : Real → Real) (x : Real), x ∈ Set.Icc a b → GT.gt (δ x) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)

Logical form (Lean):

```lean
def IsGauge (a b : ℝ) (δ : ℝ → ℝ) : Prop :=
  ∀ x ∈ Set.Icc a b, δ x > 0
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
def IsGauge (a b : ℝ) (δ : ℝ → ℝ) : Prop :=
  ∀ x ∈ Set.Icc a b, δ x > 0

/--
`IsDeltaFine` TODO

Predicate logic:

  ∀ {a b : Real} (P : LRA.Analysis.Continuity.TaggedPartition a b) (δ : Real → Real) (i : Fin P.n), (GE.ge (P.points i.castSucc) (instHSub.hSub (P.tag i) (δ (P.tag i))) ∧ Real.instLE.le (P.points i.succ) (instHAdd.hAdd (P.tag i) (δ (P.tag i))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntervalPartition.2 ⟨i.1, ⋯⟩) ∧ Real.instLE.le (P.toIntervalPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))

Logical form (Lean):

```lean
def IsDeltaFine {a b : ℝ} (P : TaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)
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
def IsDeltaFine {a b : ℝ} (P : TaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

/--
`CousinsTheorem` TODO

Predicate logic:

  ∀ (a b : Real), Real.instLE.le a b → ∀ (δ : Real → Real), LRA.Analysis.Continuity.IsGauge a b δ → Exists fun P => LRA.Analysis.Continuity.IsDeltaFine P δ

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    δ : ℝ → ℝ
  Prove
    Real.instLE.le a b → ∀ (δ : Real → Real), (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) → Exists fun P => ∀ (i : Fin P.toIntervalPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntervalPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.le (P.toIntervalPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))

Logical form (Lean):

```lean
theorem CousinsTheorem (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ)
    (hδ : IsGauge a b δ) :
    ∃ P : TaggedPartition a b, IsDeltaFine P δ
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
theorem CousinsTheorem (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ)
    (hδ : IsGauge a b δ) :
    ∃ P : TaggedPartition a b, IsDeltaFine P δ := by
  sorry
/--
`MeshOf` TODO

Predicate logic:

  noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
    0

Predicate logic (unfolded):

  noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
    0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
  0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
  0

/--
`IsRefinementOf` TODO

Predicate logic:

  ∀ {a b : Real} (Q P : LRA.Analysis.Continuity.IntervalPartition a b) (i : Fin (instHAdd.hAdd P.n 1)), Exists fun j => Q.points j = P.points i

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun j => Q.2 j = P.2 i

Logical form (Lean):

```lean
def IsRefinementOf {a b : ℝ} (Q P : IntervalPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (Q.n + 1), Q.points j = P.points i
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
def IsRefinementOf {a b : ℝ} (Q P : IntervalPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (Q.n + 1), Q.points j = P.points i

/--
`HasCommonRefinement` TODO

Predicate logic:

  ∀ {a b : Real} (P₁ P₂ : LRA.Analysis.Continuity.IntervalPartition a b), Exists fun Q => (LRA.Analysis.Continuity.IsRefinementOf Q P₁ ∧ LRA.Analysis.Continuity.IsRefinementOf Q P₂)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Q => ((∀ (i : Fin ({ hAdd := fun a b => instAddNat.add a b }.hAdd P₁.1 1)), Exists fun j => Q.2 j = P₁.2 i) ∧ (∀ (i : Fin ({ hAdd := fun a b => instAddNat.add a b }.hAdd P₂.1 1)), Exists fun j => Q.2 j = P₂.2 i))

Logical form (Lean):

```lean
def HasCommonRefinement {a b : ℝ} (P₁ P₂ : IntervalPartition a b) : Prop :=
  ∃ Q : IntervalPartition a b, IsRefinementOf Q P₁ ∧ IsRefinementOf Q P₂
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def HasCommonRefinement {a b : ℝ} (P₁ P₂ : IntervalPartition a b) : Prop :=
  ∃ Q : IntervalPartition a b, IsRefinementOf Q P₁ ∧ IsRefinementOf Q P₂

/--
`CommonRefinementExists` TODO

Predicate logic:

  ∀ {a b : Real} (P₁ P₂ : LRA.Analysis.Continuity.IntervalPartition a b), LRA.Analysis.Continuity.HasCommonRefinement P₁ P₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    P₁ P₂ : IntervalPartition a b
  Prove
    Exists fun Q => ((∀ (i : Fin ({ hAdd := fun a b => instAddNat.add a b }.hAdd P₁.1 1)), Exists fun j => Q.2 j = P₁.2 i) ∧ (∀ (i : Fin ({ hAdd := fun a b => instAddNat.add a b }.hAdd P₂.1 1)), Exists fun j => Q.2 j = P₂.2 i))

Logical form (Lean):

```lean
theorem CommonRefinementExists {a b : ℝ} (P₁ P₂ : IntervalPartition a b) :
    HasCommonRefinement P₁ P₂
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem CommonRefinementExists {a b : ℝ} (P₁ P₂ : IntervalPartition a b) :
    HasCommonRefinement P₁ P₂ := by
  sorry
/--
`EveryPointCoveredByTag` TODO

Predicate logic:

  ∀ {a b : Real} (P : LRA.Analysis.Continuity.TaggedPartition a b) (x : Real), x ∈ Set.Icc a b → Exists fun i => x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    P : TaggedPartition a b
  Prove
    x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Exists fun i => x ∈ fun x => (Real.instPreorder.1.le (P.toIntervalPartition.2 (Fin.castLE ⋯ i)) x ∧ Real.instPreorder.1.le x (P.toIntervalPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)))

Logical form (Lean):

```lean
theorem EveryPointCoveredByTag {a b : ℝ} (P : TaggedPartition a b) :
    ∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ)
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
theorem EveryPointCoveredByTag {a b : ℝ} (P : TaggedPartition a b) :
    ∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ) := by
  sorry
end LRA.Analysis.Continuity
