import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`PairwiseMax` TODO

Predicate logic:

  ∀ (A B : Set Real) (a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ Exists fun b => (Set.instMembership.mem B b ∧ a = Real.instMax.max a_1 b))

Predicate logic (unfolded):

  ∀ (A B : Real → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ Exists fun b => (Set.instMembership.1 B b ∧ a = Real.instMax.1 a_1 b))

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

  ∀ (A B : Set Real) (a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ Exists fun b => (Set.instMembership.mem B b ∧ a = Real.instMin.min a_1 b))

Predicate logic (unfolded):

  ∀ (A B : Real → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ Exists fun b => (Set.instMembership.1 B b ∧ a = Real.instMin.1 a_1 b))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsSupremum sB B) → IsSupremum (max sA sB) (PairwiseMax A B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMax.1 a b))) x → Real.instPreorder.toLE.1 x (Real.instMax.1 sA sB) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMax.1 a b))) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instMax.1 sA sB) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsInfimum iA A ∧ IsInfimum iB B) → IsInfimum (max iA iB) (PairwiseMax A B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMax.1 a b))) x → Real.instPreorder.toLE.1 (Real.instMax.1 iA iB) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMax.1 a b))) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (Real.instMax.1 iA iB))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsSupremum sA A ∧ IsSupremum sB B) → IsSupremum (min sA sB) (PairwiseMin A B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {sA sB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x sA ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sA u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x sB ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 sB u)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMin.1 a b))) x → Real.instPreorder.toLE.1 x (Real.instMin.1 sA sB) ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMin.1 a b))) x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 (Real.instMin.1 sA sB) u)

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (IsInfimum iA A ∧ IsInfimum iB B) → IsInfimum (min iA iB) (PairwiseMin A B)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun x => Set.instMembership.1 B x) → ∀ {iA iB : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 iA x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iA) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 iB x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l iB)) → (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMin.1 a b))) x → Real.instPreorder.toLE.1 (Real.instMin.1 iA iB) x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ Exists fun b => (Set.instMembership.1 B b ∧ x = Real.instMin.1 a b))) x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l (Real.instMin.1 iA iB))

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
