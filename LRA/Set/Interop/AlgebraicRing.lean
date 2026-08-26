import LRA.Set.Constructions.TypeSet.Laws
import LRA.AlgebraicStructures.CommutativeRing.Laws.Definition

namespace LRA.Set.Interop.AlgebraicRing

open LRA.Set
open LRA.Set.Constructions
open LRA.Set.Constructions.TypeSet
open LRA.AlgebraicStructures

universe u

variable {Alpha : Type u}

scoped instance : Add (TypeSet Alpha) where
  add := SymmetricDifference

scoped instance : Mul (TypeSet Alpha) where
  mul := Intersection

scoped instance : OfNat (TypeSet Alpha) 0 where
  ofNat := Empty Alpha

scoped instance : OfNat (TypeSet Alpha) 1 where
  ofNat := Universal Alpha

scoped instance : Neg (TypeSet Alpha) where
  neg := id

/--
`UniversalIntersection` TODO

Predicate logic:

  ∀ A : TypeSet Alpha, 1 * A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), instHMul.1 LRA.Set.Interop.AlgebraicRing.instOfNatPredicateSetOfNatNat_1.1 A = A

Logical form (Lean):

```lean
theorem UniversalIntersection : ∀ A : TypeSet Alpha, 1 * A = A
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
theorem UniversalIntersection : ∀ A : TypeSet Alpha, 1 * A = A := by
  sorry

/--
`IntersectionUniversal` TODO

Predicate logic:

  ∀ A : TypeSet Alpha, A * 1 = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), instHMul.1 A LRA.Set.Interop.AlgebraicRing.instOfNatPredicateSetOfNatNat_1.1 = A

Logical form (Lean):

```lean
theorem IntersectionUniversal : ∀ A : TypeSet Alpha, A * 1 = A
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
theorem IntersectionUniversal : ∀ A : TypeSet Alpha, A * 1 = A := by
  sorry

/--
`IntersectionDistributesOverSymmetricDifference` TODO

Predicate logic:

  ∀ A B C : TypeSet Alpha, A * (B + C) = A * B + A * C

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), instHMul.1 A (instHAdd.1 B C) = instHAdd.1 (instHMul.1 A B) (instHMul.1 A C)

Logical form (Lean):

```lean
theorem IntersectionDistributesOverSymmetricDifference :
    ∀ A B C : TypeSet Alpha, A * (B + C) = A * B + A * C
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
theorem IntersectionDistributesOverSymmetricDifference :
    ∀ A B C : TypeSet Alpha, A * (B + C) = A * B + A * C := by
  sorry

/--
`SymmetricDifferenceIntersectionDistributes` TODO

Predicate logic:

  ∀ A B C : TypeSet Alpha, (A + B) * C = A * C + B * C

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), instHMul.1 (instHAdd.1 A B) C = instHAdd.1 (instHMul.1 A C) (instHMul.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceIntersectionDistributes :
    ∀ A B C : TypeSet Alpha, (A + B) * C = A * C + B * C
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
theorem SymmetricDifferenceIntersectionDistributes :
    ∀ A B C : TypeSet Alpha, (A + B) * C = A * C + B * C := by
  sorry

scoped instance : AdditiveSemigroupLaws (TypeSet Alpha) := by
  sorry

scoped instance : AdditiveCommutativeLaws (TypeSet Alpha) := by
  sorry

scoped instance : AdditiveIdentityLaws (TypeSet Alpha) := by
  sorry

scoped instance : AdditiveInverseLaws (TypeSet Alpha) := by
  sorry

scoped instance : MultiplicativeSemigroupLaws (TypeSet Alpha) := by
  sorry

scoped instance : MultiplicativeCommutativeLaws (TypeSet Alpha) := by
  sorry

scoped instance : MultiplicativeIdentityLaws (TypeSet Alpha) := by
  sorry

scoped instance : ZeroAbsorbingLaws (TypeSet Alpha) := by
  sorry

scoped instance : DistributiveLaws (TypeSet Alpha) := by
  sorry

example (A B : TypeSet Alpha) : A + B = B + A :=
  AddCommutative A B

example (A B C : TypeSet Alpha) : (A + B) + C = A + (B + C) :=
  AddAssociative A B C

example (A B C : TypeSet Alpha) : (A + B) * C = A * C + B * C :=
  RightDistributive A B C

example (A : TypeSet Alpha) : A + A = 0 :=
  AddNegCancel A

example : CommutativeRingLaws (TypeSet Alpha) := inferInstance

end LRA.Set.Interop.AlgebraicRing
