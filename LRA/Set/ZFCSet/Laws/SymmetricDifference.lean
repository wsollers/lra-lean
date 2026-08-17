import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.Enderton

/-!
Symmetric-difference laws for Enderton sets: the backend's certificate for
`LRA.Set.SymmDiffLaws`.

`A ∆ B` resolves through the `HasSymmDiff Set` instance in
`Instances.lean`, backed by `TheSymmetricDifference` -- the union of the
two relative complements, derived in `Theorems/SymmetricDifference.lean`
with no new axiom and no universal set.

Note for the prover: `SymmetricDifferenceAsUnionDifferences` is
definitional -- `TheSymmetricDifference` is literally
`TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)` -- so
its proof should be immediate once attempted.
-/
/--
`SymmetricDifferenceAsUnionDifferences` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A)
```
-/

theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry
/--
`SymmetricDifferenceAsUnionDifferenceIntersection` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B)
```
-/

theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry
/--
`SymmetricDifferenceCommutative` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceCommutative :
    ∀ A B : Set, A ∆ B = B ∆ A
```
-/

theorem SymmetricDifferenceCommutative :
    ∀ A B : Set, A ∆ B = B ∆ A := by
  sorry
/--
`SymmetricDifferenceAssociative` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C)
```
-/

theorem SymmetricDifferenceAssociative :
    ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry
/--
`SymmetricDifferenceEmpty` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceEmpty : ∀ A : Set, A ∆ (∅ : Set) = A
```
-/

theorem SymmetricDifferenceEmpty : ∀ A : Set, A ∆ (∅ : Set) = A := by
  sorry
/--
`EmptySymmetricDifference` exposes this formal declaration.

Logical form:

```lean
theorem EmptySymmetricDifference : ∀ A : Set, (∅ : Set) ∆ A = A
```
-/

theorem EmptySymmetricDifference : ∀ A : Set, (∅ : Set) ∆ A = A := by
  sorry
/--
`SymmetricDifferenceSelf` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceSelf : ∀ A : Set, A ∆ A = (∅ : Set)
```
-/

theorem SymmetricDifferenceSelf : ∀ A : Set, A ∆ A = (∅ : Set) := by
  sorry
/--
`SymmetricDifferenceEqEmptyIff` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : Set, A ∆ B = (∅ : Set) ↔ A = B
```
-/

theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : Set, A ∆ B = (∅ : Set) ↔ A = B := by
  sorry
/--
`SymmetricDifferenceSubsetUnion` exposes this formal declaration.

Logical form:

```lean
theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : Set, A ∆ B ⊆ A ∪ B
```
-/

theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : Set, A ∆ B ⊆ A ∪ B := by
  sorry

/-- Registration: Enderton sets satisfy the symmetric-difference laws. Pure
delegation to the theorems above. -/
instance : SymmDiffLaws Set where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.Set.Enderton.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.Set.Enderton.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.Set.Enderton.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.Set.Enderton.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.Set.Enderton.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.Set.Enderton.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.Set.Enderton.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.Set.Enderton.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.Set.Enderton.SymmetricDifferenceSubsetUnion

end LRA.Set.Enderton
