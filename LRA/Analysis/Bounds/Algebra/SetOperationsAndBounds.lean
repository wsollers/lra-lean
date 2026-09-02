import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable {S : Type*}

/--
`UnionPreservesUpperBounds` TODO

Predicate logic:

  (IsUpperBound u A ∧ IsUpperBound u B) → IsUpperBound u (A ∪ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {u : S}, ((∀ (x : S), Set.instMembership.1 A x → inst.1 x u) ∧ (∀ (x : S), Set.instMembership.1 B x → inst.1 x u)) → ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 x u

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

  (IsLowerBound l A ∧ IsLowerBound l B) → IsLowerBound l (A ∪ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {l : S}, (∀ (x : S), Set.instMembership.1 A x → inst.1 l x ∧ ∀ (x : S), Set.instMembership.1 B x → inst.1 l x) → ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 l x

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

  IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop}, Exists fun u => ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 x u ↔ (Exists fun u => ∀ (x : S), Set.instMembership.1 A x → inst.1 x u ∧ Exists fun u => ∀ (x : S), Set.instMembership.1 B x → inst.1 x u)

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

  IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop}, Exists fun l => ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 l x ↔ (Exists fun l => ∀ (x : S), Set.instMembership.1 A x → inst.1 l x ∧ Exists fun l => ∀ (x : S), Set.instMembership.1 B x → inst.1 l x)

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

  IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop}, (Exists fun u => ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 x u ∧ Exists fun l => ∀ (x : S), Set.instMembership.1 (Set.instUnion.1 A B) x → inst.1 l x) ↔ ((Exists fun u => ∀ (x : S), Set.instMembership.1 A x → inst.1 x u ∧ Exists fun l => ∀ (x : S), Set.instMembership.1 A x → inst.1 l x) ∧ (Exists fun u => ∀ (x : S), Set.instMembership.1 B x → inst.1 x u ∧ Exists fun l => ∀ (x : S), Set.instMembership.1 B x → inst.1 l x))

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

  (IsUpperBound u A) → IsUpperBound u C

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {C A : S → Prop} {u : S}, (Set.instLE.1 C A ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → ∀ (x : S), Set.instMembership.1 C x → inst.toLE.1 x u

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

  (IsLowerBound l A) → IsLowerBound l C

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] {C A : S → Prop} {l : S}, (Set.instLE.1 C A ∧ ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 l x) → ∀ (x : S), Set.instMembership.1 C x → inst.toLE.1 l x

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

  (IsUpperBound u A) → IsUpperBound u (A ∩ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {u : S}, (∀ (x : S), Set.instMembership.1 A x → inst.1 x u) → ∀ (x : S), Set.instMembership.1 (Set.instInter.1 A B) x → inst.1 x u

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

  (IsLowerBound l A) → IsLowerBound l (A ∩ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {l : S}, (∀ (x : S), Set.instMembership.1 A x → inst.1 l x) → ∀ (x : S), Set.instMembership.1 (Set.instInter.1 A B) x → inst.1 l x

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

  (IsUpperBound u A) → IsUpperBound u (A \ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {u : S}, (∀ (x : S), Set.instMembership.1 A x → inst.1 x u) → ∀ (x : S), Set.instMembership.1 (Set.instSDiff.1 A B) x → inst.1 x u

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

  (IsLowerBound l A) → IsLowerBound l (A \ B)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A B : S → Prop} {l : S}, (∀ (x : S), Set.instMembership.1 A x → inst.1 l x) → ∀ (x : S), Set.instMembership.1 (Set.instSDiff.1 A B) x → inst.1 l x

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

  (IsUpperBound u T) → IsUpperBound u (T \ A)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A T : S → Prop} {u : S}, (∀ (x : S), Set.instMembership.1 T x → inst.1 x u) → ∀ (x : S), Set.instMembership.1 (Set.instSDiff.1 T A) x → inst.1 x u

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

  (IsLowerBound l T) → IsLowerBound l (T \ A)

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : LE S] {A T : S → Prop} {l : S}, (∀ (x : S), Set.instMembership.1 T x → inst.1 l x) → ∀ (x : S), Set.instMembership.1 (Set.instSDiff.1 T A) x → inst.1 l x

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
