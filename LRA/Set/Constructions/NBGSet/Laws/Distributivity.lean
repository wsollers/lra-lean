import LRA.Set.Constructions.NBGSet.Instances
import LRA.Set.Interface.Distributivity

namespace LRA.Set.Constructions.NBGSet

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  forall A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.NBGSet.Set), LRA.Set.Constructions.NBGSet.instInter.1 A (LRA.Set.Constructions.NBGSet.instUnion.1 B C) = LRA.Set.Constructions.NBGSet.instUnion.1 (LRA.Set.Constructions.NBGSet.instInter.1 A B) (LRA.Set.Constructions.NBGSet.instInter.1 A C)

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

  ∀ (A B C : LRA.Set.Constructions.NBGSet.Set), LRA.Set.Constructions.NBGSet.instUnion.1 A (LRA.Set.Constructions.NBGSet.instInter.1 B C) = LRA.Set.Constructions.NBGSet.instInter.1 (LRA.Set.Constructions.NBGSet.instUnion.1 A B) (LRA.Set.Constructions.NBGSet.instUnion.1 A C)

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

  ∀ (A B : LRA.Set.Constructions.NBGSet.Set), LRA.Set.Constructions.NBGSet.instUnion.1 A (LRA.Set.Constructions.NBGSet.instInter.1 A B) = A

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

  ∀ (A B : LRA.Set.Constructions.NBGSet.Set), LRA.Set.Constructions.NBGSet.instInter.1 A (LRA.Set.Constructions.NBGSet.instUnion.1 A B) = A

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

instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion := IntersectionDistributesOverUnion
  UnionDistributesOverIntersection := UnionDistributesOverIntersection
  AbsorptionUnionIntersection := AbsorptionUnionIntersection
  AbsorptionIntersectionUnion := AbsorptionIntersectionUnion

end LRA.Set.Constructions.NBGSet
