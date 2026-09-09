import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`PairwiseMax` TODO

Predicate logic:

  ∀ (A B : Set Real) (a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (Exists fun b => (b ∈ B ∧ a = Real.instMax.max a_1 b)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (Exists fun b => (b ∈ B ∧ a = Real.instMax.1 a_1 b)))

Logical form (Lean):

```lean
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}
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
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}

/--
`PairwiseMin` TODO

Predicate logic:

  ∀ (A B : Set Real) (a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (Exists fun b => (b ∈ B ∧ a = Real.instMin.min a_1 b)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (Exists fun b => (b ∈ B ∧ a = Real.instMin.1 a_1 b)))

Logical form (Lean):

```lean
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}
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
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}

/--
`SupremumOfPairwiseMaximumSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsSupremum sB B) → LRA.Analysis.Bounds.IsSupremum (Real.instMax.max sA sB) (LRA.Analysis.Bounds.Algebra.PairwiseMax A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMax.1 a b))) → Real.instPreorder.1.le x (Real.instMax.1 sA sB)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMax.1 a b))) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instMax.1 sA sB) u))

Logical form (Lean):

```lean
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B)
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
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B) := by
  sorry
/--
`InfimumOfPairwiseMaximumSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {iA iB : Real}, (LRA.Analysis.Bounds.IsInfimum iA A ∧ LRA.Analysis.Bounds.IsInfimum iB B) → LRA.Analysis.Bounds.IsInfimum (Real.instMax.max iA iB) (LRA.Analysis.Bounds.Algebra.PairwiseMax A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMax.1 a b))) → Real.instPreorder.1.le (Real.instMax.1 iA iB) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMax.1 a b))) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (Real.instMax.1 iA iB)))

Logical form (Lean):

```lean
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B)
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
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B) := by
  sorry
/--
`SupremumOfPairwiseMinimumSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {sA sB : Real}, (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsSupremum sB B) → LRA.Analysis.Bounds.IsSupremum (Real.instMin.min sA sB) (LRA.Analysis.Bounds.Algebra.PairwiseMin A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    sA sB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {sA sB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x sA) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sA u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le x sB) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le x u) → Real.instPreorder.1.le sB u))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMin.1 a b))) → Real.instPreorder.1.le x (Real.instMin.1 sA sB)) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMin.1 a b))) → Real.instPreorder.1.le x u) → Real.instPreorder.1.le (Real.instMin.1 sA sB) u))

Logical form (Lean):

```lean
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B)
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
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B) := by
  sorry
/--
`InfimumOfPairwiseMinimumSet` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ B.Nonempty) → ∀ {iA iB : Real}, (LRA.Analysis.Bounds.IsInfimum iA A ∧ LRA.Analysis.Bounds.IsInfimum iB B) → LRA.Analysis.Bounds.IsInfimum (Real.instMin.min iA iB) (LRA.Analysis.Bounds.Algebra.PairwiseMin A B)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    iA iB : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ Exists fun x => x ∈ B) → ∀ {iA iB : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le iA x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iA)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le iB x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l iB))) → ((∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMin.1 a b))) → Real.instPreorder.1.le (Real.instMin.1 iA iB) x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (Exists fun b => (b ∈ B ∧ x = Real.instMin.1 a b))) → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l (Real.instMin.1 iA iB)))

Logical form (Lean):

```lean
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B)
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
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B) := by
  sorry
end LRA.Analysis.Bounds.Algebra
