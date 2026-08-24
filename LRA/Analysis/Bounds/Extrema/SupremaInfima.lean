import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

namespace LRA.Analysis.Bounds.Extrema

variable {S : Type*}

/--
`SupremumIsUpperBound` TODO

Predicate logic:

  (IsSupremum s A) → IsUpperBound s A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {s : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s

Logical form (Lean):

```lean
theorem SupremumIsUpperBound [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) : IsUpperBound s A
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
theorem SupremumIsUpperBound [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) : IsUpperBound s A := by
  sorry

/--
`InfimumIsLowerBound` TODO

Predicate logic:

  (IsInfimum i A) → IsLowerBound i A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {i : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x

Logical form (Lean):

```lean
theorem InfimumIsLowerBound [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) : IsLowerBound i A
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
theorem InfimumIsLowerBound [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) : IsLowerBound i A := by
  sorry

/--
`SubsetPreservesUpperBounds` TODO

Predicate logic:

  (IsUpperBound u B) → IsUpperBound u A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A B : S → Prop} {u : S}, (Set.instLE.1 A B ∧ ∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 x u) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u

Logical form (Lean):

```lean
theorem SubsetPreservesUpperBounds [Preorder S] {A B : Set S} {u : S}
    (subsetHypothesis : A ⊆ B) (upperBoundHypothesis : IsUpperBound u B) :
    IsUpperBound u A
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
theorem SubsetPreservesUpperBounds [Preorder S] {A B : Set S} {u : S}
    (subsetHypothesis : A ⊆ B) (upperBoundHypothesis : IsUpperBound u B) :
    IsUpperBound u A := by
  sorry

/--
`SubsetPreservesLowerBounds` TODO

Predicate logic:

  (IsLowerBound l B) → IsLowerBound l A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A B : S → Prop} {l : S}, (Set.instLE.1 A B ∧ ∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 l x) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x

Logical form (Lean):

```lean
theorem SubsetPreservesLowerBounds [Preorder S] {A B : Set S} {l : S}
    (subsetHypothesis : A ⊆ B) (lowerBoundHypothesis : IsLowerBound l B) :
    IsLowerBound l A
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
theorem SubsetPreservesLowerBounds [Preorder S] {A B : Set S} {l : S}
    (subsetHypothesis : A ⊆ B) (lowerBoundHypothesis : IsLowerBound l B) :
    IsLowerBound l A := by
  sorry

/--
`SupremumMonotoneUnderInclusion` TODO

Predicate logic:

  (IsSupremum sA A ∧ IsSupremum sB B) → sA ≤ sB

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A B : S → Prop} {sA sB : S}, (Set.instLE.1 A B ∧ ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x sA ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 sA u) ∧ (∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 x sB ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 x u) → inst.toLE.1 sB u))) → inst.toLE.1 sA sB

Logical form (Lean):

```lean
theorem SupremumMonotoneUnderInclusion [PartialOrder S] {A B : Set S} {sA sB : S}
    (subsetHypothesis : A ⊆ B)
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B) :
    sA ≤ sB
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
theorem SupremumMonotoneUnderInclusion [PartialOrder S] {A B : Set S} {sA sB : S}
    (subsetHypothesis : A ⊆ B)
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B) :
    sA ≤ sB := by
  sorry

/--
`InfimumAntitoneUnderInclusion` TODO

Predicate logic:

  (IsInfimum iA A ∧ IsInfimum iB B) → iB ≤ iA

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A B : S → Prop} {iA iB : S}, (Set.instLE.1 A B ∧ ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 iA x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l iA) ∧ (∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 iB x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 l x) → inst.toLE.1 l iB))) → inst.toLE.1 iB iA

Logical form (Lean):

```lean
theorem InfimumAntitoneUnderInclusion [PartialOrder S] {A B : Set S} {iA iB : S}
    (subsetHypothesis : A ⊆ B)
    (leftInfimum : IsInfimum iA A)
    (rightInfimum : IsInfimum iB B) :
    iB ≤ iA
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
theorem InfimumAntitoneUnderInclusion [PartialOrder S] {A B : Set S} {iA iB : S}
    (subsetHypothesis : A ⊆ B)
    (leftInfimum : IsInfimum iA A)
    (rightInfimum : IsInfimum iB B) :
    iB ≤ iA := by
  sorry

/--
`UpperBoundIffSupremumLe` TODO

Predicate logic:

  (IsSupremum s A) → IsUpperBound u A ↔ s ≤ u

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {s u : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u ↔ inst.toLE.1 s u

Logical form (Lean):

```lean
theorem UpperBoundIffSupremumLe [PartialOrder S] {A : Set S} {s u : S}
    (supremumHypothesis : IsSupremum s A) :
    IsUpperBound u A ↔ s ≤ u
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem UpperBoundIffSupremumLe [PartialOrder S] {A : Set S} {s u : S}
    (supremumHypothesis : IsSupremum s A) :
    IsUpperBound u A ↔ s ≤ u := by
  sorry

/--
`LowerBoundIffLeInfimum` TODO

Predicate logic:

  (IsInfimum i A) → IsLowerBound l A ↔ l ≤ i

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {i l : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x ↔ inst.toLE.1 l i

Logical form (Lean):

```lean
theorem LowerBoundIffLeInfimum [PartialOrder S] {A : Set S} {i l : S}
    (infimumHypothesis : IsInfimum i A) :
    IsLowerBound l A ↔ l ≤ i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem LowerBoundIffLeInfimum [PartialOrder S] {A : Set S} {i l : S}
    (infimumHypothesis : IsInfimum i A) :
    IsLowerBound l A ↔ l ≤ i := by
  sorry

/--
`EveryElementLeSupremum` TODO

Predicate logic:

  (IsSupremum s A) → ∀ x ∈ A, x ≤ s

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {s : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s

Logical form (Lean):

```lean
theorem EveryElementLeSupremum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) :
    ∀ x ∈ A, x ≤ s
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
theorem EveryElementLeSupremum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) :
    ∀ x ∈ A, x ≤ s := by
  sorry

/--
`InfimumLeEveryElement` TODO

Predicate logic:

  (IsInfimum i A) → ∀ x ∈ A, i ≤ x

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {i : S}, (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i) → ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x

Logical form (Lean):

```lean
theorem InfimumLeEveryElement [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) :
    ∀ x ∈ A, i ≤ x
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
theorem InfimumLeEveryElement [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) :
    ∀ x ∈ A, i ≤ x := by
  sorry

/--
`InfimumLeSupremum` TODO

Predicate logic:

  (IsInfimum i A ∧ IsSupremum s A) → i ≤ s

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {i s : S}, ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i) ∧ (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u)) → inst.toLE.1 i s

