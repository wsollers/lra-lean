import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Distributivity

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A (LRA.Set.PredicateSet.instUnion.1 B C) = LRA.Set.PredicateSet.instUnion.1 (LRA.Set.PredicateSet.instInter.1 A B) (LRA.Set.PredicateSet.instInter.1 A C)

Logical form (Lean):

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
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
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

/--
`UnionDistributesOverIntersection` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A (LRA.Set.PredicateSet.instInter.1 B C) = LRA.Set.PredicateSet.instInter.1 (LRA.Set.PredicateSet.instUnion.1 A B) (LRA.Set.PredicateSet.instUnion.1 A C)

Logical form (Lean):

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
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
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

/--
`AbsorptionUnionIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ (A ∩ B) = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A (LRA.Set.PredicateSet.instInter.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionUnionIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ (A ∩ B) = A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ (A ∩ B) = A := by
  sorry

/--
`AbsorptionIntersectionUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ (A ∪ B) = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A (LRA.Set.PredicateSet.instUnion.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionIntersectionUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ (A ∪ B) = A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ (A ∪ B) = A := by
  sorry

instance : DistributivityLaws (LRA.Set.PredicateSet Alpha) where
  IntersectionDistributesOverUnion :=
    LRA.Set.PredicateSet.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.Set.PredicateSet.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.Set.PredicateSet.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.Set.PredicateSet.AbsorptionIntersectionUnion

end LRA.Set.PredicateSet
