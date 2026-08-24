import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Extrema

/--
`SupremumEpsilonCharacterization` TODO

Predicate logic:

  IsSupremum s A ↔ IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {s : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ↔ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x s ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun a => (Set.instMembership.1 A a ∧ Real.instLT.1 (instHSub.1 s ε) a))

Logical form (Lean):

```lean
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a := by
  sorry

/--
`InfimumEpsilonCharacterization` TODO

Predicate logic:

  IsInfimum i A ↔ IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {i : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ↔ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 i x ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun a => (Set.instMembership.1 A a ∧ Real.instLT.1 a (instHAdd.1 i ε)))

Logical form (Lean):

```lean
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε := by
  sorry

/--
`SupremumStrictUpperApproximation` TODO

Predicate logic:

  (IsSupremum s A ∧ u < s) → ∃ a ∈ A, u < a

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {s u : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u) ∧ Real.instLT.1 u s) → Exists fun a => (Set.instMembership.1 A a ∧ Real.instLT.1 u a)

Logical form (Lean):

```lean
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a
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
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a := by
  sorry

/--
`InfimumStrictLowerApproximation` TODO

Predicate logic:

  (IsInfimum i A ∧ i < l) → ∃ a ∈ A, a < l

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {i l : Real}, ((∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 i x ∧ ∀ (l : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 l x) → Real.instPreorder.toLE.1 l i) ∧ Real.instLT.1 i l) → Exists fun a => (Set.instMembership.1 A a ∧ Real.instLT.1 a l)

Logical form (Lean):

```lean
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l
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
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l := by
  sorry

end LRA.Analysis.Bounds.Extrema
