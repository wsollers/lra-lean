import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Distributivity

namespace LRA.Set.Constructions.TGSet

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGB ∪ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B ∪ LRA.Set.Constructions.TGA ∩ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGB ∪ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B ∪ LRA.Set.Constructions.TGA ∩ C

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

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGB ∩ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B ∩ LRA.Set.Constructions.TGA ∪ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGB ∩ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B ∩ LRA.Set.Constructions.TGA ∪ C

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

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGA ∩ B = A

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

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGA ∪ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGA ∪ B = A

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
