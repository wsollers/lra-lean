import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Distributivity

namespace LRA.Set.Constructions.TGSet

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  forall A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instInter.1 A (LRA.Set.Constructions.TGSet.instUnion.1 B C) = LRA.Set.Constructions.TGSet.instUnion.1 (LRA.Set.Constructions.TGSet.instInter.1 A B) (LRA.Set.Constructions.TGSet.instInter.1 A C)

Logical form (Lean):

```lean
theorem IntersectionDistributesOverUnion :
    forall A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
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
theorem IntersectionDistributesOverUnion :
    forall A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

/--
`UnionDistributesOverIntersection` TODO

Predicate logic:

  forall A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instUnion.1 A (LRA.Set.Constructions.TGSet.instInter.1 B C) = LRA.Set.Constructions.TGSet.instInter.1 (LRA.Set.Constructions.TGSet.instUnion.1 A B) (LRA.Set.Constructions.TGSet.instUnion.1 A C)

Logical form (Lean):

```lean
theorem UnionDistributesOverIntersection :
    forall A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
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
theorem UnionDistributesOverIntersection :
    forall A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

/--
`AbsorptionUnionIntersection` TODO

Predicate logic:

  forall A B : Set, A ∪ (A ∩ B) = A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instUnion.1 A (LRA.Set.Constructions.TGSet.instInter.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionUnionIntersection :
    forall A B : Set, A ∪ (A ∩ B) = A
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
theorem AbsorptionUnionIntersection :
    forall A B : Set, A ∪ (A ∩ B) = A := by
  sorry

/--
`AbsorptionIntersectionUnion` TODO

Predicate logic:

  forall A B : Set, A ∩ (A ∪ B) = A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instInter.1 A (LRA.Set.Constructions.TGSet.instUnion.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionIntersectionUnion :
    forall A B : Set, A ∩ (A ∪ B) = A
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
theorem AbsorptionIntersectionUnion :
    forall A B : Set, A ∩ (A ∪ B) = A := by
  sorry

end LRA.Set.Constructions.TGSet
