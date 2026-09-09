import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Distributivity

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeB ∪ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B ∪ LRA.Set.Constructions.TypeA ∩ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeB ∪ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B ∪ LRA.Set.Constructions.TypeA ∩ C

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

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeB ∩ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B ∩ LRA.Set.Constructions.TypeA ∪ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeB ∩ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B ∩ LRA.Set.Constructions.TypeA ∪ C

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

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeA ∩ B = A

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

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeA ∪ B = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeA ∪ B = A

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

end LRA.Set.Constructions.TypeSet
