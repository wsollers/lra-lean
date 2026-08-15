import Mathlib.Order.Bounds.Basic
import LRA.VolumeI.Order.Bounds
import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.Interop.Mathlib.Order

open LRA.Order

universe u

/-- Package a typeclass-driven Lean partial order as an explicit LRA poset. -/
@[reducible] def PosetFromPartialOrder
    (carrier : Type u) [partialOrder : _root_.PartialOrder carrier] : Poset where
  Carrier := carrier
  NonStrictOrder := fun left right => left ≤ right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact le_refl element
    · intro left right leftLeRight rightLeLeft
      exact le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact le_trans firstLeSecond secondLeThird

/--
Expose an LRA poset as a Lean partial order. Install this definition locally
with `letI`; it is deliberately not a global instance.
-/
@[reducible] def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1

/-- LRA upper bounds specialize to Mathlib's `upperBounds`. -/
theorem upperBound_iff_mem_upperBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    UpperBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ upperBounds subset := by
  sorry

/-- LRA lower bounds specialize to Mathlib's `lowerBounds`. -/
theorem lowerBound_iff_mem_lowerBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LowerBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ lowerBounds subset := by
  sorry

/-- LRA least elements specialize to Mathlib's `IsLeast`. -/
theorem leastElement_iff_isLeast
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LeastElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLeast subset candidate := by
  sorry

/-- LRA greatest elements specialize to Mathlib's `IsGreatest`. -/
theorem greatestElement_iff_isGreatest
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    GreatestElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGreatest subset candidate := by
  sorry

/-- LRA suprema specialize to Mathlib's `IsLUB`. -/
theorem supremum_iff_isLUB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Supremum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLUB subset candidate := by
  sorry

/-- LRA infima specialize to Mathlib's `IsGLB`. -/
theorem infimum_iff_isGLB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Infimum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGLB subset candidate := by
  sorry

/-- LRA bounded-above subsets specialize to Mathlib's `BddAbove`. -/
theorem boundedAbove_iff_bddAbove
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedAbove (fun left right : Alpha => left ≤ right) subset ↔
      BddAbove subset := by
  sorry

/-- LRA bounded-below subsets specialize to Mathlib's `BddBelow`. -/
theorem boundedBelow_iff_bddBelow
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedBelow (fun left right : Alpha => left ≤ right) subset ↔
      BddBelow subset := by
  sorry

end LRA.Interop.Mathlib.Order
