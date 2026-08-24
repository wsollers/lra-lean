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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (∀ a ∈ A, ∀ b ∈ B, a ≤ b) → (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧ ∃ c ∈ ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b)

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun x => Set.instMembership.1 B x ∧ ∀ (a : Real), Set.instMembership.1 A a → ∀ (b : Real), Set.instMembership.1 B b → Real.instLE.1 a b)) → (Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u ∧ (Exists fun l => ∀ (x : Real), Set.instMembership.1 B x → Real.instLE.1 l x ∧ Exists fun c => ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x c ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 c u) ∧ ∀ (a : Real), Set.instMembership.1 A a → ∀ (b : Real), Set.instMembership.1 B b → (Real.instLE.1 a c ∧ Real.instLE.1 c b))))

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

  (∀ leftNonemptyHypothesis ∈ A.Nonempty ∀ rightNonemptyHypothesis ∈ B.Nonempty), (∀ a ∈ A, ∀ b ∈ B, a ≤ b ∧ IsSupremum s A ∧ IsInfimum i B) → s ≤ i

Predicate logic (unfolded):

  ∀ {A B : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun x => Set.instMembership.1 B x ∧ ∀ (a : Real), Set.instMembership.1 A a → ∀ (b : Real), Set.instMembership.1 B b → Real.instLE.1 a b)) → ∀ {s i : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 B x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i)) → Real.instLE.1 s i

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

  (∀ lowerSetNonemptyHypothesis ∈ L.Nonempty ∀ upperSetNonemptyHypothesis ∈ U.Nonempty), (L ∩ U = ∅ ∧ L ∪ U = Set.univ ∧ ∀ l ∈ L, ∀ u ∈ U, l < u) → (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U)

Predicate logic (unfolded):

  ∀ {L U : Real → Prop}, (Exists fun x => Set.instMembership.1 L x ∧ (Exists fun x => Set.instMembership.1 U x ∧ (Set.instInter.1 L U = Set.instEmptyCollection.1 ∧ (Set.instUnion.1 L U = fun_a => True ∧ ∀ (l : Real), Set.instMembership.1 L l → ∀ (u : Real), Set.instMembership.1 U u → Real.instLT.1 l u)))) → Or (Exists fun m => (Set.instMembership.1 L m ∧ ∀ (x : Real), Set.instMembership.1 L x → Real.instLE.1 x m)) (Exists fun n => (Set.instMembership.1 U n ∧ ∀ (x : Real), Set.instMembership.1 U x → Real.instLE.1 n x))

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

  (∀ lowerSetNonemptyHypothesis ∈ L.Nonempty ∀ upperSetNonemptyHypothesis ∈ U.Nonempty), (L ∩ U = ∅ ∧ L ∪ U = Set.univ ∧ ∀ l ∈ L, ∀ u ∈ U, l < u) → ∃! c : ℝ, L = {x ∈ ℝ | x < c} ∧ U = {x : ℝ | c ≤ x} ∨ L = {x ∈ ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}

Predicate logic (unfolded):

  ∀ {L U : Real → Prop}, (Exists fun x => Set.instMembership.1 L x ∧ (Exists fun x => Set.instMembership.1 U x ∧ (Set.instInter.1 L U = Set.instEmptyCollection.1 ∧ (Set.instUnion.1 L U = fun_a => True ∧ ∀ (l : Real), Set.instMembership.1 L l → ∀ (u : Real), Set.instMembership.1 U u → Real.instLT.1 l u)))) → Exists fun x => ((fun c => Or ((L = funx => Real.instLT.1 x c ∧ U = funx => Real.instLE.1 c x)) ((L = funx => Real.instLE.1 x c ∧ U = funx => Real.instLT.1 c x))) x ∧ ∀ (y : Real), Or ((L = funx => Real.instLT.1 x y ∧ U = funx => Real.instLE.1 y x)) ((L = funx => Real.instLE.1 x y ∧ U = funx => Real.instLT.1 y x)) → y = x)

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
