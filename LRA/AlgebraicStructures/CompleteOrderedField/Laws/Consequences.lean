import LRA.AlgebraicStructures.CompleteOrderedField.Laws.Definition

namespace LRA.AlgebraicStructures

/-!
Derived consequences of the CompleteOrderedField law certificates belong here.
-/

universe u v

/-- `root` is a square root of `value`: nonnegative, and its square is
`value`.

Logical form:

```lean
def IsSquareRoot {R : Type u} [Mul R] [LE R] [OfNat R 0]
    (root value : R) : Prop :=
  0 ≤ root ∧ root * root = value
```
-/
def IsSquareRoot {R : Type u} [Mul R] [LE R] [OfNat R 0]
    (root value : R) : Prop :=
  0 ≤ root ∧ root * root = value

/-- Every nonnegative element of a complete ordered field has a square
root. Unlike a merely ordered field (`ℚ` is a counterexample), order
completeness is what supplies the witness: the supremum of
`{x | 0 ≤ x ∧ x * x ≤ value}`.

Logical form:

```lean
theorem SquareRootExists {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [CompleteOrderedFieldLaws R (Set R)] :
    ∀ value : R, 0 ≤ value → ∃ root : R, IsSquareRoot root value
```
-/
theorem SquareRootExists {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [CompleteOrderedFieldLaws R (Set R)] :
    ∀ value : R, 0 ≤ value → ∃ root : R, IsSquareRoot root value := by
  sorry

/-- Square roots are unique: an ordered field has no zero divisors, so two
nonnegative square roots of the same value cannot differ.

Logical form:

```lean
theorem SquareRootUnique {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] {root1 root2 value : R} :
    IsSquareRoot root1 value → IsSquareRoot root2 value → root1 = root2
```
-/
theorem SquareRootUnique {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] {root1 root2 value : R} :
    IsSquareRoot root1 value → IsSquareRoot root2 value → root1 = root2 := by
  sorry

end LRA.AlgebraicStructures
