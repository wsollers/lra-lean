import LRA.Operation.Laws.Commutative.Theorems
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/--
`Commutative.left_identity_to_right_identity` TODO

Predicate logic:

  LRA.Operation.Laws.Identity.RightIdentity operation identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (element : Carrier), operation identity element = element) → ∀ (element : Carrier), operation element identity = element

Logical form (Lean):

```lean
theorem Commutative.left_identity_to_right_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity) :
    LRA.Operation.Laws.Identity.RightIdentity operation identity
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
theorem Commutative.left_identity_to_right_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity) :
    LRA.Operation.Laws.Identity.RightIdentity operation identity := by
  sorry

/--
`Commutative.right_identity_to_left_identity` TODO

Predicate logic:

  LRA.Operation.Laws.Identity.LeftIdentity operation identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (element : Carrier), operation element identity = element) → ∀ (element : Carrier), operation identity element = element

Logical form (Lean):

```lean
theorem Commutative.right_identity_to_left_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity) :
    LRA.Operation.Laws.Identity.LeftIdentity operation identity
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
theorem Commutative.right_identity_to_left_identity {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (commutative : Commutative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity) :
    LRA.Operation.Laws.Identity.LeftIdentity operation identity := by
  sorry

/--
`Commutative.left_absorbing_to_right_absorbing` TODO

Predicate logic:

  LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {absorber : Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (element : Carrier), operation absorber element = absorber) → ∀ (element : Carrier), operation element absorber = absorber

Logical form (Lean):

```lean
theorem Commutative.left_absorbing_to_right_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (leftAbsorbing : LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber
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
theorem Commutative.left_absorbing_to_right_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (leftAbsorbing : LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber := by
  sorry

/--
`Commutative.right_absorbing_to_left_absorbing` TODO

Predicate logic:

  LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {absorber : Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (element : Carrier), operation element absorber = absorber) → ∀ (element : Carrier), operation absorber element = absorber

Logical form (Lean):

```lean
theorem Commutative.right_absorbing_to_left_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (rightAbsorbing : LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber
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
theorem Commutative.right_absorbing_to_left_absorbing {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (commutative : Commutative operation)
    (rightAbsorbing : LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber) :
    LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber := by
  sorry

end LRA.Operation.Laws.Commutative
