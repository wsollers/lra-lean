import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
`FailsLeftCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Cancellation.LeftCancellative operation → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier), (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second) → False

Logical form (Lean):

```lean
def FailsLeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftCancellative operation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftCancellative operation)

/--
`FailsRightCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), LRA.Operation.Laws.Cancellation.RightCancellative operation → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier), (∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second) → False

Logical form (Lean):

```lean
def FailsRightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (RightCancellative operation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsRightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (RightCancellative operation)

/--
`NaturalMultiplication` TODO

Predicate logic:

  def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right

Predicate logic (unfolded):

  def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
`NaturalMultiplicationFailsLeftCancellative` TODO

Predicate logic:

  FailsLeftCancellative NaturalMultiplication

Predicate logic (unfolded):

  (∀ (fixed first second : Nat), instHMul.1 fixed first = instHMul.1 fixed second → first = second) → False

Logical form (Lean):

```lean
theorem NaturalMultiplicationFailsLeftCancellative :
    FailsLeftCancellative NaturalMultiplication
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
theorem NaturalMultiplicationFailsLeftCancellative :
    FailsLeftCancellative NaturalMultiplication := by
  sorry

/--
`NaturalMultiplicationFailsRightCancellative` TODO

Predicate logic:

  FailsRightCancellative NaturalMultiplication

Predicate logic (unfolded):

  (∀ (first second fixed : Nat), instHMul.1 first fixed = instHMul.1 second fixed → first = second) → False

Logical form (Lean):

```lean
theorem NaturalMultiplicationFailsRightCancellative :
    FailsRightCancellative NaturalMultiplication
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
theorem NaturalMultiplicationFailsRightCancellative :
    FailsRightCancellative NaturalMultiplication := by
  sorry

/--
`FailsLeftRegular` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed : Carrier), LRA.Operation.Laws.Cancellation.LeftRegular operation fixed → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (fixed : Carrier), (∀ (first second : Carrier), operation fixed first = operation fixed second → first = second) → False

Logical form (Lean):

```lean
def FailsLeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (LeftRegular operation fixed)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsLeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (LeftRegular operation fixed)

/--
`FailsRightRegular` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed : Carrier), LRA.Operation.Laws.Cancellation.RightRegular operation fixed → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (fixed : Carrier), (∀ (first second : Carrier), operation first fixed = operation second fixed → first = second) → False

Logical form (Lean):

```lean
def FailsRightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (RightRegular operation fixed)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def FailsRightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (RightRegular operation fixed)

/--
`NaturalZeroFailsLeftRegularUnderMultiplication` TODO

Predicate logic:

  FailsLeftRegular NaturalMultiplication 0

Predicate logic (unfolded):

  (∀ (first second : Nat), instHMul.1 (instOfNatNat 0).1 first = instHMul.1 (instOfNatNat 0).1 second → first = second) → False

Logical form (Lean):

```lean
theorem NaturalZeroFailsLeftRegularUnderMultiplication :
    FailsLeftRegular NaturalMultiplication 0
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
theorem NaturalZeroFailsLeftRegularUnderMultiplication :
    FailsLeftRegular NaturalMultiplication 0 := by
  sorry

/--
`NaturalZeroFailsRightRegularUnderMultiplication` TODO

Predicate logic:

  FailsRightRegular NaturalMultiplication 0

Predicate logic (unfolded):

  (∀ (first second : Nat), instHMul.1 first (instOfNatNat 0).1 = instHMul.1 second (instOfNatNat 0).1 → first = second) → False

Logical form (Lean):

```lean
theorem NaturalZeroFailsRightRegularUnderMultiplication :
    FailsRightRegular NaturalMultiplication 0
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
theorem NaturalZeroFailsRightRegularUnderMultiplication :
    FailsRightRegular NaturalMultiplication 0 := by
  sorry

end LRA.Operation.Laws.Cancellation
