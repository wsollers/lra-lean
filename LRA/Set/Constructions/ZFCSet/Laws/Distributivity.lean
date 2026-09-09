import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Distributivity

namespace LRA.Set.Constructions.ZFCSet

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCB ∪ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B ∪ LRA.Set.Constructions.ZFCA ∩ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCB ∪ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B ∪ LRA.Set.Constructions.ZFCA ∩ C

Logical form (Lean):

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
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
    ∀ A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

/--
`UnionDistributesOverIntersection` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCB ∩ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B ∩ LRA.Set.Constructions.ZFCA ∪ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCB ∩ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B ∩ LRA.Set.Constructions.ZFCA ∪ C

Logical form (Lean):

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
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
    ∀ A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

/--
`AbsorptionUnionIntersection` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCA ∩ B = A

Logical form (Lean):

```lean
theorem AbsorptionUnionIntersection :
    ∀ A B : Set, A ∪ (A ∩ B) = A
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
    ∀ A B : Set, A ∪ (A ∩ B) = A := by
  sorry

/--
`AbsorptionIntersectionUnion` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCA ∪ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCA ∪ B = A

Logical form (Lean):

```lean
theorem AbsorptionIntersectionUnion :
    ∀ A B : Set, A ∩ (A ∪ B) = A
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
    ∀ A B : Set, A ∩ (A ∪ B) = A := by
  sorry

end LRA.Set.Constructions.ZFCSet
