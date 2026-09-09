import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Bounds.Extrema

/--
`SupremumEpsilonCharacterization` TODO

Predicate logic:

  ∀ {A : Set Real} {s : Real}, LRA.Analysis.Bounds.IsSupremum s A ↔ (LRA.Analysis.Bounds.IsUpperBound s A ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun a => (a ∈ A ∧ Real.instLT.lt (instHSub.hSub s ε) a)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    s : ℝ
  Prove
    LRA.Analysis.Bounds.IsSupremum s A ↔ (LRA.Analysis.Bounds.IsUpperBound s A ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun a => (a ∈ A ∧ Real.instLT.lt (instHSub.hSub s ε) a)))

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

  ∀ {A : Set Real} {i : Real}, LRA.Analysis.Bounds.IsInfimum i A ↔ (LRA.Analysis.Bounds.IsLowerBound i A ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun a => (a ∈ A ∧ Real.instLT.lt a (instHAdd.hAdd i ε))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    i : ℝ
  Prove
    LRA.Analysis.Bounds.IsInfimum i A ↔ (LRA.Analysis.Bounds.IsLowerBound i A ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun a => (a ∈ A ∧ Real.instLT.lt a (instHAdd.hAdd i ε))))

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

  ∀ {A : Set Real} {s u : Real}, (LRA.Analysis.Bounds.IsSupremum s A ∧ Real.instLT.lt u s) → Exists fun a => (a ∈ A ∧ Real.instLT.lt u a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    s u : ℝ
  Prove
    (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u)) ∧ Real.instLT.lt u s) → Exists fun a => (a ∈ A ∧ Real.instLT.lt u a)

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

  ∀ {A : Set Real} {i l : Real}, (LRA.Analysis.Bounds.IsInfimum i A ∧ Real.instLT.lt i l) → Exists fun a => (a ∈ A ∧ Real.instLT.lt a l)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    i l : ℝ
  Prove
    (((∀ (x : Real), x ∈ A → Real.instPreorder.1.le i x) ∧ (∀ (l : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le l x) → Real.instPreorder.1.le l i)) ∧ Real.instLT.lt i l) → Exists fun a => (a ∈ A ∧ Real.instLT.lt a l)

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
