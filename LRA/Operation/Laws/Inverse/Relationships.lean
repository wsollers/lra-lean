import LRA.Operation.Laws.Inverse.Theorems
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Cancellation.Definition
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
`LeftInverseEqualsRightInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element leftCandidate rightCandidate : Carrier}, (LRA.Operation.Laws.Associative.Associative operation ∧ (LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity ∧ (operation leftCandidate element = identity ∧ operation element rightCandidate = identity))) → leftCandidate = rightCandidate

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element leftCandidate rightCandidate : Carrier
    associative : LRA.Operation.Laws.Associative.Associative operation
    identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity
  Prove
    ((∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) ∧ (((∀ (element : Carrier), operation identity element = element) ∧ (∀ (element : Carrier), operation element identity = element)) ∧ (operation leftCandidate element = identity ∧ operation element rightCandidate = identity))) → leftCandidate = rightCandidate

Logical form (Lean):

```lean
theorem LeftInverseEqualsRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element leftCandidate rightCandidate : Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (leftInverseLaw : operation leftCandidate element = identity)
    (rightInverseLaw : operation element rightCandidate = identity) :
    leftCandidate = rightCandidate
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
theorem LeftInverseEqualsRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element leftCandidate rightCandidate : Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (leftInverseLaw : operation leftCandidate element = identity)
    (rightInverseLaw : operation element rightCandidate = identity) :
    leftCandidate = rightCandidate := by
  sorry
/--
`TwoSidedInverseUnique` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {firstInverse secondInverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Associative.Associative operation ∧ (LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity ∧ (LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity firstInverse ∧ LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity secondInverse))) → firstInverse = secondInverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    firstInverse secondInverse : UnaryEndoOperation Carrier
    associative : LRA.Operation.Laws.Associative.Associative operation
    identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity
    firstLaw : TwoSidedInverse operation identity firstInverse
    secondLaw : TwoSidedInverse operation identity secondInverse
  Prove
    ((∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) ∧ (((∀ (element : Carrier), operation identity element = element) ∧ (∀ (element : Carrier), operation element identity = element)) ∧ (((∀ (element : Carrier), operation (firstInverse element) element = identity) ∧ (∀ (element : Carrier), operation element (firstInverse element) = identity)) ∧ ((∀ (element : Carrier), operation (secondInverse element) element = identity) ∧ (∀ (element : Carrier), operation element (secondInverse element) = identity))))) → firstInverse = secondInverse

Logical form (Lean):

