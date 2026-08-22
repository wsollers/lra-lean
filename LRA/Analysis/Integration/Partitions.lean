/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/partitions/notes-partitions.tex.

Full-coverage pass over the `partitions` section — the common vocabulary
(partitions, mesh, tags, refinement) every integral construction in this
chapter builds on. One Lean statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic

namespace LRA.Analysis.Integration

/-- `def:integration-partition`: a finite increasing list of break points
Mathematical statement (Lean): `structure IntegrationPartition (a b : ℝ)`.
from `a` to `b`.

Logical form:

```lean
structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ
```
-/
structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ

/-- `def:subinterval-width-integration`.
Mathematical statement (Lean): `def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=`.


Logical form:

```lean
def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc
```
-/
def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc

/-- `def:partition-mesh`.
Mathematical statement (Lean): `noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=`.


Logical form:

```lean
noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})
```
-/
noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})

/-- `def:tagged-partition-integration`: a partition together with a tag
Mathematical statement (Lean): `structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b`.
in each subinterval.

Logical form:

```lean
structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)
```
-/
structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

/-- `def:partition-refinement`: `P'` refines `P` iff every break point of
Mathematical statement (Lean): `def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=`.
`P` is a break point of `P'`.

Logical form:

```lean
def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (P'.n + 1), P'.points j = P.points i
```
-/
def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (P'.n + 1), P'.points j = P.points i

-- `lem:common-refinement-partitions`
/-- Let `a b : ℝ` and `P Q : IntegrationPartition a b`. Then `∃ R : IntegrationPartition a b,
RefinesPartition R P ∧ RefinesPartition R Q`.

Logical form:

```lean
theorem common_refinement_partitions {a b : ℝ} (P Q : IntegrationPartition a b) :
    ∃ R : IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q
```
-/
theorem common_refinement_partitions {a b : ℝ} (P Q : IntegrationPartition a b) :
    ∃ R : IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q := by
  sorry

end LRA.Analysis.Integration
