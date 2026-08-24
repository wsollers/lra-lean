import LRA.Operation.Laws.Identity.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/--
`LeftIdentity.apply` TODO

Predicate logic:

  (∀ element ∈ Carrier), operation identity element = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (element : Carrier), operation identity element = element) → ∀ (element : Carrier), operation identity element = element

Logical form (Lean):

```lean
theorem LeftIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : LeftIdentity operation identity)
    (element : Carrier) :
    operation identity element = element
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
theorem LeftIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : LeftIdentity operation identity)
    (element : Carrier) :
    operation identity element = element := by
  sorry

/--
`RightIdentity.apply` TODO

Predicate logic:

  (∀ element ∈ Carrier), operation element identity = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (element : Carrier), operation element identity = element) → ∀ (element : Carrier), operation element identity = element

Logical form (Lean):

```lean
theorem RightIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : RightIdentity operation identity)
    (element : Carrier) :
    operation element identity = element
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
theorem RightIdentity.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : RightIdentity operation identity)
    (element : Carrier) :
    operation element identity = element := by
  sorry

/--
`TwoSidedIdentity.left` TODO

Predicate logic:

  LeftIdentity operation identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (element : Carrier), operation identity element = element ∧ ∀ (element : Carrier), operation element identity = element) → ∀ (element : Carrier), operation identity element = element

Logical form (Lean):

```lean
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity
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
theorem TwoSidedIdentity.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    LeftIdentity operation identity := by
  sorry

/--
`TwoSidedIdentity.right` TODO

Predicate logic:

  RightIdentity operation identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (element : Carrier), operation identity element = element ∧ ∀ (element : Carrier), operation element identity = element) → ∀ (element : Carrier), operation element identity = element

Logical form (Lean):

```lean
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity
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
theorem TwoSidedIdentity.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (law : TwoSidedIdentity operation identity) :
    RightIdentity operation identity := by
  sorry

/--
`TwoSidedIdentity.of_left_right` TODO

Predicate logic:

  TwoSidedIdentity operation identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {identity : Carrier}, (∀ (element : Carrier), operation identity element = element ∧ ∀ (element : Carrier), operation element identity = element) → (∀ (element : Carrier), operation identity element = element ∧ ∀ (element : Carrier), operation element identity = element)

Logical form (Lean):

```lean
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity
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
theorem TwoSidedIdentity.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {identity : Carrier}
    (leftLaw : LeftIdentity operation identity)
    (rightLaw : RightIdentity operation identity) :
    TwoSidedIdentity operation identity := by
  sorry

end LRA.Operation.Laws.Identity