Logical form (Lean):

```lean
theorem InfimumLeSupremum [PartialOrder S] {A : Set S} {i s : S}
    (infimumHypothesis : IsInfimum i A)
    (supremumHypothesis : IsSupremum s A) : i ≤ s
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
theorem InfimumLeSupremum [PartialOrder S] {A : Set S} {i s : S}
    (infimumHypothesis : IsInfimum i A)
    (supremumHypothesis : IsSupremum s A) : i ≤ s := by
  sorry

/--
`SupremumNeedNotBelongToSet` TODO

Predicate logic:

  ∃ A ∈ Set ℝ s ∈ ℝ, A.Nonempty ∧ IsSupremum s A ∧ s ∉ A

Predicate logic (unfolded):

  Exists fun A => Exists fun s => (Exists fun x => Set.instMembership.1 A x ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Set.instMembership.1 A s → False))

Logical form (Lean):

```lean
theorem SupremumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A
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
theorem SupremumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A := by
  sorry

/--
`InfimumNeedNotBelongToSet` TODO

Predicate logic:

  ∃ A ∈ Set ℝ i ∈ ℝ, A.Nonempty ∧ IsInfimum i A ∧ i ∉ A

Predicate logic (unfolded):

  Exists fun A => Exists fun i => (Exists fun x => Set.instMembership.1 A x ∧ ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Set.instMembership.1 A i → False))

Logical form (Lean):

```lean
theorem InfimumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A
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
theorem InfimumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A := by
  sorry

/--
`SupremumComparisonByDominatingSet` TODO

Predicate logic:

  (IsSupremum sA A ∧ IsSupremum sB B ∧ ∀ a ∈ A, ∃ b ∈ B, a ≤ b) → sA ≤ sB

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A B : S → Prop} {sA sB : S}, ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x sA ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 sA u) ∧ ((∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 x sB ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 B x → inst.toLE.1 x u) → inst.toLE.1 sB u) ∧ ∀ (a : S), Set.instMembership.1 A a → Exists fun b => (Set.instMembership.1 B b ∧ inst.toLE.1 a b))) → inst.toLE.1 sA sB

Logical form (Lean):

```lean
theorem SupremumComparisonByDominatingSet [PartialOrder S] {A B : Set S} {sA sB : S}
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B)
    (dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB
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
theorem SupremumComparisonByDominatingSet [PartialOrder S] {A B : Set S} {sA sB : S}
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B)
    (dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB := by
  sorry

/--
`LubPropertyGivesSupremum` TODO

Predicate logic:

  (∀ nonemptyHypothesis ∈ A.Nonempty), (∃ u, IsUpperBound u A) → ∃! s : ℝ, IsSupremum s A

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u) → Exists fun x => ((fun s => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u)) x ∧ ∀ (y : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x y ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 y u) → y = x)

Logical form (Lean):

```lean
theorem LubPropertyGivesSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃! s : ℝ, IsSupremum s A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem LubPropertyGivesSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃! s : ℝ, IsSupremum s A := by
  sorry

/--
`GlbPropertyGivesInfimum` TODO

Predicate logic:

  (∀ nonemptyHypothesis ∈ A.Nonempty), (∃ l, IsLowerBound l A) → ∃! i : ℝ, IsInfimum i A

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun l => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x) → Exists fun x => ((fun i => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i)) x ∧ ∀ (y : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 y x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l y) → y = x)

Logical form (Lean):

```lean
theorem GlbPropertyGivesInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l A) :
    ∃! i : ℝ, IsInfimum i A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem GlbPropertyGivesInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l A) :
    ∃! i : ℝ, IsInfimum i A := by
  sorry

/--
`BoundedSetHasSupremumAndInfimum` TODO

Predicate logic:

  (∀ nonemptyHypothesis ∈ A.Nonempty), (IsBounded A) → ∃! s ∈ ℝ, IsSupremum s A ∧ ∃! i ∈ ℝ, IsInfimum i A

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u ∧ Exists fun l => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x)) → (Exists fun x => ((fun s => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u)) x ∧ ∀ (y : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x y ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 y u) → y = x) ∧ Exists fun x => ((fun i => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i)) x ∧ ∀ (y : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 y x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l y) → y = x))

Logical form (Lean):

```lean
theorem BoundedSetHasSupremumAndInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A)
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
theorem BoundedSetHasSupremumAndInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A) := by
  sorry

end LRA.Analysis.Bounds.Extrema