```lean
theorem TwoSidedInverseUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {firstInverse secondInverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (firstLaw : TwoSidedInverse operation identity firstInverse)
    (secondLaw : TwoSidedInverse operation identity secondInverse) :
    firstInverse = secondInverse
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
theorem TwoSidedInverseUnique {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {firstInverse secondInverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (identityLaw : LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity)
    (firstLaw : TwoSidedInverse operation identity firstInverse)
    (secondLaw : TwoSidedInverse operation identity secondInverse) :
    firstInverse = secondInverse := by
  sorry
/--
`LeftCancellativeOfLeftInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Associative.Associative operation ∧ (LRA.Operation.Laws.Identity.LeftIdentity operation identity ∧ LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse)) → LRA.Operation.Laws.Cancellation.LeftCancellative operation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    associative : LRA.Operation.Laws.Associative.Associative operation
    leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity
    leftInverse : LeftInverse operation identity inverse
  Prove
    ((∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) ∧ ((∀ (element : Carrier), operation identity element = element) ∧ (∀ (element : Carrier), operation (inverse element) element = identity))) → ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftCancellativeOfLeftInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity)
    (leftInverse : LeftInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.LeftCancellative operation
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
theorem LeftCancellativeOfLeftInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (leftIdentity : LRA.Operation.Laws.Identity.LeftIdentity operation identity)
    (leftInverse : LeftInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.LeftCancellative operation := by
  sorry
/--
`RightCancellativeOfRightInverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Associative.Associative operation ∧ (LRA.Operation.Laws.Identity.RightIdentity operation identity ∧ LRA.Operation.Laws.Inverse.RightInverse operation identity inverse)) → LRA.Operation.Laws.Cancellation.RightCancellative operation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    associative : LRA.Operation.Laws.Associative.Associative operation
    rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity
    rightInverse : RightInverse operation identity inverse
  Prove
    ((∀ (first second third : Carrier), operation (operation first second) third = operation first (operation second third)) ∧ ((∀ (element : Carrier), operation element identity = element) ∧ (∀ (element : Carrier), operation element (inverse element) = identity))) → ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightCancellativeOfRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity)
    (rightInverse : RightInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.RightCancellative operation
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
theorem RightCancellativeOfRightInverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (associative : LRA.Operation.Laws.Associative.Associative operation)
    (rightIdentity : LRA.Operation.Laws.Identity.RightIdentity operation identity)
    (rightInverse : RightInverse operation identity inverse) :
    LRA.Operation.Laws.Cancellation.RightCancellative operation := by
  sorry
/--
`LeftInverse.to_left_inverse_of` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse → ∀ (element : Carrier), LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element (inverse element)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    law : LeftInverse operation identity inverse
    element : Carrier
  Prove
    (∀ (element : Carrier), operation (inverse element) element = identity) → ∀ (element : Carrier), operation (inverse element) element = identity

Logical form (Lean):

```lean
theorem LeftInverse.to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    LeftInverseOf operation identity element (inverse element)
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
theorem LeftInverse.to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    LeftInverseOf operation identity element (inverse element) := by
  sorry
/--
`RightInverse.to_right_inverse_of` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.RightInverse operation identity inverse → ∀ (element : Carrier), LRA.Operation.Laws.Inverse.RightInverseOf operation identity element (inverse element)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    law : RightInverse operation identity inverse
    element : Carrier
  Prove
    (∀ (element : Carrier), operation element (inverse element) = identity) → ∀ (element : Carrier), operation element (inverse element) = identity

Logical form (Lean):

```lean
theorem RightInverse.to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    RightInverseOf operation identity element (inverse element)
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
theorem RightInverse.to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    RightInverseOf operation identity element (inverse element) := by
  sorry
/--
`TwoSidedInverse.to_two_sided_inverse_of` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse → ∀ (element : Carrier), LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element (inverse element)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    law : TwoSidedInverse operation identity inverse
    element : Carrier
  Prove
    ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → ∀ (element : Carrier), (operation (inverse element) element = identity ∧ operation element (inverse element) = identity)

Logical form (Lean):

```lean
theorem TwoSidedInverse.to_two_sided_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse)
    (element : Carrier) :
    TwoSidedInverseOf operation identity element (inverse element)
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
theorem TwoSidedInverse.to_two_sided_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse)
    (element : Carrier) :
    TwoSidedInverseOf operation identity element (inverse element) := by
  sorry
/--
`Commutative.left_inverse_of_to_right_inverse_of` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse) → LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    leftLaw : LeftInverseOf operation identity element inverse
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ operation inverse element = identity) → operation element inverse = identity

Logical form (Lean):

```lean
theorem Commutative.left_inverse_of_to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse
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
theorem Commutative.left_inverse_of_to_right_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry
/--
`Commutative.right_inverse_of_to_left_inverse_of` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse) → LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    rightLaw : RightInverseOf operation identity element inverse
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ operation element inverse = identity) → operation inverse element = identity

Logical form (Lean):

```lean
theorem Commutative.right_inverse_of_to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse
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
theorem Commutative.right_inverse_of_to_left_inverse_of {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry
/--
`Commutative.left_inverse_to_right_inverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse) → LRA.Operation.Laws.Inverse.RightInverse operation identity inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    leftLaw : LeftInverse operation identity inverse
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ (∀ (element : Carrier), operation (inverse element) element = identity)) → ∀ (element : Carrier), operation element (inverse element) = identity

Logical form (Lean):

```lean
theorem Commutative.left_inverse_to_right_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverse operation identity inverse) :
    RightInverse operation identity inverse
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
theorem Commutative.left_inverse_to_right_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry
/--
`Commutative.right_inverse_to_left_inverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Operation.Laws.Inverse.RightInverse operation identity inverse) → LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    rightLaw : RightInverse operation identity inverse
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → ∀ (element : Carrier), operation (inverse element) element = identity

Logical form (Lean):

```lean
theorem Commutative.right_inverse_to_left_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverse operation identity inverse) :
    LeftInverse operation identity inverse
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
theorem Commutative.right_inverse_to_left_inverse {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (commutative : LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry
end LRA.Operation.Laws.Inverse
