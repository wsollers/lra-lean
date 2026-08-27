namespace LRA.Set

universe u

/--
`DifferenceLaws` TODO

Predicate logic:

  class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)

Predicate logic (unfolded):

  class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)
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
class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)

variable {α : Type u}
variable [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α]
variable [DifferenceLaws α]

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A₁ A₂ B : α), inst_4.1 A₁ A₂ → inst_4.1 (inst.1 A₁ B) (inst.1 A₂ B)

Logical form (Lean):

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
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
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B :=
  DifferenceLaws.DifferenceMonotoneLeft

/--
`DifferenceAntitoneRight` TODO

Predicate logic:

  ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B₁ B₂ : α), inst_4.1 B₁ B₂ → inst_4.1 (inst.1 A B₂) (inst.1 A B₁)

Logical form (Lean):

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
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
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ :=
  DifferenceLaws.DifferenceAntitoneRight

/--
`DifferenceEmpty` TODO

Predicate logic:

  ∀ A : α, A \ ∅ ∈ α = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A : α), inst.1 A inst_3.1 = A

Logical form (Lean):

```lean
theorem DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
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
theorem DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A :=
  DifferenceLaws.DifferenceEmpty

/--
`EmptyDifference` TODO

Predicate logic:

  ∀ A : α, ∅ ∈ α \ A = ∅ ∈ α

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A : α), inst.1 inst_3.1 A = inst_3.1

Logical form (Lean):

```lean
theorem EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
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
theorem EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α) :=
  DifferenceLaws.EmptyDifference

/--
`DifferenceSelf` TODO

Predicate logic:

  ∀ A : α, A \ A = ∅ ∈ α

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A : α), inst.1 A A = inst_3.1

Logical form (Lean):

```lean
theorem DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
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
theorem DifferenceSelf : ∀ A : α, A \ A = (∅ : α) :=
  DifferenceLaws.DifferenceSelf

/--
`DifferenceUnion` TODO

Predicate logic:

  ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B C : α), inst.1 A (inst_1.1 B C) = inst_2.1 (inst.1 A B) (inst.1 A C)

Logical form (Lean):

```lean
theorem DifferenceUnion :
    ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
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
theorem DifferenceUnion :
    ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C) :=
  DifferenceLaws.DifferenceUnion

/--
`DifferenceIntersection` TODO

Predicate logic:

  ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B C : α), inst.1 A (inst_2.1 B C) = inst_1.1 (inst.1 A B) (inst.1 A C)

Logical form (Lean):

```lean
theorem DifferenceIntersection :
    ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
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
theorem DifferenceIntersection :
    ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C) :=
  DifferenceLaws.DifferenceIntersection

/--
`UnionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B C : α), inst.1 (inst_1.1 A B) C = inst_1.1 (inst.1 A C) (inst.1 B C)

Logical form (Lean):

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
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
theorem UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C) :=
  DifferenceLaws.UnionDifferenceDistributes

/--
`IntersectionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B C : α), inst.1 (inst_2.1 A B) C = inst_2.1 (inst.1 A C) (inst.1 B C)

Logical form (Lean):

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
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
theorem IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C) :=
  DifferenceLaws.IntersectionDifferenceDistributes

/--
`DifferenceSubsetLeft` TODO

Predicate logic:

  ∀ A B : α, A \ B ⊆ A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B : α), inst_4.1 (inst.1 A B) A

Logical form (Lean):

```lean
theorem DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
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
theorem DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A :=
  DifferenceLaws.DifferenceSubsetLeft

/--
`DifferenceDisjointRight` TODO

Predicate logic:

  ∀ A B : α, (A \ B) ∩ B = ∅ ∈ α

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : SDiff α] [inst_1 : Union α] [inst_2 : Inter α] [inst_3 : EmptyCollection α] [inst_4 : HasSubset α], LRA.Set.DifferenceLaws α → ∀ (A B : α), inst_2.1 (inst.1 A B) B = inst_3.1

Logical form (Lean):

```lean
theorem DifferenceDisjointRight :
    ∀ A B : α, (A \ B) ∩ B = (∅ : α)
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
theorem DifferenceDisjointRight :
    ∀ A B : α, (A \ B) ∩ B = (∅ : α) :=
  DifferenceLaws.DifferenceDisjointRight

end LRA.Set
