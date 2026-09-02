import LRA.Operation.Laws.Cancellation.Theorems
import LRA.Operation.Laws.Commutative.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
`Commutative.left_cancellative_to_right_cancellative` TODO

Predicate logic:

  RightCancellative operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem Commutative.left_cancellative_to_right_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftCancellative operation) :
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
theorem Commutative.left_cancellative_to_right_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftCancellative operation) :
    RightCancellative operation := by
  sorry
/--
`Commutative.right_cancellative_to_left_cancellative` TODO

Predicate logic:

  LeftCancellative operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), operation first second = operation second first ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem Commutative.right_cancellative_to_left_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightCancellative operation) :
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
theorem Commutative.right_cancellative_to_left_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightCancellative operation) :
    LeftCancellative operation := by
  sorry
/--
`LeftCancellative.left_regular` TODO

Predicate logic:

  (∀ fixed ∈ Carrier), LeftRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftCancellative.left_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed : Carrier) :
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

Related proof moves: TODO

-/
theorem LeftCancellative.left_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed : Carrier) :
    LeftRegular operation fixed := by
  sorry
/--
`RightCancellative.right_regular` TODO

Predicate logic:

  (∀ fixed ∈ Carrier), RightRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier}, (∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightCancellative.right_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (fixed : Carrier) :
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

Related proof moves: TODO

-/
theorem RightCancellative.right_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (fixed : Carrier) :
    RightRegular operation fixed := by
  sorry
/--
`LeftCancellative.to_left_cancellative_on` TODO

Predicate logic:

  LeftCancellativeOn eligible operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
theorem LeftCancellative.to_left_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation) :
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
theorem LeftCancellative.to_left_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation) :
    LeftCancellativeOn eligible operation := by
  sorry
/--
`RightCancellative.to_right_cancellative_on` TODO

Predicate logic:

  RightCancellativeOn eligible operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {eligible : Carrier → Prop} {operation : Carrier → Carrier → Carrier}, (∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
theorem RightCancellative.to_right_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation) :
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
theorem RightCancellative.to_right_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation) :
    RightCancellativeOn eligible operation := by
  sorry
/--
`LeftAbsorbing.not_left_regular_of_distinct` TODO

Predicate logic:

  Not (LeftRegular operation absorber)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {operation : Carrier → Carrier → Carrier} {absorber first second : Carrier}, (∀ (element : Carrier), operation absorber element = absorber ∧ (first = second → False ∧ ∀ (first second : Carrier), operation absorber first = operation absorber second → first = second)) → False

Logical form (Lean):

```lean
theorem LeftAbsorbing.not_left_regular_of_distinct {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber first second : Carrier}
    (absorbing :
      LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber)
    (distinct : first ≠ second) :
    Not (LeftRegular operation absorber)
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
theorem LeftAbsorbing.not_left_regular_of_distinct {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber first second : Carrier}
    (absorbing :
      LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber)
    (distinct : first ≠ second) :
    Not (LeftRegular operation absorber) := by
  sorry
end LRA.Operation.Laws.Cancellation
