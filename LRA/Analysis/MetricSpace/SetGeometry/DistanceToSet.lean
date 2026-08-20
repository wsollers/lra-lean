import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Archimedean

namespace LRA.Analysis.MetricSpace

/-! Set distance in metric spaces. -/


/-- The set of distances from a point to the points of a set.

Mathematical statement (Lean): `def distanceSet {X : Type u} [MetricSpace X] (x : X) (S : Set X) : Set Real`.


Logical form:

```lean
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S
```
-/
def distanceSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Set Real :=
  (fun y : X => dist x y) '' S


/-- The distance from a point to a set in an ambient metric space.

Mathematical statement (Lean): `noncomputable def distanceToSet {X : Type u} [MetricSpace X] (x : X) (S : Set X) : Real`.


Logical form:

```lean
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)
```
-/
noncomputable def distanceToSet
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) : Real :=
  sInf (distanceSet x S)


/-- If the original set is nonempty, then its distance set is nonempty.

Mathematical statement (Lean): `theorem distanceSet_nonempty {X : Type u} [MetricSpace X] (x : X) {S : Set X} (set_nonempty : S.Nonempty) : (distanceSet x S).Nonempty`.

*Proof status:* proof pending


Logical form:

```lean
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty
```
-/
theorem distanceSet_nonempty
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    (distanceSet x S).Nonempty := by
  sorry

/-- The distance set is bounded below by zero.

Mathematical statement (Lean): `theorem distanceSet_bddBelow {X : Type u} [MetricSpace X] (x : X) (S : Set X) : BddBelow (distanceSet x S)`.


Logical form:

```lean
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S)
```
-/
theorem distanceSet_bddBelow
    {X : Type u}
    [MetricSpace X]
    (x : X)
    (S : Set X) :
    BddBelow (distanceSet x S) := by
  sorry

/-- The point-to-set distance is the infimum of all distances from the point to

Mathematical statement (Lean): `theorem distanceToSet_isGLB {X : Type u} [MetricSpace X] (x : X) {S : Set X} (set_nonempty : S.Nonempty) : IsGLB (distanceSet x S) (distanceToSet x S)`.

*Proof status:* proof pending
points in the set.

Logical form:

```lean
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S)
```
-/
theorem distanceToSet_isGLB
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {S : Set X}
    (set_nonempty : S.Nonempty) :
    IsGLB (distanceSet x S) (distanceToSet x S) := by
  sorry

/-- The point-to-set distance is bounded above by the distance to any witness

Mathematical statement (Lean): `theorem distanceToSet_le_distance_to_point_of_mem {X : Type u} [MetricSpace X] (x : X) {A : Set X} {a : X} (point_in_set : a ∈ A) : distanceToSet x A ≤ dist x a`.
point in the set.

Logical form:

```lean
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a
```
-/
theorem distanceToSet_le_distance_to_point_of_mem
    {X : Type u}
    [MetricSpace X]
    (x : X)
    {A : Set X}
    {a : X}
    (point_in_set : a ∈ A) :
    distanceToSet x A ≤ dist x a := by
  sorry

/-- The distance from a point to a set is zero when the point belongs to the

Mathematical statement (Lean): `theorem distanceToSet_eq_zero_of_mem {X : Type u} [MetricSpace X] {A : Set X} {x : X} (point_in_set : x ∈ A) : distanceToSet x A = 0`.
set.

Logical form:

```lean
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0
```
-/
theorem distanceToSet_eq_zero_of_mem
    {X : Type u}
    [MetricSpace X]
    {A : Set X}
    {x : X}
    (point_in_set : x ∈ A) :
    distanceToSet x A = 0 := by
  sorry

end LRA.Analysis.MetricSpace
