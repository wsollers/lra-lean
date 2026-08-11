-- LRA/VolumeII/BasicArithmetic/AlgebraicIdentities.lean
-- Lang-style elementary algebraic identities over mixin-certified carriers.

import LRA.VolumeI.AlgebraicStructures

namespace LRA.VolumeII.BasicArithmetic.AlgebraicIdentities

open LRA.VolumeI.AlgebraicStructures

universe u

/-!
Volume II label: basic-arithmetic-algebraic-identities
Lean module: LRA.VolumeII.BasicArithmetic.AlgebraicIdentities
Verification status: statement-accepted-proof-pending

Elementary algebraic manipulations as named facts, stated over any
carrier with the mixin certificates they actually require -- no
operation bundles, no `letI` ceremony. Each statement's brackets are
exactly its mathematical hypotheses: the square-of-a-sum needs only
commutative-semiring laws (so it covers `ℕ` and the whole numbers,
which have no subtraction), while the difference identities additionally
need negation and subtraction.
-/

/-- The square of an element.

Logical form:

```lean
def Square {R : Type u} [Mul R] (value : R) : R := value * value
```
-/
def Square {R : Type u} [Mul R] (value : R) : R := value * value

/-- Square of a sum in any commutative semiring.

Mathematical statement (Lean): `theorem SqAddExpanded`.

*Proof status:* proof pending


Logical form:

```lean
theorem SqAddExpanded {R : Type u}
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1]
    [CommutativeSemiringLaws R]
    (a b : R) :
    (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b
```
-/
theorem SqAddExpanded {R : Type u}
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1]
    [CommutativeSemiringLaws R]
    (a b : R) :
    (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b := by
  sorry

/-- Difference of squares in any commutative ring.

Mathematical statement (Lean): `theorem SqSubSqExpanded`.

*Proof status:* proof pending


Logical form:

```lean
theorem SqSubSqExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    a * a - b * b = (a + b) * (a - b)
```
-/
theorem SqSubSqExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    a * a - b * b = (a + b) * (a - b) := by
  sorry

/-- Square of a difference in any commutative ring.

Mathematical statement (Lean): `theorem SqSubExpanded`.

*Proof status:* proof pending


Logical form:

```lean
theorem SqSubExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    (a - b) * (a - b) = a * a - (1 + 1) * (a * b) + b * b
```
-/
theorem SqSubExpanded {R : Type u}
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R]
    (a b : R) :
    (a - b) * (a - b) = a * a - (1 + 1) * (a * b) + b * b := by
  sorry

/-!
Instantiation checks: the identities are *stated* at every certified
carrier -- Mathlib's number systems through the bridge, and (once the
Boolean-ring view is opened) predicate sets.
-/

example (a b : Int) :
    (a + b) * (a + b) = a * a + (1 + 1) * (a * b) + b * b :=
  SqAddExpanded a b

example (a b : Rat) : a * a - b * b = (a + b) * (a - b) :=
  SqSubSqExpanded a b

end LRA.VolumeII.BasicArithmetic.AlgebraicIdentities
