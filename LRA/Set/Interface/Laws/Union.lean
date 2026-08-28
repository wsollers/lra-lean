namespace LRA.Set

universe u

/--
`UnionLaws` TODO

Predicate logic:

  class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B

Predicate logic (unfolded):

  class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B

variable {α : Type u} [Union α] [EmptyCollection α] [HasSubset α]
variable [UnionLaws α]

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ A B : α, A ∪ B = B ∪ A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A B : α), inst.1 A B = inst.1 B A

Logical form (Lean):

```lean
theorem UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
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
theorem UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A := by
  exact UnionLaws.UnionCommutative

/--
`UnionAssociative` TODO

Predicate logic:

  ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A B C : α), inst.1 (inst.1 A B) C = inst.1 A (inst.1 B C)

Logical form (Lean):

```lean
theorem UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
theorem UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  exact UnionLaws.UnionAssociative

/--
`EmptyUnion` TODO

Predicate logic:

  ∀ A : α, ∅ ∈ α ∪ A = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A : α), inst.1 inst_1.1 A = A

Logical form (Lean):

```lean
theorem EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
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
theorem EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A := by
  exact UnionLaws.EmptyUnion

/--
`UnionEmpty` TODO

Predicate logic:

  ∀ A : α, A ∪ ∅ ∈ α = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A : α), inst.1 A inst_1.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
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
theorem UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A := by
  exact UnionLaws.UnionEmpty

/--
`UnionIdempotent` TODO

Predicate logic:

  ∀ A : α, A ∪ A = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A : α), inst.1 A A = A

Logical form (Lean):

```lean
theorem UnionIdempotent : ∀ A : α, A ∪ A = A
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
theorem UnionIdempotent : ∀ A : α, A ∪ A = A := by
  exact UnionLaws.UnionIdempotent

/--
`UnionMonotone` TODO

Predicate logic:

  ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A₁ A₂ B₁ B₂ : α), (inst_2.1 A₁ A₂ ∧ inst_2.1 B₁ B₂) → inst_2.1 (inst.1 A₁ B₁) (inst.1 A₂ B₂)

Logical form (Lean):

```lean
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
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
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  intro A B C D
  intro aSubsetB
  intro cSubsetD
  have monotoneChain := UnionLaws.UnionMonotone A B C D
  exact monotoneChain aSubsetB cSubsetD

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  ∀ A B : α, A ⊆ B ↔ A ∪ B = B

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : EmptyCollection α] [inst_2 : HasSubset α], LRA.Set.UnionLaws α → ∀ (A B : α), inst_2.1 A B ↔ inst.1 A B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B := by

  intro A B
  exact UnionLaws.SubsetIffUnionEqRight A B

end LRA.Set
