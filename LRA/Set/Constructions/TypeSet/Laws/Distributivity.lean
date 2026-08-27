import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Distributivity

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A (LRA.Set.Constructions.TypeSet.instUnion.1 B C) = LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instInter.1 A B) (LRA.Set.Constructions.TypeSet.instInter.1 A C)

Logical form (Lean):

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

/--
`UnionDistributesOverIntersection` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A (LRA.Set.Constructions.TypeSet.instInter.1 B C) = LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A B) (LRA.Set.Constructions.TypeSet.instUnion.1 A C)

Logical form (Lean):

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

/--
`AbsorptionUnionIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ (A ∩ B) = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A (LRA.Set.Constructions.TypeSet.instInter.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionUnionIntersection :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ (A ∩ B) = A
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ (A ∩ B) = A := by
  sorry

/--
`AbsorptionIntersectionUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ (A ∪ B) = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A (LRA.Set.Constructions.TypeSet.instUnion.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionIntersectionUnion :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ (A ∪ B) = A
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ (A ∪ B) = A := by
  sorry

instance : DistributivityLaws (LRA.Set.Constructions.TypeSet Alpha) where
  IntersectionDistributesOverUnion :=
    LRA.Set.Constructions.TypeSet.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.Set.Constructions.TypeSet.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.Set.Constructions.TypeSet.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.Set.Constructions.TypeSet.AbsorptionIntersectionUnion

end LRA.Set.Constructions.TypeSet
