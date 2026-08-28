namespace LRA.Set

universe u

/--
`SubsetLaws` TODO

Predicate logic:

  class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A

variable {α : Type u} [HasSubset α] [SubsetLaws α]

/--
`SubsetReflexive` TODO

Predicate logic:

  ∀ A : α, A ⊆ A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : HasSubset α], LRA.Set.SubsetLaws α → ∀ (A : α), inst.1 A A

Logical form (Lean):

```lean
theorem SubsetReflexive : ∀ A : α, A ⊆ A
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
theorem SubsetReflexive : ∀ A : α, A ⊆ A := by
  sorry




/--
`SubsetTransitive` TODO

Predicate logic:

  ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : HasSubset α], LRA.Set.SubsetLaws α → ∀ (A B C : α), (inst.1 A B ∧ inst.1 B C) → inst.1 A C

Logical form (Lean):

```lean
theorem SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
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
theorem SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C :=
  sorry

/--
`SetEqualityIffMutualSubset` TODO

Predicate logic:

  ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : HasSubset α], LRA.Set.SubsetLaws α → ∀ (A B : α), A = B ↔ (inst.1 A B ∧ inst.1 B A)

Logical form (Lean):

```lean
theorem SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A :=
  sorry

end LRA.Set
