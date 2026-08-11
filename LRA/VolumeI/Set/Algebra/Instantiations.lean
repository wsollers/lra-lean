import Mathlib.Data.Set.Basic
import LRA.VolumeI.Set
import LRA.VolumeI.Set.Algebra.BooleanAlgebra
import LRA.VolumeI.Set.Algebra.SigmaAlgebra

namespace LRA.VolumeI.Set.Algebra.Instantiations

open LRA.VolumeI.Set.Algebra LRA.VolumeI.Set

/-!
Reference instantiations of the ambient-relative algebra structures at
concrete backends -- the full Mathlib powerset, the `{∅, univ}`
subalgebra, and the `LRASet` powerset. Formerly part of the retired
`VolumeII/Switches` module: under the law-class architecture there is
nothing left to "switch" -- instance resolution selects backends -- so
these live with the algebra layer as worked examples.

Closure proofs pending (the powerset cases are one-line arguments).
-/

/-- Active Mathlib set-object carrier over a point type.

Logical form:

```lean
abbrev ActiveSet (Point : Type) := Set Point
```
-/
abbrev ActiveSet (Point : Type) := Set Point

/-- The full Mathlib powerset as an algebra of sets on `Set.univ`.

*Proof status:* closure proofs pending.

Logical form:

```lean
def activeSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun _ => True
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry
```
-/
def activeSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun _ => True
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry

/-- The proper subcollection `{∅, univ}` as a non-vacuous algebra of
Mathlib sets.

*Proof status:* closure proofs pending.

Logical form:

```lean
def emptyUniversalSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry
```
-/
def emptyUniversalSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry

/-- The full Mathlib powerset as a sigma-algebra on `Set.univ`.

*Proof status:* closure proofs pending.

Logical form:

```lean
def activeSigmaAlgebra (Point : Type) :
    SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
  toAlgebraOfSets := activeSetAlgebra Point
  CountableUnionIsMember := by sorry
```
-/
def activeSigmaAlgebra (Point : Type) :
    SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
  toAlgebraOfSets := activeSetAlgebra Point
  CountableUnionIsMember := by sorry

/-- The full `LRASet` powerset as an algebra of sets on the universal
predicate set.

*Proof status:* closure proofs pending.

Logical form:

```lean
def lraSetAlgebra (Point : Type) :
    AlgebraOfSets (LRA.VolumeI.Set.LRASet.Universal Point) where
  IsMember := fun _ => True
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry
```
-/
def lraSetAlgebra (Point : Type) :
    AlgebraOfSets (LRA.VolumeI.Set.LRASet.Universal Point) where
  IsMember := fun _ => True
  MembersAreSubsets := by sorry
  EmptyIsMember := by sorry
  UnionIsMember := by sorry
  IntersectionIsMember := by sorry
  DifferenceIsMember := by sorry
  SymmetricDifferenceIsMember := by sorry
  AmbientIsMember := by sorry


end LRA.VolumeI.Set.Algebra.Instantiations
