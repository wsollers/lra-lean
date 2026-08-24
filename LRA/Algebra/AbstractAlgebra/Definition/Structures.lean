
namespace LRA.Algebra

universe u

/--
`SemigroupDefinition` TODO

Predicate logic:

  structure SemigroupDefinition (G : Type u) where

  mul : G → G → G

  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)

Predicate logic (unfolded):

  structure SemigroupDefinition (G : Type u) where

  mul : G → G → G

  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SemigroupDefinition (G : Type u) where

  mul : G → G → G

  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure SemigroupDefinition (G : Type u) where

  mul : G → G → G

  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)

/--
`MonoidDefinition` TODO

Predicate logic:

  structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where

  one : M

  one_mul : ∀ a : M, mul one a = a

  mul_one : ∀ a : M, mul a one = a

Predicate logic (unfolded):

  structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where

  one : M

  one_mul : ∀ a : M, mul one a = a

  mul_one : ∀ a : M, mul a one = a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where

  one : M

  one_mul : ∀ a : M, mul one a = a

  mul_one : ∀ a : M, mul a one = a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure MonoidDefinition (M : Type u) extends SemigroupDefinition M where

  one : M

  one_mul : ∀ a : M, mul one a = a

  mul_one : ∀ a : M, mul a one = a

/--
`GroupDefinition` TODO

Predicate logic:

  structure GroupDefinition (G : Type u) extends MonoidDefinition G where

  inv : G → G

  inv_mul_cancel : ∀ a : G, mul (inv a) a = one

Predicate logic (unfolded):

  structure GroupDefinition (G : Type u) extends MonoidDefinition G where

  inv : G → G

  inv_mul_cancel : ∀ a : G, mul (inv a) a = one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure GroupDefinition (G : Type u) extends MonoidDefinition G where

  inv : G → G

  inv_mul_cancel : ∀ a : G, mul (inv a) a = one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure GroupDefinition (G : Type u) extends MonoidDefinition G where

  inv : G → G

  inv_mul_cancel : ∀ a : G, mul (inv a) a = one

/--
`RingDefinition` TODO

Predicate logic:

  structure RingDefinition (R : Type u) where

  zero : R

  add : R → R → R

  neg : R → R

  one : R

  mul : R → R → R

  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)

  add_comm : ∀ a b : R, add a b = add b a

  zero_add : ∀ a : R, add zero a = a

  add_left_neg : ∀ a : R, add (neg a) a = zero

  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)

  one_mul : ∀ a : R, mul one a = a

  mul_one : ∀ a : R, mul a one = a

  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)

  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

Predicate logic (unfolded):

  structure RingDefinition (R : Type u) where

  zero : R

  add : R → R → R

  neg : R → R

  one : R

  mul : R → R → R

  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)

  add_comm : ∀ a b : R, add a b = add b a

  zero_add : ∀ a : R, add zero a = a

  add_left_neg : ∀ a : R, add (neg a) a = zero

  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)

  one_mul : ∀ a : R, mul one a = a

  mul_one : ∀ a : R, mul a one = a

  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)

  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RingDefinition (R : Type u) where

  zero : R

  add : R → R → R

  neg : R → R

  one : R

  mul : R → R → R

  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)

  add_comm : ∀ a b : R, add a b = add b a

  zero_add : ∀ a : R, add zero a = a

  add_left_neg : ∀ a : R, add (neg a) a = zero

  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)

  one_mul : ∀ a : R, mul one a = a

  mul_one : ∀ a : R, mul a one = a

  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)

  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure RingDefinition (R : Type u) where

  zero : R

  add : R → R → R

  neg : R → R

  one : R

  mul : R → R → R

  add_assoc : ∀ a b c : R, add (add a b) c = add a (add b c)

  add_comm : ∀ a b : R, add a b = add b a

  zero_add : ∀ a : R, add zero a = a

  add_left_neg : ∀ a : R, add (neg a) a = zero

  mul_assoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)

  one_mul : ∀ a : R, mul one a = a

  mul_one : ∀ a : R, mul a one = a

  left_distrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)

  right_distrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

/--
`FieldDefinition` TODO

Predicate logic:

  structure FieldDefinition (K : Type u) extends RingDefinition K where

  inv : K → K

  mul_comm : ∀ a b : K, mul a b = mul b a

  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one

Predicate logic (unfolded):

  structure FieldDefinition (K : Type u) extends RingDefinition K where

  inv : K → K

  mul_comm : ∀ a b : K, mul a b = mul b a

  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FieldDefinition (K : Type u) extends RingDefinition K where

  inv : K → K

  mul_comm : ∀ a b : K, mul a b = mul b a

  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure FieldDefinition (K : Type u) extends RingDefinition K where

  inv : K → K

  mul_comm : ∀ a b : K, mul a b = mul b a

  inv_mul_cancel : ∀ a : K, a ≠ zero → mul (inv a) a = one

/--
`AlgebraicStructureDefinition` TODO

Predicate logic:

  structure AlgebraicStructureDefinition where

  Carrier : Type u

  structureData : Carrier → Prop

Predicate logic (unfolded):

  structure AlgebraicStructureDefinition where

  Carrier : Type u

  structureData : Carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AlgebraicStructureDefinition where

  Carrier : Type u

  structureData : Carrier → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure AlgebraicStructureDefinition where

  Carrier : Type u

  structureData : Carrier → Prop

end LRA.Algebra
