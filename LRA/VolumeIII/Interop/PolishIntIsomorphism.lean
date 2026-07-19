-- LRA/VolumeIII/Interop/PolishIntIsomorphism.lean
-- Isomorphism and interoperability tests for the Polish integer construction.

import Mathlib
import LRA.VolumeII.Integers.Polish
import LRA.VolumeIII.Interop.Isomorphism
import LRA.VolumeIII.Interop.PolishInt

namespace LRA
namespace VolumeIII
namespace Interop
namespace PolishIntIsomorphism

namespace PolishZ

abbrev Z := VolumeII.Integers.Polish.PolishZCarrier

open LRA.VolumeIII.Interop.PolishInt.PolishZ

/-- Conversion from the Polish construction to Lean integers is bijective. -/
def equivalence : Z ≃ Int where
  toFun := toMathlibInt
  invFun := ofMathlibInt
  left_inv := by
    intro value
    sorry
  right_inv := by
    intro value
    sorry

/-- The Polish-integer equivalence preserves all native ordered-ring structure. -/
theorem orderedRingIsomorphism_exists :
    Nonempty (OrderedRingIsomorphism Z Int) := by
  refine ⟨{
  equivalence := equivalence

  constructedZero := 0
  constructedOne := 1
  constructedAdd := (· + ·)
  constructedNeg := Neg.neg
  constructedMul := (· * ·)
  constructedLt := (· < ·)
  constructedLe := (· ≤ ·)

  referenceZero := 0
  referenceOne := 1
  referenceAdd := (· + ·)
  referenceNeg := Neg.neg
  referenceMul := (· * ·)
  referenceLt := (· < ·)
  referenceLe := (· ≤ ·)

  map_zero := by
    sorry
  map_one := by
    sorry
  map_add := by
    intro left right
    sorry
  map_neg := by
    intro value
    sorry
  map_mul := by
    intro left right
    sorry
  map_lt := by
    intro left right
    sorry
  map_le := by
    intro left right
    sorry
  }⟩

/-- The equivalence preserves all native ordered-ring structure. -/
noncomputable def orderedRingIsomorphism : OrderedRingIsomorphism Z Int :=
  Classical.choice orderedRingIsomorphism_exists

/-- Subtraction is preserved as a derived operation. -/
theorem map_subtraction
    (left right : Z) :
    equivalence (left - right) = equivalence left - equivalence right := by
  sorry

/-- Successor is transported to addition by one. -/
theorem map_successor
    (value : Z) :
    equivalence (VolumeII.Integers.Polish.TwoSidedSuccessor.succ value) =
      equivalence value + 1 := by
  sorry

/-- Predecessor is transported to subtraction by one. -/
theorem map_predecessor
    (value : Z) :
    equivalence (VolumeII.Integers.Polish.TwoSidedSuccessor.pred value) =
      equivalence value - 1 := by
  sorry

namespace Tests

/-- Reference values substitute into native Polish addition. -/
example :
    equivalence
        (orderedRingIsomorphism.constructedAdd
          (equivalence.symm 2)
          (equivalence.symm (-5))) =
      (-3 : Int) := by
  simpa using
    RingIsomorphism.binary_function_transport
      orderedRingIsomorphism.toRingIsomorphism
      orderedRingIsomorphism.constructedAdd
      orderedRingIsomorphism.referenceAdd
      orderedRingIsomorphism.map_add
      (2 : Int)
      (-5 : Int)

/-- Reference values substitute into native Polish negation. -/
example :
    equivalence
        (orderedRingIsomorphism.constructedNeg
          (equivalence.symm (-4))) =
      (4 : Int) := by
  simpa using
    RingIsomorphism.unary_function_transport
      orderedRingIsomorphism.toRingIsomorphism
      orderedRingIsomorphism.constructedNeg
      orderedRingIsomorphism.referenceNeg
      orderedRingIsomorphism.map_neg
      (-4 : Int)

/-- Reference values substitute into native Polish multiplication. -/
example :
    equivalence
        (orderedRingIsomorphism.constructedMul
          (equivalence.symm (-2))
          (equivalence.symm 3)) =
      (-6 : Int) := by
  simpa using
    RingIsomorphism.binary_function_transport
      orderedRingIsomorphism.toRingIsomorphism
      orderedRingIsomorphism.constructedMul
      orderedRingIsomorphism.referenceMul
      orderedRingIsomorphism.map_mul
      (-2 : Int)
      (3 : Int)

/-- Strict order is preserved and reflected. -/
example :
    orderedRingIsomorphism.constructedLt
      (equivalence.symm (-3))
      (equivalence.symm 2) := by
  rw [orderedRingIsomorphism.map_lt]
  norm_num

/-- Non-strict order is preserved and reflected. -/
example :
    orderedRingIsomorphism.constructedLe
      (equivalence.symm (-3))
      (equivalence.symm (-3)) := by
  rw [orderedRingIsomorphism.map_le]
  norm_num

/-- Both conversion directions round-trip. -/
example (value : Z) : equivalence.symm (equivalence value) = value :=
  equivalence.symm_apply_apply value

example (value : Int) : equivalence (equivalence.symm value) = value :=
  equivalence.apply_symm_apply value

end Tests

end PolishZ

end PolishIntIsomorphism
end Interop
end VolumeIII
end LRA
