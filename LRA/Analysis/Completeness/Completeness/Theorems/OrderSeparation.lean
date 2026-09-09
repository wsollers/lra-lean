import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.MaximaMinima
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`OrderSeparationBySupremum` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ (B.Nonempty ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → Real.instLE.le a b))) → (Exists fun u => LRA.Analysis.Bounds.IsUpperBound u A ∧ (Exists fun l => LRA.Analysis.Bounds.IsLowerBound l B ∧ (Exists fun c => (LRA.Analysis.Bounds.IsSupremum c A ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → (Real.instLE.le a c ∧ Real.instLE.le c b))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun x => x ∈ B ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → Real.instLE.le a b))) → ((Exists fun u => ∀ (x : Real), x ∈ A → Real.instLE.le x u) ∧ ((Exists fun l => ∀ (x : Real), x ∈ B → Real.instLE.le l x) ∧ (Exists fun c => (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x c) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le c u)) ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → (Real.instLE.le a c ∧ Real.instLE.le c b))))))

Logical form (Lean):

```lean
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b) := by
  sorry
/--
`SupremumLeInfimumOfOrderSeparatedSets` TODO

Predicate logic:

  ∀ {A B : Set Real}, (A.Nonempty ∧ (B.Nonempty ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → Real.instLE.le a b))) → ∀ {s i : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ LRA.Analysis.Bounds.IsInfimum i B) → Real.instLE.le s i

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A B : Set ℝ
    leftNonemptyHypothesis : A.Nonempty
    rightNonemptyHypothesis : B.Nonempty
    s i : ℝ
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun x => x ∈ B ∧ (∀ (a : Real), a ∈ A → ∀ (b : Real), b ∈ B → Real.instLE.le a b))) → ∀ {s i : Real}, (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ ((∀ (x : Real), x ∈ B → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ B → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i))) → Real.instLE.le s i

Logical form (Lean):

```lean
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i
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
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i := by
  sorry
/--
`DedekindCutProperty` TODO

Predicate logic:

  ∀ {L U : Set Real}, (L.Nonempty ∧ (U.Nonempty ∧ (L ∩ U = Set.instEmptyCollection.emptyCollection ∧ (L ∪ U = Set.univ ∧ (∀ (l : Real), l ∈ L → ∀ (u : Real), u ∈ U → Real.instLT.lt l u))))) → Or (Exists fun m => LRA.Analysis.Bounds.IsMaximum m L) (Exists fun n => LRA.Analysis.Bounds.IsMinimum n U)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    L U : Set ℝ
    lowerSetNonemptyHypothesis : L.Nonempty
    upperSetNonemptyHypothesis : U.Nonempty
  Prove
    (Exists fun x => x ∈ L ∧ (Exists fun x => x ∈ U ∧ (L ∩ U = Set.instEmptyCollection.1 ∧ (L ∪ U = fun_a => True ∧ (∀ (l : Real), l ∈ L → ∀ (u : Real), u ∈ U → Real.instLT.lt l u))))) → Or (Exists fun m => (m ∈ L ∧ (∀ (x : Real), x ∈ L → Real.instLE.le x m))) (Exists fun n => (n ∈ U ∧ (∀ (x : Real), x ∈ U → Real.instLE.le n x)))

Logical form (Lean):

```lean
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, use

-/
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U) := by
  sorry
/--
`NoGapsInReals` TODO

Predicate logic:

  ∀ {L U : Set Real}, (L.Nonempty ∧ (U.Nonempty ∧ (L ∩ U = Set.instEmptyCollection.emptyCollection ∧ (L ∪ U = Set.univ ∧ (∀ (l : Real), l ∈ L → ∀ (u : Real), u ∈ U → Real.instLT.lt l u))))) → ExistsUnique fun c => Or ((L = setOf fun x => Real.instLT.lt x c ∧ U = setOf fun x => Real.instLE.le c x)) ((L = setOf fun x => Real.instLE.le x c ∧ U = setOf fun x => Real.instLT.lt c x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    L U : Set ℝ
    lowerSetNonemptyHypothesis : L.Nonempty
    upperSetNonemptyHypothesis : U.Nonempty
  Prove
    (Exists fun x => x ∈ L ∧ (Exists fun x => x ∈ U ∧ (L ∩ U = Set.instEmptyCollection.1 ∧ (L ∪ U = fun_a => True ∧ (∀ (l : Real), l ∈ L → ∀ (u : Real), u ∈ U → Real.instLT.lt l u))))) → Exists fun x => (((fun c => Or ((L = funx => Real.instLT.lt x c ∧ U = funx => Real.instLE.le c x)) ((L = funx => Real.instLE.le x c ∧ U = funx => Real.instLT.lt c x))) x) ∧ (∀ (y : Real), Or ((L = funx => Real.instLT.lt x y ∧ U = funx => Real.instLE.le y x)) ((L = funx => Real.instLE.le x y ∧ U = funx => Real.instLT.lt y x)) → y = x))

Logical form (Lean):

```lean
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x})
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}) := by
  sorry
end LRA.Analysis.Completeness
