-- LRA/VolumeIII/Interop/Isomorphism.lean
-- Reusable interoperability contracts and transport tests for constructed number systems.

import Mathlib

namespace LRA
namespace VolumeIII
namespace Interop

/-!
Lean module: LRA.VolumeIII.Interop.Isomorphism
Verification status: checked definitions; construction-specific proofs pending elsewhere

A Volume III interoperability test is not merely a computed example. Each
constructed carrier must first be related to its Lean/Mathlib reference carrier by
an actual equivalence, and that equivalence must preserve the relevant structure.
Only then do numerical examples test the constructed operations rather than wrapper
operations secretly delegated to the reference type.
-/

/-- Isomorphism data for an ordered ring presented without requiring typeclass instances. -/
structure OrderedRingIsomorphism (Constructed Reference : Type) where
  equivalence : Constructed ≃ Reference

  constructedZero : Constructed
  constructedOne : Constructed
  constructedAdd : Constructed → Constructed → Constructed
  constructedNeg : Constructed → Constructed
  constructedMul : Constructed → Constructed → Constructed
  constructedLt : Constructed → Constructed → Prop
  constructedLe : Constructed → Constructed → Prop

  referenceZero : Reference
  referenceOne : Reference
  referenceAdd : Reference → Reference → Reference
  referenceNeg : Reference → Reference
  referenceMul : Reference → Reference → Reference
  referenceLt : Reference → Reference → Prop
  referenceLe : Reference → Reference → Prop

  map_zero : equivalence constructedZero = referenceZero
  map_one : equivalence constructedOne = referenceOne
  map_add :
    ∀ left right,
      equivalence (constructedAdd left right) =
        referenceAdd (equivalence left) (equivalence right)
  map_neg :
    ∀ value,
      equivalence (constructedNeg value) = referenceNeg (equivalence value)
  map_mul :
    ∀ left right,
      equivalence (constructedMul left right) =
        referenceMul (equivalence left) (equivalence right)
  map_lt :
    ∀ left right,
      constructedLt left right ↔ referenceLt (equivalence left) (equivalence right)
  map_le :
    ∀ left right,
      constructedLe left right ↔ referenceLe (equivalence left) (equivalence right)

/-- Ordered-field interoperability adds inversion away from zero. -/
structure OrderedFieldIsomorphism (Constructed Reference : Type)
    extends OrderedRingIsomorphism Constructed Reference where
  constructedInv : Constructed → Constructed
  referenceInv : Reference → Reference
  map_inv :
    ∀ value,
      value ≠ constructedZero →
      equivalence (constructedInv value) = referenceInv (equivalence value)

/-- A complex-field bridge adds conjugation. -/
structure ComplexFieldIsomorphism (Constructed Reference : Type)
    extends OrderedFieldIsomorphism Constructed Reference where
  constructedConj : Constructed → Constructed
  referenceConj : Reference → Reference
  map_conj :
    ∀ value,
      equivalence (constructedConj value) = referenceConj (equivalence value)

namespace OrderedRingIsomorphism

variable {Constructed Reference : Type}

/-- Forward transport followed by backward transport returns the original value. -/
theorem reference_round_trip
    (bridge : OrderedRingIsomorphism Constructed Reference)
    (value : Reference) :
    bridge.equivalence (bridge.equivalence.symm value) = value :=
  bridge.equivalence.apply_symm_apply value

/-- Backward transport followed by forward transport returns the original value. -/
theorem constructed_round_trip
    (bridge : OrderedRingIsomorphism Constructed Reference)
    (value : Constructed) :
    bridge.equivalence.symm (bridge.equivalence value) = value :=
  bridge.equivalence.symm_apply_apply value

/-- Equality may be checked after transport to the reference carrier. -/
theorem equality_substitutability
    (bridge : OrderedRingIsomorphism Constructed Reference)
    (left right : Constructed) :
    left = right ↔ bridge.equivalence left = bridge.equivalence right := by
  constructor
  · intro equality
    exact congrArg bridge.equivalence equality
  · exact bridge.equivalence.injective

/-- Any unary function commuting with the bridge is substitutable across carriers. -/
theorem unary_function_transport
    (bridge : OrderedRingIsomorphism Constructed Reference)
    (constructedFunction : Constructed → Constructed)
    (referenceFunction : Reference → Reference)
    (commutes :
      ∀ value,
        bridge.equivalence (constructedFunction value) =
          referenceFunction (bridge.equivalence value))
    (value : Reference) :
    bridge.equivalence
        (constructedFunction (bridge.equivalence.symm value)) =
      referenceFunction value := by
  rw [commutes, bridge.equivalence.apply_symm_apply]

/-- Any binary function commuting with the bridge is substitutable across carriers. -/
theorem binary_function_transport
    (bridge : OrderedRingIsomorphism Constructed Reference)
    (constructedFunction : Constructed → Constructed → Constructed)
    (referenceFunction : Reference → Reference → Reference)
    (commutes :
      ∀ left right,
        bridge.equivalence (constructedFunction left right) =
          referenceFunction (bridge.equivalence left) (bridge.equivalence right))
    (left right : Reference) :
    bridge.equivalence
        (constructedFunction
          (bridge.equivalence.symm left)
          (bridge.equivalence.symm right)) =
      referenceFunction left right := by
  rw [commutes, bridge.equivalence.apply_symm_apply,
    bridge.equivalence.apply_symm_apply]

end OrderedRingIsomorphism

end Interop
end VolumeIII
end LRA
