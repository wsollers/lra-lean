import Mathlib.Order.Bounds.Basic
import LRA.Order.Bounds
import LRA.Order.OrderedSets.Poset.Definition

namespace LRA.Interop.Mathlib.Order

open LRA.Order

universe u

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

@[reducible] def PartialOrderFromPoset (poset : Poset) :
    _root_.PartialOrder poset.Carrier where
  le := poset.NonStrictOrder
  le_refl := poset.NonStrictOrderIsPartialOrder.1
  le_trans := poset.NonStrictOrderIsPartialOrder.2.2
  le_antisymm := poset.NonStrictOrderIsPartialOrder.2.1

theorem upperBound_iff_mem_upperBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    UpperBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ upperBounds subset := by
  sorry


theorem lowerBound_iff_mem_lowerBounds
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LowerBound (fun left right : Alpha => left ≤ right) subset candidate ↔
      candidate ∈ lowerBounds subset := by
  sorry


theorem leastElement_iff_isLeast
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    LeastElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLeast subset candidate := by
  sorry


theorem greatestElement_iff_isGreatest
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    GreatestElement (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGreatest subset candidate := by
  sorry


theorem supremum_iff_isLUB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Supremum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsLUB subset candidate := by
  sorry


theorem infimum_iff_isGLB
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) (candidate : Alpha) :
    Infimum (fun left right : Alpha => left ≤ right) subset candidate ↔
      IsGLB subset candidate := by
  sorry


theorem boundedAbove_iff_bddAbove
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedAbove (fun left right : Alpha => left ≤ right) subset ↔
      BddAbove subset := by
  sorry


theorem boundedBelow_iff_bddBelow
    {Alpha : Type u} [LE Alpha] (subset : Set Alpha) :
    BoundedBelow (fun left right : Alpha => left ≤ right) subset ↔
      BddBelow subset := by
  sorry

end LRA.Interop.Mathlib.Order
