import Mathlib.Algebra.Module.Basic

namespace LRA.LinearAlgebra

universe u v

/--
`VectorSpaceDefinition` TODO

Predicate logic:

  structure VectorSpaceDefinition (K : Type u) [Field K] (V : Type v) where

  zero : V

  add : V → V → V

  neg : V → V

  smul : K → V → V

  add_assoc : ∀ x y z : V, add (add x y) z = add x (add y z)

  add_comm : ∀ x y : V, add x y = add y x

  zero_add : ∀ x : V, add zero x = x

  add_left_neg : ∀ x : V, add (neg x) x = zero

  mul_smul : ∀ a b : K, ∀ x : V, smul (a * b) x = smul a (smul b x)

  one_smul : ∀ x : V, smul 1 x = x

  smul_add : ∀ a : K, ∀ x y : V, smul a (add x y) = add (smul a x) (smul a y)

  add_smul : ∀ a b : K, ∀ x : V, smul (a + b) x = add (smul a x) (smul b x)

Predicate logic (unfolded):

  structure VectorSpaceDefinition (K : Type u) [Field K] (V : Type v) where

  zero : V

  add : V → V → V

  neg : V → V

  smul : K → V → V

  add_assoc : ∀ x y z : V, add (add x y) z = add x (add y z)

  add_comm : ∀ x y : V, add x y = add y x

  zero_add : ∀ x : V, add zero x = x

  add_left_neg : ∀ x : V, add (neg x) x = zero

  mul_smul : ∀ a b : K, ∀ x : V, smul (a * b) x = smul a (smul b x)

  one_smul : ∀ x : V, smul 1 x = x

  smul_add : ∀ a : K, ∀ x y : V, smul a (add x y) = add (smul a x) (smul a y)

  add_smul : ∀ a b : K, ∀ x : V, smul (a + b) x = add (smul a x) (smul b x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure VectorSpaceDefinition (K : Type u) [Field K] (V : Type v) where

  zero : V

  add : V → V → V

  neg : V → V

  smul : K → V → V

  add_assoc : ∀ x y z : V, add (add x y) z = add x (add y z)

  add_comm : ∀ x y : V, add x y = add y x

  zero_add : ∀ x : V, add zero x = x

  add_left_neg : ∀ x : V, add (neg x) x = zero

  mul_smul : ∀ a b : K, ∀ x : V, smul (a * b) x = smul a (smul b x)

  one_smul : ∀ x : V, smul 1 x = x

  smul_add : ∀ a : K, ∀ x y : V, smul a (add x y) = add (smul a x) (smul a y)

  add_smul : ∀ a b : K, ∀ x : V, smul (a + b) x = add (smul a x) (smul b x)
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
structure VectorSpaceDefinition (K : Type u) [Field K] (V : Type v) where

  zero : V

  add : V → V → V

  neg : V → V

  smul : K → V → V

  add_assoc : ∀ x y z : V, add (add x y) z = add x (add y z)

  add_comm : ∀ x y : V, add x y = add y x

  zero_add : ∀ x : V, add zero x = x

  add_left_neg : ∀ x : V, add (neg x) x = zero

  mul_smul : ∀ a b : K, ∀ x : V, smul (a * b) x = smul a (smul b x)

  one_smul : ∀ x : V, smul 1 x = x

  smul_add : ∀ a : K, ∀ x y : V, smul a (add x y) = add (smul a x) (smul a y)

  add_smul : ∀ a b : K, ∀ x : V, smul (a + b) x = add (smul a x) (smul b x)

/--
`VectorSpacePackagedDefinition` TODO

Predicate logic:

  structure VectorSpacePackagedDefinition where

  Scalar : Type u

  field : Field Scalar

  Carrier : Type v

  vectorSpace : @VectorSpaceDefinition Scalar field Carrier

Predicate logic (unfolded):

  structure VectorSpacePackagedDefinition where

  Scalar : Type u

  field : Field Scalar

  Carrier : Type v

  vectorSpace : @VectorSpaceDefinition Scalar field Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure VectorSpacePackagedDefinition where

  Scalar : Type u

  field : Field Scalar

  Carrier : Type v

  vectorSpace : @VectorSpaceDefinition Scalar field Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure VectorSpacePackagedDefinition where

  Scalar : Type u

  field : Field Scalar

  Carrier : Type v

  vectorSpace : @VectorSpaceDefinition Scalar field Carrier

end LRA.LinearAlgebra
