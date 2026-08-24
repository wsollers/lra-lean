import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Complement

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`DoubleComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, Aᶜᶜ = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instHasComplement.1 (LRA.Set.PredicateSet.instHasComplement.1 A) = A

Logical form (Lean):

```lean
theorem DoubleComplement :
    ∀ A : LRA.Set.PredicateSet Alpha, Aᶜᶜ = A
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
theorem DoubleComplement :
    ∀ A : LRA.Set.PredicateSet Alpha, Aᶜᶜ = A := by
  sorry

/--
`ComplementEmpty` TODO

Predicate logic:

  ∅ ∈ LRA.Set.PredicateSet Alphaᶜ = 𝒰 ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, LRA.Set.PredicateSet.instHasComplement.1 LRA.Set.PredicateSet.instEmptyCollection.1 = LRA.Set.PredicateSet.instHasUniversal.1

Logical form (Lean):

```lean
theorem ComplementEmpty :
    (∅ : LRA.Set.PredicateSet Alpha)ᶜ = (𝒰 : LRA.Set.PredicateSet Alpha)
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
theorem ComplementEmpty :
    (∅ : LRA.Set.PredicateSet Alpha)ᶜ = (𝒰 : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`ComplementUniversal` TODO

Predicate logic:

  𝒰 ∈ LRA.Set.PredicateSet Alphaᶜ = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, LRA.Set.PredicateSet.instHasComplement.1 LRA.Set.PredicateSet.instHasUniversal.1 = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem ComplementUniversal :
    (𝒰 : LRA.Set.PredicateSet Alpha)ᶜ = (∅ : LRA.Set.PredicateSet Alpha)
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
theorem ComplementUniversal :
    (𝒰 : LRA.Set.PredicateSet Alpha)ᶜ = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`UnionComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∪ Aᶜ = 𝒰 ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A (LRA.Set.PredicateSet.instHasComplement.1 A) = LRA.Set.PredicateSet.instHasUniversal.1

Logical form (Lean):

```lean
theorem UnionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ Aᶜ = (𝒰 : LRA.Set.PredicateSet Alpha)
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
theorem UnionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ Aᶜ = (𝒰 : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`IntersectionComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∩ Aᶜ = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A (LRA.Set.PredicateSet.instHasComplement.1 A) = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ Aᶜ = (∅ : LRA.Set.PredicateSet Alpha)
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
theorem IntersectionComplement :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ Aᶜ = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`DeMorganUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasComplement.1 (LRA.Set.PredicateSet.instUnion.1 A B) = LRA.Set.PredicateSet.instInter.1 (LRA.Set.PredicateSet.instHasComplement.1 A) (LRA.Set.PredicateSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DeMorganUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
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
theorem DeMorganUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  sorry

/--
`DeMorganIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasComplement.1 (LRA.Set.PredicateSet.instInter.1 A B) = LRA.Set.PredicateSet.instUnion.1 (LRA.Set.PredicateSet.instHasComplement.1 A) (LRA.Set.PredicateSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DeMorganIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
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
theorem DeMorganIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  sorry

/--
`DifferenceAsIntersectionComplement` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A \ B = A ∩ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instSDiff.1 A B = LRA.Set.PredicateSet.instInter.1 A (LRA.Set.PredicateSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DifferenceAsIntersectionComplement :
    ∀ A B : LRA.Set.PredicateSet Alpha, A \ B = A ∩ Bᶜ
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
theorem DifferenceAsIntersectionComplement :
    ∀ A B : LRA.Set.PredicateSet Alpha, A \ B = A ∩ Bᶜ := by
  sorry

/--
`DifferenceUniversal` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A \ 𝒰 ∈ LRA.Set.PredicateSet Alpha = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instSDiff.1 A LRA.Set.PredicateSet.instHasUniversal.1 = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceUniversal :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A \ (𝒰 : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha)
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
theorem DifferenceUniversal :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A \ (𝒰 : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`UniversalDifference` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, 𝒰 ∈ LRA.Set.PredicateSet Alpha \ A = Aᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instSDiff.1 LRA.Set.PredicateSet.instHasUniversal.1 A = LRA.Set.PredicateSet.instHasComplement.1 A

Logical form (Lean):

```lean
theorem UniversalDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (𝒰 : LRA.Set.PredicateSet Alpha) \ A = Aᶜ
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
theorem UniversalDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (𝒰 : LRA.Set.PredicateSet Alpha) \ A = Aᶜ := by
  sorry

instance : ComplementLaws (LRA.Set.PredicateSet Alpha) where
  DoubleComplement := LRA.Set.PredicateSet.DoubleComplement
  ComplementEmpty := LRA.Set.PredicateSet.ComplementEmpty
  ComplementUniversal := LRA.Set.PredicateSet.ComplementUniversal
  UnionComplement := LRA.Set.PredicateSet.UnionComplement
  IntersectionComplement := LRA.Set.PredicateSet.IntersectionComplement
  DeMorganUnion := LRA.Set.PredicateSet.DeMorganUnion
  DeMorganIntersection := LRA.Set.PredicateSet.DeMorganIntersection
  DifferenceAsIntersectionComplement :=
    LRA.Set.PredicateSet.DifferenceAsIntersectionComplement
  DifferenceUniversal := LRA.Set.PredicateSet.DifferenceUniversal
  UniversalDifference := LRA.Set.PredicateSet.UniversalDifference

end LRA.Set.PredicateSet
