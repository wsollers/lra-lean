import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

/--
`LeftInverse.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse → ∀ (element : Carrier), operation (inverse element) element = identity

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
theorem LeftInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    operation (inverse element) element = identity
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
theorem LeftInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : LeftInverse operation identity inverse)
    (element : Carrier) :
    operation (inverse element) element = identity := by
  sorry
/--
`RightInverse.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.RightInverse operation identity inverse → ∀ (element : Carrier), operation element (inverse element) = identity

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
theorem RightInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    operation element (inverse element) = identity
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
theorem RightInverse.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : RightInverse operation identity inverse)
    (element : Carrier) :
    operation element (inverse element) = identity := by
  sorry
/--
`LeftInverseOf.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse → operation inverse element = identity

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    law : LeftInverseOf operation identity element inverse
  Prove
    operation inverse element = identity → operation inverse element = identity

Logical form (Lean):

```lean
theorem LeftInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : LeftInverseOf operation identity element inverse) :
    operation inverse element = identity
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
theorem LeftInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : LeftInverseOf operation identity element inverse) :
    operation inverse element = identity := by
  sorry
/--
`RightInverseOf.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse → operation element inverse = identity

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    law : RightInverseOf operation identity element inverse
  Prove
    operation element inverse = identity → operation element inverse = identity

Logical form (Lean):

```lean
theorem RightInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : RightInverseOf operation identity element inverse) :
    operation element inverse = identity
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
theorem RightInverseOf.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : RightInverseOf operation identity element inverse) :
    operation element inverse = identity := by
  sorry
/--
`TwoSidedInverseOf.left` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element inverse → LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    law : TwoSidedInverseOf operation identity element inverse
  Prove
    (operation inverse element = identity ∧ operation element inverse = identity) → operation inverse element = identity

Logical form (Lean):

```lean
theorem TwoSidedInverseOf.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
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
theorem TwoSidedInverseOf.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    LeftInverseOf operation identity element inverse := by
  sorry
/--
`TwoSidedInverseOf.right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element inverse → LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    law : TwoSidedInverseOf operation identity element inverse
  Prove
    (operation inverse element = identity ∧ operation element inverse = identity) → operation element inverse = identity

Logical form (Lean):

```lean
theorem TwoSidedInverseOf.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
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
theorem TwoSidedInverseOf.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (law : TwoSidedInverseOf operation identity element inverse) :
    RightInverseOf operation identity element inverse := by
  sorry
/--
`TwoSidedInverseOf.of_left_right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element inverse : Carrier}, (LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse ∧ LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse) → LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity element inverse : Carrier
    leftLaw : LeftInverseOf operation identity element inverse
    rightLaw : RightInverseOf operation identity element inverse
  Prove
    (operation inverse element = identity ∧ operation element inverse = identity) → (operation inverse element = identity ∧ operation element inverse = identity)

Logical form (Lean):

```lean
theorem TwoSidedInverseOf.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (leftLaw : LeftInverseOf operation identity element inverse)
    (rightLaw : RightInverseOf operation identity element inverse) :
    TwoSidedInverseOf operation identity element inverse
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
theorem TwoSidedInverseOf.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity element inverse : Carrier}
    (leftLaw : LeftInverseOf operation identity element inverse)
    (rightLaw : RightInverseOf operation identity element inverse) :
    TwoSidedInverseOf operation identity element inverse := by
  sorry
/--
`LeftInvertibleOn.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element : Carrier}, (LRA.Operation.Laws.Inverse.LeftInvertibleOn eligible operation identity ∧ eligible element) → Exists fun inverse => LRA.Operation.Laws.Inverse.LeftInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    eligible : Carrier → Prop
    operation : BinaryEndoOperation Carrier
    identity element : Carrier
    law : LeftInvertibleOn eligible operation identity
    eligible_element : eligible element
  Prove
    ((∀ (element : Carrier), eligible element → Exists fun inverse => operation inverse element = identity) ∧ eligible element) → Exists fun inverse => operation inverse element = identity

Logical form (Lean):

