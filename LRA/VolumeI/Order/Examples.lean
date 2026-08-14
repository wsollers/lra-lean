import LRA.VolumeI.Order.Density
import LRA.VolumeI.Order.Directed
import LRA.VolumeI.Order.Lattices
import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.VolumeI.Order

universe u

/--
Divisibility on natural numbers is a partial order. The zero case is included:
if `0 ∣ b`, then `b = 0`, so antisymmetry remains valid.

Logical form:

```lean
theorem NaturalDivisibilityIsPartialOrder :
    PartialOrder (fun left right : Nat => left ∣ right)
```
-/
theorem NaturalDivisibilityIsPartialOrder :
    PartialOrder (fun left right : Nat => left ∣ right) := by
  sorry

/--
Divisibility on natural numbers is not total.

Logical form:

```lean
theorem NaturalDivisibilityIsNotTotal :
    Not (LRA.VolumeI.Relations.Total (fun left right : Nat => left ∣ right))
```
-/
theorem NaturalDivisibilityIsNotTotal :
    Not (LRA.VolumeI.Relations.Total (fun left right : Nat => left ∣ right)) := by
  sorry

/--
The usual integer order is total.

Logical form:

```lean
theorem IntegerOrderIsTotal :
    LRA.VolumeI.Relations.Total (fun left right : Int => left ≤ right)
```
-/
theorem IntegerOrderIsTotal :
    LRA.VolumeI.Relations.Total (fun left right : Int => left ≤ right) := by
  sorry

/--
The usual integer order is not dense.

Logical form:

```lean
theorem IntegerOrderIsNotDense :
    Not (LRA.VolumeI.Relations.Dense (fun left right : Int => left < right))
```
-/
theorem IntegerOrderIsNotDense :
    Not (LRA.VolumeI.Relations.Dense (fun left right : Int => left < right)) := by
  sorry

/-- Set inclusion is a partial order on predicate subsets. -/
theorem SetInclusionIsPartialOrder (Alpha : Type u) :
    PartialOrder (fun left right : Set Alpha => left ⊆ right) := by
  sorry

/-- Union is the join operation in the inclusion order on sets. -/
theorem SetUnionIsJoin
    {Alpha : Type u} (left right : Set Alpha) :
    Join (fun first second : Set Alpha => first ⊆ second)
      left right (left ∪ right) := by
  sorry

/-- Intersection is the meet operation in the inclusion order on sets. -/
theorem SetIntersectionIsMeet
    {Alpha : Type u} (left right : Set Alpha) :
    Meet (fun first second : Set Alpha => first ⊆ second)
      left right (left ∩ right) := by
  sorry

/--
Integer divisibility is a preorder but not a partial order: `3` and `-3`
divide one another without being equal.
-/
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    Preorder (fun left right : Int => left ∣ right) /\
      Not (PartialOrder (fun left right : Int => left ∣ right)) := by
  sorry

/--
Natural divisibility forms a lattice, with least common multiple as join and
greatest common divisor as meet. The proof is deferred to the arithmetic
development, but the canonical statement is fixed here.
-/
theorem NaturalDivisibilityIsLattice :
    Lattice (fun left right : Nat => left ∣ right) /\
      (forall left right,
        Join (fun first second : Nat => first ∣ second)
          left right (Nat.lcm left right)) /\
      (forall left right,
        Meet (fun first second : Nat => first ∣ second)
          left right (Nat.gcd left right)) := by
  sorry

end LRA.VolumeI.Order
