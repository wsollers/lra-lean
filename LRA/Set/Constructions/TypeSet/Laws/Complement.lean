import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Complement

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`DoubleComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, Aᶜᶜ = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasComplement.1 (LRA.Set.Constructions.TypeSet.instHasComplement.1 A) = A

Logical form (Lean):

```lean
theorem DoubleComplement :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, Aᶜᶜ = A
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, Aᶜᶜ = A := by
  sorry

/--
`ComplementEmpty` TODO

Predicate logic:

  ∅ ∈ LRA.Set.Constructions.TypeSet Alphaᶜ = 𝒰 ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, LRA.Set.Constructions.TypeSet.instHasComplement.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = LRA.Set.Constructions.TypeSet.instHasUniversal.1

Logical form (Lean):

```lean
theorem ComplementEmpty :
    (∅ : LRA.Set.Constructions.TypeSet Alpha)ᶜ = (𝒰 : LRA.Set.Constructions.TypeSet Alpha)
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
    (∅ : LRA.Set.Constructions.TypeSet Alpha)ᶜ = (𝒰 : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`ComplementUniversal` TODO

Predicate logic:

  𝒰 ∈ LRA.Set.Constructions.TypeSet Alphaᶜ = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u}, LRA.Set.Constructions.TypeSet.instHasComplement.1 LRA.Set.Constructions.TypeSet.instHasUniversal.1 = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem ComplementUniversal :
    (𝒰 : LRA.Set.Constructions.TypeSet Alpha)ᶜ = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
    (𝒰 : LRA.Set.Constructions.TypeSet Alpha)ᶜ = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`UnionComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∪ Aᶜ = 𝒰 ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A (LRA.Set.Constructions.TypeSet.instHasComplement.1 A) = LRA.Set.Constructions.TypeSet.instHasUniversal.1

Logical form (Lean):

```lean
theorem UnionComplement :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∪ Aᶜ = (𝒰 : LRA.Set.Constructions.TypeSet Alpha)
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∪ Aᶜ = (𝒰 : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`IntersectionComplement` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ Aᶜ = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A (LRA.Set.Constructions.TypeSet.instHasComplement.1 A) = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionComplement :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ Aᶜ = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ Aᶜ = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`DeMorganUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasComplement.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A B) = LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instHasComplement.1 A) (LRA.Set.Constructions.TypeSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DeMorganUnion :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  sorry

/--
`DeMorganIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasComplement.1 (LRA.Set.Constructions.TypeSet.instInter.1 A B) = LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instHasComplement.1 A) (LRA.Set.Constructions.TypeSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DeMorganIntersection :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  sorry

/--
`DifferenceAsIntersectionComplement` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B = A ∩ Bᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A B = LRA.Set.Constructions.TypeSet.instInter.1 A (LRA.Set.Constructions.TypeSet.instHasComplement.1 B)

Logical form (Lean):

```lean
theorem DifferenceAsIntersectionComplement :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B = A ∩ Bᶜ
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B = A ∩ Bᶜ := by
  sorry

/--
`DifferenceUniversal` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A \ 𝒰 ∈ LRA.Set.Constructions.TypeSet Alpha = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A LRA.Set.Constructions.TypeSet.instHasUniversal.1 = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceUniversal :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ (𝒰 : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ (𝒰 : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`UniversalDifference` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, 𝒰 ∈ LRA.Set.Constructions.TypeSet Alpha \ A = Aᶜ

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 LRA.Set.Constructions.TypeSet.instHasUniversal.1 A = LRA.Set.Constructions.TypeSet.instHasComplement.1 A

Logical form (Lean):

```lean
theorem UniversalDifference :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (𝒰 : LRA.Set.Constructions.TypeSet Alpha) \ A = Aᶜ
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (𝒰 : LRA.Set.Constructions.TypeSet Alpha) \ A = Aᶜ := by
  sorry

end LRA.Set.Constructions.TypeSet
