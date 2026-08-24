import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
`LeftCancellative.apply` TODO

Predicate logic:

  (∀ fixed first second ∈ Carrier), (operation fixed first = operation fixed second) → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second
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
theorem LeftCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry

/--
`RightCancellative.apply` TODO

Predicate logic:

  (∀ first second fixed ∈ Carrier), (operation first fixed = operation second fixed) → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (first second fixed : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second
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
theorem RightCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (first second fixed : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry

/--
`LeftRegular.apply` TODO

Predicate logic:

  (∀ first second ∈ Carrier), (operation fixed first = operation fixed second) → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {fixed : Carrier}, (∀ (first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : LeftRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second
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
theorem LeftRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : LeftRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry

/--
`RightRegular.apply` TODO

Predicate logic:

  (∀ first second ∈ Carrier), (operation first fixed = operation second fixed) → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {fixed : Carrier}, (∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : RightRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second
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
theorem RightRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : RightRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry

/--
`LeftCancellativeOn.apply` TODO

Predicate logic:

  (∀ fixed ∈ Carrier), LeftRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    LeftRegular operation fixed
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
theorem LeftCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    LeftRegular operation fixed := by
  sorry

/--
`RightCancellativeOn.apply` TODO

Predicate logic:

  (∀ fixed ∈ Carrier), RightRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    RightRegular operation fixed
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
theorem RightCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    RightRegular operation fixed := by
  sorry

/--
`TwoSidedCancellativeOn.left` TODO

Predicate logic:

  LeftCancellativeOn eligible operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem TwoSidedCancellativeOn.left {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    LeftCancellativeOn eligible operation
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
theorem TwoSidedCancellativeOn.left {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    LeftCancellativeOn eligible operation := by
  sorry

/--
`TwoSidedCancellativeOn.right` TODO

Predicate logic:

  RightCancellativeOn eligible operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem TwoSidedCancellativeOn.right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    RightCancellativeOn eligible operation
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
theorem TwoSidedCancellativeOn.right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    RightCancellativeOn eligible operation := by
  sorry

/--
`TwoSidedCancellativeOn.of_left_right` TODO

Predicate logic:

  TwoSidedCancellativeOn eligible operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second)

Logical form (Lean):

```lean
theorem TwoSidedCancellativeOn.of_left_right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellativeOn eligible operation)
    (rightLaw : RightCancellativeOn eligible operation) :
    TwoSidedCancellativeOn eligible operation
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
theorem TwoSidedCancellativeOn.of_left_right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellativeOn eligible operation)
    (rightLaw : RightCancellativeOn eligible operation) :
    TwoSidedCancellativeOn eligible operation := by
  sorry

/--
`TwoSidedCancellative.left` TODO

Predicate logic:

  LeftCancellative operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem TwoSidedCancellative.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    LeftCancellative operation
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
theorem TwoSidedCancellative.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    LeftCancellative operation := by
  sorry

/--
`TwoSidedCancellative.right` TODO

Predicate logic:

  RightCancellative operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem TwoSidedCancellative.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    RightCancellative operation
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
theorem TwoSidedCancellative.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    RightCancellative operation := by
  sorry

/--
`TwoSidedCancellative.of_left_right` TODO

Predicate logic:

  TwoSidedCancellative operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second)

Logical form (Lean):

```lean
theorem TwoSidedCancellative.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellative operation)
    (rightLaw : RightCancellative operation) :
    TwoSidedCancellative operation
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
theorem TwoSidedCancellative.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellative operation)
    (rightLaw : RightCancellative operation) :
    TwoSidedCancellative operation := by
  sorry

end LRA.Operation.Laws.Cancellation
