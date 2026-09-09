import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Extrema

variable {S : Type*}

/--
`MaximumUnique` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : Set S} {m₁ m₂ : S}, (LRA.Analysis.Bounds.IsMaximum m₁ A ∧ LRA.Analysis.Bounds.IsMaximum m₂ A) → m₁ = m₂

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    m₁ m₂ : S
  Prove
    ((m₁ ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le x m₁)) ∧ (m₂ ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le x m₂))) → m₁ = m₂

Logical form (Lean):

```lean
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂
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
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂ := by
  sorry
/--
`MinimumUnique` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : Set S} {m₁ m₂ : S}, (LRA.Analysis.Bounds.IsMinimum m₁ A ∧ LRA.Analysis.Bounds.IsMinimum m₂ A) → m₁ = m₂

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    m₁ m₂ : S
  Prove
    ((m₁ ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le m₁ x)) ∧ (m₂ ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le m₂ x))) → m₁ = m₂

Logical form (Lean):

```lean
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂
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
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂ := by
  sorry
/--
`MaximumIsSupremum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : Set S} {m : S}, LRA.Analysis.Bounds.IsMaximum m A → LRA.Analysis.Bounds.IsSupremum m A

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    m : S
  Prove
    (m ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le x m)) → ((∀ (x : S), x ∈ A → inst.toPreorder.1.le x m) ∧ (∀ (u : S), (∀ (x : S), x ∈ A → inst.toPreorder.1.le x u) → inst.toPreorder.1.le m u))

Logical form (Lean):

```lean
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A
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
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry
/--
`MinimumIsInfimum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : Set S} {m : S}, LRA.Analysis.Bounds.IsMinimum m A → LRA.Analysis.Bounds.IsInfimum m A

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    m : S
  Prove
    (m ∈ A ∧ (∀ (x : S), x ∈ A → inst.toPreorder.1.le m x)) → ((∀ (x : S), x ∈ A → inst.toPreorder.1.le m x) ∧ (∀ (l : S), (∀ (x : S), x ∈ A → inst.toPreorder.1.le l x) → inst.toPreorder.1.le l m))

Logical form (Lean):

```lean
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A
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
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A := by
  sorry
/--
`SupremumInSetIsMaximum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] {A : Set S} {s : S}, (LRA.Analysis.Bounds.IsSupremum s A ∧ s ∈ A) → LRA.Analysis.Bounds.IsMaximum s A

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    s : S
  Prove
    (((∀ (x : S), x ∈ A → inst.1.le x s) ∧ (∀ (u : S), (∀ (x : S), x ∈ A → inst.1.le x u) → inst.1.le s u)) ∧ s ∈ A) → (s ∈ A ∧ (∀ (x : S), x ∈ A → inst.1.le x s))

Logical form (Lean):

```lean
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A
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
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A := by
  sorry
/--
`InfimumInSetIsMinimum` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] {A : Set S} {i : S}, (LRA.Analysis.Bounds.IsInfimum i A ∧ i ∈ A) → LRA.Analysis.Bounds.IsMinimum i A

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    i : S
  Prove
    (((∀ (x : S), x ∈ A → inst.1.le i x) ∧ (∀ (l : S), (∀ (x : S), x ∈ A → inst.1.le l x) → inst.1.le l i)) ∧ i ∈ A) → (i ∈ A ∧ (∀ (x : S), x ∈ A → inst.1.le i x))

Logical form (Lean):

```lean
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A
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
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A := by
  sorry
/--
`MaximumIffSupremumAndMembership` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : Set S} {s : S}, LRA.Analysis.Bounds.IsMaximum s A ↔ (LRA.Analysis.Bounds.IsSupremum s A ∧ s ∈ A)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A : Set S
    s : S
  Prove
    LRA.Analysis.Bounds.IsMaximum s A ↔ (LRA.Analysis.Bounds.IsSupremum s A ∧ s ∈ A)

Logical form (Lean):

```lean
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A := by
  sorry
end LRA.Analysis.Bounds.Extrema
