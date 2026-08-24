import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Extrema

variable {S : Type*}

/--
`MaximumUnique` TODO

Predicate logic:

  (IsMaximum m₁ A ∧ IsMaximum m₂ A) → m₁ = m₂

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {m₁ m₂ : S}, ((Set.instMembership.1 A m₁ ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x m₁) ∧ (Set.instMembership.1 A m₂ ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x m₂)) → m₁ = m₂

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

  (IsMinimum m₁ A ∧ IsMinimum m₂ A) → m₁ = m₂

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {m₁ m₂ : S}, ((Set.instMembership.1 A m₁ ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 m₁ x) ∧ (Set.instMembership.1 A m₂ ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 m₂ x)) → m₁ = m₂

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

  (IsMaximum m A) → IsSupremum m A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {m : S}, (Set.instMembership.1 A m ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x m) → (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x m ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 m u)

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

  (IsMinimum m A) → IsInfimum m A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {m : S}, (Set.instMembership.1 A m ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 m x) → (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 m x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l m)

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

  (IsSupremum s A ∧ s ∈ A) → IsMaximum s A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {s : S}, ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) ∧ Set.instMembership.1 A s) → (Set.instMembership.1 A s ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s)

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

  (IsInfimum i A ∧ i ∈ A) → IsMinimum i A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {A : S → Prop} {i : S}, ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i) ∧ Set.instMembership.1 A i) → (Set.instMembership.1 A i ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 i x)

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

  IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : PartialOrder S] {A : S → Prop} {s : S}, (Set.instMembership.1 A s ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s) ↔ ((∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) ∧ Set.instMembership.1 A s)

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
