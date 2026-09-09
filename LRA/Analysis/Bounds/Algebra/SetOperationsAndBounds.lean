import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable {S : Type*}

/--
`UnionPreservesUpperBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {u : S}, (LRA.Analysis.Bounds.IsUpperBound u A ∧ LRA.Analysis.Bounds.IsUpperBound u B) → LRA.Analysis.Bounds.IsUpperBound u (A ∪ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    u : S
  Prove
    ((∀ (x : S), x ∈ A → inst.le x u) ∧ (∀ (x : S), x ∈ B → inst.le x u)) → ∀ (x : S), x ∈ A ∪ B → inst.le x u

Logical form (Lean):

```lean
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B)
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
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B) := by
  sorry
/--
`UnionPreservesLowerBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {l : S}, (LRA.Analysis.Bounds.IsLowerBound l A ∧ LRA.Analysis.Bounds.IsLowerBound l B) → LRA.Analysis.Bounds.IsLowerBound l (A ∪ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    l : S
  Prove
    ((∀ (x : S), x ∈ A → inst.le l x) ∧ (∀ (x : S), x ∈ B → inst.le l x)) → ∀ (x : S), x ∈ A ∪ B → inst.le l x

Logical form (Lean):

```lean
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B)
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
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B) := by
  sorry
/--
`UnionBoundedAboveIffPiecesBoundedAbove` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S}, LRA.Analysis.Bounds.IsBoundedAbove (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBoundedAbove A ∧ LRA.Analysis.Bounds.IsBoundedAbove B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
  Prove
    LRA.Analysis.Bounds.IsBoundedAbove (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBoundedAbove A ∧ LRA.Analysis.Bounds.IsBoundedAbove B)

Logical form (Lean):

```lean
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B
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
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B := by
  sorry
/--
`UnionBoundedBelowIffPiecesBoundedBelow` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S}, LRA.Analysis.Bounds.IsBoundedBelow (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBoundedBelow A ∧ LRA.Analysis.Bounds.IsBoundedBelow B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
  Prove
    LRA.Analysis.Bounds.IsBoundedBelow (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBoundedBelow A ∧ LRA.Analysis.Bounds.IsBoundedBelow B)

Logical form (Lean):

```lean
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B
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
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B := by
  sorry
/--
`UnionBoundedIffPiecesBounded` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S}, LRA.Analysis.Bounds.IsBounded (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBounded A ∧ LRA.Analysis.Bounds.IsBounded B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
  Prove
    LRA.Analysis.Bounds.IsBounded (A ∪ B) ↔ (LRA.Analysis.Bounds.IsBounded A ∧ LRA.Analysis.Bounds.IsBounded B)

Logical form (Lean):

```lean
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B
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
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B := by
  sorry
/--
`SubsetsPreserveUpperBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] {C A : Set S} {u : S}, (Set.instLE.le C A ∧ LRA.Analysis.Bounds.IsUpperBound u A) → LRA.Analysis.Bounds.IsUpperBound u C

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    C A : Set S
    u : S
    subsetHypothesis : C ⊆ A
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : S⦄, a ∈ s₁ → a ∈ s₂}.le C A) ∧ (∀ (x : S), x ∈ A → inst.1.le x u)) → ∀ (x : S), x ∈ C → inst.1.le x u

Logical form (Lean):

```lean
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C
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
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C := by
  sorry
/--
`SubsetsPreserveLowerBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] {C A : Set S} {l : S}, (Set.instLE.le C A ∧ LRA.Analysis.Bounds.IsLowerBound l A) → LRA.Analysis.Bounds.IsLowerBound l C

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    C A : Set S
    l : S
    subsetHypothesis : C ⊆ A
  Prove
    (({ le := fun s₁ s₂ => ∀ ⦃a : S⦄, a ∈ s₁ → a ∈ s₂}.le C A) ∧ (∀ (x : S), x ∈ A → inst.1.le l x)) → ∀ (x : S), x ∈ C → inst.1.le l x

Logical form (Lean):

```lean
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C
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
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C := by
  sorry
/--
`IntersectionsInheritUpperBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {u : S}, LRA.Analysis.Bounds.IsUpperBound u A → LRA.Analysis.Bounds.IsUpperBound u (A ∩ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    u : S
  Prove
    (∀ (x : S), x ∈ A → inst.le x u) → ∀ (x : S), x ∈ A ∩ B → inst.le x u

Logical form (Lean):

```lean
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B)
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
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B) := by
  sorry
/--
`IntersectionsInheritLowerBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {l : S}, LRA.Analysis.Bounds.IsLowerBound l A → LRA.Analysis.Bounds.IsLowerBound l (A ∩ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    l : S
  Prove
    (∀ (x : S), x ∈ A → inst.le l x) → ∀ (x : S), x ∈ A ∩ B → inst.le l x

Logical form (Lean):

```lean
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B)
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
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B) := by
  sorry
/--
`DifferencesInheritUpperBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {u : S}, LRA.Analysis.Bounds.IsUpperBound u A → LRA.Analysis.Bounds.IsUpperBound u (A \ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    u : S
  Prove
    (∀ (x : S), x ∈ A → inst.le x u) → ∀ (x : S), x ∈ A \ B → inst.le x u

Logical form (Lean):

```lean
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B)
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
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B) := by
  sorry
/--
`DifferencesInheritLowerBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A B : Set S} {l : S}, LRA.Analysis.Bounds.IsLowerBound l A → LRA.Analysis.Bounds.IsLowerBound l (A \ B)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A B : Set S
    l : S
  Prove
    (∀ (x : S), x ∈ A → inst.le l x) → ∀ (x : S), x ∈ A \ B → inst.le l x

Logical form (Lean):

```lean
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B)
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
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B) := by
  sorry
/--
`ComplementsInheritUpperBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A T : Set S} {u : S}, LRA.Analysis.Bounds.IsUpperBound u T → LRA.Analysis.Bounds.IsUpperBound u (T \ A)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A T : Set S
    u : S
  Prove
    (∀ (x : S), x ∈ T → inst.le x u) → ∀ (x : S), x ∈ T \ A → inst.le x u

Logical form (Lean):

```lean
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A)
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
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A) := by
  sorry
/--
`ComplementsInheritLowerBounds` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : LE S] {A T : Set S} {l : S}, LRA.Analysis.Bounds.IsLowerBound l T → LRA.Analysis.Bounds.IsLowerBound l (T \ A)

Predicate logic (unfolded):

  Ambient
    (S, ≤)
  Objects
    A T : Set S
    l : S
  Prove
    (∀ (x : S), x ∈ T → inst.le l x) → ∀ (x : S), x ∈ T \ A → inst.le l x

Logical form (Lean):

```lean
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A)
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
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A) := by
  sorry
end LRA.Analysis.Bounds.Algebra
