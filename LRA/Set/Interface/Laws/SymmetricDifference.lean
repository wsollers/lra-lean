import LRA.Set.Interface.Operations

namespace LRA.Set

universe u

/--
`SymmDiffLaws` TODO

Predicate logic:

  class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B
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
class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B

variable {α : Type u}
variable [HasSymmDiff α] [Union α] [Inter α] [SDiff α]
variable [EmptyCollection α] [HasSubset α]
variable [SymmDiffLaws α]

/--
`SymmetricDifferenceAsUnionDifferences` TODO

Predicate logic:

  ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B : α), inst.1 A B = inst_1.1 (inst_3.1 A B) (inst_3.1 B A)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
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
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`SymmetricDifferenceAsUnionDifferenceIntersection` TODO

Predicate logic:

  ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B : α), inst.1 A B = inst_3.1 (inst_1.1 A B) (inst_2.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
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
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`SymmetricDifferenceCommutative` TODO

Predicate logic:

  ∀ A B : α, A ∆ B = B ∆ A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B : α), inst.1 A B = inst.1 B A

Logical form (Lean):

```lean
theorem SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
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
theorem SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A := by
  sorry

/--
`SymmetricDifferenceAssociative` TODO

Predicate logic:

  ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B C : α), inst.1 (inst.1 A B) C = inst.1 A (inst.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
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
theorem SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
`SymmetricDifferenceEmpty` TODO

Predicate logic:

  ∀ A : α, A ∆ ∅ ∈ α = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A : α), inst.1 A inst_4.1 = A

Logical form (Lean):

```lean
theorem SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
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
theorem SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A := by
  sorry

/--
`EmptySymmetricDifference` TODO

Predicate logic:

  ∀ A : α, ∅ ∈ α ∆ A = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A : α), inst.1 inst_4.1 A = A

Logical form (Lean):

```lean
theorem EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
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
theorem EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A := by
  sorry

/--
`SymmetricDifferenceSelf` TODO

Predicate logic:

  ∀ A : α, A ∆ A = ∅ ∈ α

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A : α), inst.1 A A = inst_4.1

Logical form (Lean):

```lean
theorem SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
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
theorem SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α) := by
  sorry

/--
`SymmetricDifferenceEqEmptyIff` TODO

Predicate logic:

  ∀ A B : α, A ∆ B = ∅ ∈ α ↔ A = B

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B : α), inst.1 A B = inst_4.1 ↔ A = B

Logical form (Lean):

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
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
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B := by
  sorry

/--
`SymmetricDifferenceSubsetUnion` TODO

Predicate logic:

  ∀ A B : α, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : LRA.Set.HasSymmDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : SDiff α] [inst_4 : EmptyCollection α] [inst_5 : HasSubset α], LRA.Set.SymmDiffLaws α → ∀ (A B : α), inst_5.1 (inst.1 A B) (inst_1.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B
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
theorem SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set
