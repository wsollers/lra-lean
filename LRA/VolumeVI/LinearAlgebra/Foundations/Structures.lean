import Mathlib.Algebra.Module.Basic

/-!
Reference definitions for linear algebra.

This module records textbook-level data for Volume VI orientation. It is not
intended as the proof foundation for later files; formal proofs should use
Mathlib's `Module` and linear-algebra APIs directly.
-/

namespace LRA.VolumeVI.LinearAlgebra

universe u v w

/-- Reference data for a vector space over a field. -/
structure VectorSpaceDefinition (K : Type u) [Field K] (V : Type v) where
  /-- The zero vector. -/
  zero : V
  /-- Vector addition. -/
  add : V → V → V
  /-- Additive inverse. -/
  neg : V → V
  /-- Scalar multiplication. -/
  smul : K → V → V
  /-- Vector addition is associative. -/
  add_assoc : ∀ x y z : V, add (add x y) z = add x (add y z)
  /-- Vector addition is commutative. -/
  add_comm : ∀ x y : V, add x y = add y x
  /-- Zero is a left identity for addition. -/
  zero_add : ∀ x : V, add zero x = x
  /-- Additive inverses cancel on the left. -/
  add_left_neg : ∀ x : V, add (neg x) x = zero
  /-- Scalar multiplication is compatible with field multiplication. -/
  mul_smul : ∀ a b : K, ∀ x : V, smul (a * b) x = smul a (smul b x)
  /-- One acts as the identity scalar. -/
  one_smul : ∀ x : V, smul 1 x = x
  /-- Scalar multiplication distributes over vector addition. -/
  smul_add : ∀ a : K, ∀ x y : V, smul a (add x y) = add (smul a x) (smul a y)
  /-- Scalar addition distributes over scalar multiplication. -/
  add_smul : ∀ a b : K, ∀ x : V, smul (a + b) x = add (smul a x) (smul b x)

/-- Reference data for a linear map between vector spaces. -/
structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where
  /-- The underlying function. -/
  toFun : V → W
  /-- The map preserves vector addition. -/
  map_add : ∀ x y : V, toFun (domain.add x y) = codomain.add (toFun x) (toFun y)
  /-- The map preserves scalar multiplication. -/
  map_smul : ∀ a : K, ∀ x : V, toFun (domain.smul a x) = codomain.smul a (toFun x)

/-- Reference data for a vector space packaged with its carrier and scalar
field. -/
structure VectorSpacePackagedDefinition where
  /-- The scalar field. -/
  Scalar : Type u
  /-- The scalar field structure. -/
  field : Field Scalar
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The vector-space operations and axioms. -/
  vectorSpace : @VectorSpaceDefinition Scalar field Carrier

end LRA.VolumeVI.LinearAlgebra
