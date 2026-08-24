
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic

namespace LRA.Analysis.Integration

/--
`IntegrationPartition` TODO

Predicate logic:

  structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ

Predicate logic (unfolded):

  structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ
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
structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ

/--
`SubintervalWidth` TODO

Predicate logic:

  def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc

Predicate logic (unfolded):

  def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc
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
def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc

/--
`PartitionMesh` TODO

Predicate logic:

  noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})

Predicate logic (unfolded):

  noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i}) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})

/--
`TaggedPartitionIntegration` TODO

Predicate logic:

  structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

Predicate logic (unfolded):

  structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
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
structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

/--
`RefinesPartition` TODO

Predicate logic:

  ∀ {a b : Real} (P' P : LRA.Analysis.Integration.IntegrationPartition a b) (i : Fin (instHAdd.hAdd P.n 1)), Exists fun j => P'.points j = P.points i

Predicate logic (unfolded):

  ∀ {a b : Real} (P' P : LRA.Analysis.Integration.IntegrationPartition a b) (i : Fin (instHAdd.1 P.1 (instOfNatNat 1).1)), Exists fun j => P'.2 j = P.2 i

Logical form (Lean):

```lean
def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (P'.n + 1), P'.points j = P.points i
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
def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (P'.n + 1), P'.points j = P.points i

/--
`common_refinement_partitions` TODO

Predicate logic:

  ∃ R ∈ IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q

Predicate logic (unfolded):

  ∀ {a b : Real} (P Q : LRA.Analysis.Integration.IntegrationPartition a b), Exists fun R => (∀ (i : Fin (instHAdd.1 P.1 (instOfNatNat 1).1)), Exists fun j => R.2 j = P.2 i ∧ ∀ (i : Fin (instHAdd.1 Q.1 (instOfNatNat 1).1)), Exists fun j => R.2 j = Q.2 i)

Logical form (Lean):

```lean
theorem common_refinement_partitions {a b : ℝ} (P Q : IntegrationPartition a b) :
    ∃ R : IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem common_refinement_partitions {a b : ℝ} (P Q : IntegrationPartition a b) :
    ∃ R : IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q := by
  sorry

end LRA.Analysis.Integration
