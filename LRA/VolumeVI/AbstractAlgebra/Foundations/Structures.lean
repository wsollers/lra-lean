/-!
Reference definitions for abstract algebra.

This module records textbook-level algebraic data for Volume VI orientation. It
is not intended as the proof foundation for later files; formal proofs should
use Mathlib's algebraic hierarchy directly.
-/

namespace LRA.Algebra

universe u

/-- Reference data for a semigroup.

Logical form:

```lean
structure SemigroupDefinition (G : Type u) where
  /-- The binary operation. -/
  mul : G → G → G
  /-- The binary operation is associative. -/
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
```
-/
structure SemigroupDefinition (G : Type u) where
  /-- The binary operation. -/
  mul : G → G → G
  /-- The binary operation is associative. -/
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)

/-- Reference data for a monoid.

Logical form:

```lean
structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where
  /-- The identity element. -/
  one : M
  /-- The identity element acts on the left. -/
  one_mul : ∀ a : M, mul one a = a
  /-- The identity element acts on the right. -/
  mul_one : ∀ a : M, mul a one = a
```
-/
structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where
  /-- The identity element. -/
  one : M
  /-- The identity element acts on the left. -/
  one_mul : ∀ a : M, mul one a = a
  /-- The identity element acts on the right. -/
  mul_one : ∀ a : M, mul a one = a

/-- Reference data for a group.

Logical form:

```lean
structure GroupDefinition (G : Type u) extends MonoidDefinition G where
  /-- The inverse operation. -/
  inv : G → G
  /-- Inverses cancel on the left. -/
  inv_mul_cancel : ∀ a : G, mul (inv a) a = one
```
-/
structure GroupDefinition (G : Type u) extends MonoidDefinition G where
  /-- The inverse operation. -/
  inv : G → G
  /-- Inverses cancel on the left. -/
  inv_mul_cancel : ∀ a : G, mul (inv a) a = one

/-- Reference data for a ring.

Logical form:

```lean
structure RingDefinition (R : Type u) where
  /-- The additive identity. -/
  zero : R
  /-- Addition. -/
  add : R → R → R
  /-- Additive inverse. -/
  neg : R → R
  /-- The multiplicative identity. -/
  one : R
  /-- Multiplication. -/
  mul : R → R → R
  /-- Addition is associative. -/
  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)
  /-- Addition is commutative. -/
  add_comm : ∀ a b : R, add a b = add b a
  /-- Zero is a left additive identity. -/
  zero_add : ∀ a : R, add zero a = a
  /-- Additive inverses cancel on the left. -/
  add_left_neg : ∀ a : R, add (neg a) a = zero
  /-- Multiplication is associative. -/
  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
  /-- One is a left multiplicative identity. -/
  one_mul : ∀ a : R, mul one a = a
  /-- One is a right multiplicative identity. -/
  mul_one : ∀ a : R, mul a one = a
  /-- Multiplication distributes over addition on the left. -/
  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
  /-- Multiplication distributes over addition on the right. -/
  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)
```
-/
structure RingDefinition (R : Type u) where
  /-- The additive identity. -/
  zero : R
  /-- Addition. -/
  add : R → R → R
  /-- Additive inverse. -/
  neg : R → R
  /-- The multiplicative identity. -/
  one : R
  /-- Multiplication. -/
  mul : R → R → R
  /-- Addition is associative. -/
  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)
  /-- Addition is commutative. -/
  add_comm : ∀ a b : R, add a b = add b a
  /-- Zero is a left additive identity. -/
  zero_add : ∀ a : R, add zero a = a
  /-- Additive inverses cancel on the left. -/
  add_left_neg : ∀ a : R, add (neg a) a = zero
  /-- Multiplication is associative. -/
  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
  /-- One is a left multiplicative identity. -/
  one_mul : ∀ a : R, mul one a = a
  /-- One is a right multiplicative identity. -/
  mul_one : ∀ a : R, mul a one = a
  /-- Multiplication distributes over addition on the left. -/
  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
  /-- Multiplication distributes over addition on the right. -/
  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

/-- Reference data for a field.

Logical form:

```lean
structure FieldDefinition (K : Type u) extends RingDefinition K where
  /-- Multiplicative inverse. -/
  inv : K → K
  /-- Multiplication is commutative. -/
  mul_comm : ∀ a b : K, mul a b = mul b a
  /-- Nonzero elements have left inverses. -/
  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one
```
-/
structure FieldDefinition (K : Type u) extends RingDefinition K where
  /-- Multiplicative inverse. -/
  inv : K → K
  /-- Multiplication is commutative. -/
  mul_comm : ∀ a b : K, mul a b = mul b a
  /-- Nonzero elements have left inverses. -/
  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one

/-- Reference data for a packaged algebraic structure.

Logical form:

```lean
structure AlgebraicStructureDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The selected algebraic structure on the carrier. -/
  structureData : Carrier → Prop
```
-/
structure AlgebraicStructureDefinition where
  /-- The underlying carrier. -/
  Carrier : Type u
  /-- The selected algebraic structure on the carrier. -/
  structureData : Carrier → Prop

end LRA.Algebra