```lean
theorem LeftInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : LeftInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, LeftInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem LeftInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : LeftInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, LeftInverseOf operation identity element inverse := by
  sorry
/--
`RightInvertibleOn.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element : Carrier}, (LRA.Operation.Laws.Inverse.RightInvertibleOn eligible operation identity ∧ eligible element) → Exists fun inverse => LRA.Operation.Laws.Inverse.RightInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    eligible : Carrier → Prop
    operation : BinaryEndoOperation Carrier
    identity element : Carrier
    law : RightInvertibleOn eligible operation identity
    eligible_element : eligible element
  Prove
    ((∀ (element : Carrier), eligible element → Exists fun inverse => operation element inverse = identity) ∧ eligible element) → Exists fun inverse => operation element inverse = identity

Logical form (Lean):

```lean
theorem RightInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : RightInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, RightInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem RightInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : RightInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, RightInverseOf operation identity element inverse := by
  sorry
/--
`TwoSidedInvertibleOn.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity element : Carrier}, (LRA.Operation.Laws.Inverse.TwoSidedInvertibleOn eligible operation identity ∧ eligible element) → Exists fun inverse => LRA.Operation.Laws.Inverse.TwoSidedInverseOf operation identity element inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    eligible : Carrier → Prop
    operation : BinaryEndoOperation Carrier
    identity element : Carrier
    law : TwoSidedInvertibleOn eligible operation identity
    eligible_element : eligible element
  Prove
    ((∀ (element : Carrier), eligible element → Exists fun inverse => (operation inverse element = identity ∧ operation element inverse = identity)) ∧ eligible element) → Exists fun inverse => (operation inverse element = identity ∧ operation element inverse = identity)

Logical form (Lean):

```lean
theorem TwoSidedInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : TwoSidedInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, TwoSidedInverseOf operation identity element inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem TwoSidedInvertibleOn.apply {Carrier : Type u}
    {eligible : Carrier → Prop}
    {operation : BinaryEndoOperation Carrier}
    {identity element : Carrier}
    (law : TwoSidedInvertibleOn eligible operation identity)
    (eligible_element : eligible element) :
    ∃ inverse, TwoSidedInverseOf operation identity element inverse := by
  sorry
/--
`TwoSidedInverse.left` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse → LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    law : TwoSidedInverse operation identity inverse
  Prove
    ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → ∀ (element : Carrier), operation (inverse element) element = identity

Logical form (Lean):

```lean
theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
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
theorem TwoSidedInverse.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    LeftInverse operation identity inverse := by
  sorry
/--
`TwoSidedInverse.right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse → LRA.Operation.Laws.Inverse.RightInverse operation identity inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    law : TwoSidedInverse operation identity inverse
  Prove
    ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → ∀ (element : Carrier), operation element (inverse element) = identity

Logical form (Lean):

```lean
theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
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
theorem TwoSidedInverse.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (law : TwoSidedInverse operation identity inverse) :
    RightInverse operation identity inverse := by
  sorry
/--
`TwoSidedInverse.of_left_right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {identity : Carrier} {inverse : LRA.Operation.UnaryEndoOperation Carrier}, (LRA.Operation.Laws.Inverse.LeftInverse operation identity inverse ∧ LRA.Operation.Laws.Inverse.RightInverse operation identity inverse) → LRA.Operation.Laws.Inverse.TwoSidedInverse operation identity inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    identity : Carrier
    inverse : UnaryEndoOperation Carrier
    leftLaw : LeftInverse operation identity inverse
    rightLaw : RightInverse operation identity inverse
  Prove
    ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity)) → ((∀ (element : Carrier), operation (inverse element) element = identity) ∧ (∀ (element : Carrier), operation element (inverse element) = identity))

Logical form (Lean):

```lean
theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse
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
theorem TwoSidedInverse.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    {inverse : UnaryEndoOperation Carrier}
    (leftLaw : LeftInverse operation identity inverse)
    (rightLaw : RightInverse operation identity inverse) :
    TwoSidedInverse operation identity inverse := by
  sorry
end LRA.Operation.Laws.Inverse
