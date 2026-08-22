/-
Draft module promoted from scratch and wired into the Volume III Analysis integration router.
Source: book-integration/riemann-integration/notes/darboux-integral/notes-darboux-integral.tex.

Full-coverage pass over the `darboux-integral` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Continuity.MonotoneFunctions

namespace LRA.Analysis.Integration

variable {f g : ℝ → ℝ} {a b : ℝ}

/-- `def:darboux-sums`: lower and upper Darboux sums.
Mathematical statement (Lean): `noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=`.


Logical form:

```lean
noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))
```
-/
noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

/-- `UpperDarbouxSum`.
Mathematical statement (Lean): `noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=`.


Logical form:

```lean
noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))
```
-/
noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

-- `lem:darboux-refinement-squeeze`
/-- Let `P P' : IntegrationPartition a b`. If `h : RefinesPartition P' P`. Then `LowerDarbouxSum f P
≤ LowerDarbouxSum f P' ∧ LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧ UpperDarbouxSum f P' ≤
UpperDarbouxSum f P`.

Logical form:

```lean
theorem darboux_refinement_squeeze (P P' : IntegrationPartition a b) (h : RefinesPartition P' P) :
    LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧
    LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧
    UpperDarbouxSum f P' ≤ UpperDarbouxSum f P
```
-/
theorem darboux_refinement_squeeze (P P' : IntegrationPartition a b) (h : RefinesPartition P' P) :
    LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧
    LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧
    UpperDarbouxSum f P' ≤ UpperDarbouxSum f P := by
  sorry

/-- `def:darboux-integrability`.
Mathematical statement (Lean): `def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=`.


Logical form:

```lean
def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε
```
-/
def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε

-- `thm:darboux-criterion`
/-- If `hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`. Then
`IsDarbouxIntegrable f a b ↔ ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P -
LowerDarbouxSum f P < ε`.

Logical form:

```lean
theorem darboux_criterion (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b ↔
      ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε
```
-/
theorem darboux_criterion (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b ↔
      ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε := by
  sorry

-- `thm:riemann-darboux-equivalence`
/-- If `hab : a ≤ b` and `hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`.
Then `IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b`.

Logical form:

```lean
theorem riemann_darboux_equivalence (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b
```
-/
theorem riemann_darboux_equivalence (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b := by
  sorry

-- `thm:continuous-darboux-integrable`
/-- If `hab : a ≤ b` and `hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`.
Then `IsDarbouxIntegrable f a b`.

Logical form:

```lean
theorem continuous_darboux_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b
```
-/
theorem continuous_darboux_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry

-- `thm:monotone-darboux-integrable`
/-- If `hab : a ≤ b` and `hmono : MonotoneOn f (Set.Icc a b)`. Then `IsDarbouxIntegrable f a b`.

Logical form:

```lean
theorem monotone_darboux_integrable (hab : a ≤ b) (hmono : MonotoneOn f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b
```
-/
theorem monotone_darboux_integrable (hab : a ≤ b) (hmono : MonotoneOn f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry

-- `thm:finite-discontinuities-darboux-integrable`
/-- If `hab : a ≤ b`, `hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`, and
`hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a
b) x}.Finite`. Then `IsDarbouxIntegrable f a b`.

Logical form:

```lean
theorem finite_discontinuities_darboux_integrable (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) :
    IsDarbouxIntegrable f a b
```
-/
theorem finite_discontinuities_darboux_integrable (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) :
    IsDarbouxIntegrable f a b := by
  sorry

-- `thm:darboux-integrable-linear-combinations`
/-- Let `α β : ℝ`. If `hf : IsDarbouxIntegrable f a b` and `hg : IsDarbouxIntegrable g a b`. Then
`IsDarbouxIntegrable (fun x => α * f x + β * g x) a b`.

Logical form:

```lean
theorem darboux_integrable_linear_combinations (hf : IsDarbouxIntegrable f a b)
    (hg : IsDarbouxIntegrable g a b) (α β : ℝ) :
    IsDarbouxIntegrable (fun x => α * f x + β * g x) a b
```
-/
theorem darboux_integrable_linear_combinations (hf : IsDarbouxIntegrable f a b)
    (hg : IsDarbouxIntegrable g a b) (α β : ℝ) :
    IsDarbouxIntegrable (fun x => α * f x + β * g x) a b := by
  sorry

-- `thm:darboux-integrable-products`
/-- If `hf : IsDarbouxIntegrable f a b` and `hg : IsDarbouxIntegrable g a b`. Then
`IsDarbouxIntegrable (fun x => f x * g x) a b`.

Logical form:

```lean
theorem darboux_integrable_products (hf : IsDarbouxIntegrable f a b) (hg : IsDarbouxIntegrable g a b) :
    IsDarbouxIntegrable (fun x => f x * g x) a b
```
-/
theorem darboux_integrable_products (hf : IsDarbouxIntegrable f a b) (hg : IsDarbouxIntegrable g a b) :
    IsDarbouxIntegrable (fun x => f x * g x) a b := by
  sorry

-- `thm:darboux-integrable-absolute-value`
/-- If `hf : IsDarbouxIntegrable f a b`. Then `IsDarbouxIntegrable (fun x => |f x|) a b`.

Logical form:

```lean
theorem darboux_integrable_absolute_value (hf : IsDarbouxIntegrable f a b) :
    IsDarbouxIntegrable (fun x => |f x|) a b
```
-/
theorem darboux_integrable_absolute_value (hf : IsDarbouxIntegrable f a b) :
    IsDarbouxIntegrable (fun x => |f x|) a b := by
  sorry

-- `thm:darboux-integrable-continuous-composition`
/-- Let `J : Set ℝ`. If `hf : IsDarbouxIntegrable f a b`, `hfbdd :
LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)`, `hJ : f '' Set.Icc a b ⊆ J`, `φ
: ℝ → ℝ`, and `hφ : LRA.Analysis.Continuity.ContinuousOn' φ J`. Then
`IsDarbouxIntegrable (fun x => φ (f x)) a b`.

Logical form:

```lean
theorem darboux_integrable_continuous_composition (hf : IsDarbouxIntegrable f a b)
    (hfbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (J : Set ℝ) (hJ : f '' Set.Icc a b ⊆ J) (φ : ℝ → ℝ)
    (hφ : LRA.Analysis.Continuity.ContinuousOn' φ J) :
    IsDarbouxIntegrable (fun x => φ (f x)) a b
```
-/
theorem darboux_integrable_continuous_composition (hf : IsDarbouxIntegrable f a b)
    (hfbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (J : Set ℝ) (hJ : f '' Set.Icc a b ⊆ J) (φ : ℝ → ℝ)
    (hφ : LRA.Analysis.Continuity.ContinuousOn' φ J) :
    IsDarbouxIntegrable (fun x => φ (f x)) a b := by
  sorry

/-- The theorem asserts non-integrability of the Dirichlet function on
`[0,1]`.

Logical form:

```lean
theorem dirichlet_not_darboux_integrable :
    ¬ IsDarbouxIntegrable
      (fun x => by
        classical
        exact if LRA.Analysis.Completeness.IsIrrational x then (0 : ℝ) else 1) 0 1
```
-/
theorem dirichlet_not_darboux_integrable :
    ¬ IsDarbouxIntegrable
      (fun x => by
        classical
        exact if LRA.Analysis.Completeness.IsIrrational x then (0 : ℝ) else 1) 0 1 := by
  sorry

end LRA.Analysis.Integration
