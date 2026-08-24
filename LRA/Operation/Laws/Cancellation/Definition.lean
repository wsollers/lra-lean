import LRA.Operation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
`LeftCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed first second,
    operation fixed first = operation fixed second -> first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed first second,
    operation fixed first = operation fixed second -> first = second

/--
`RightCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (first second fixed : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second fixed,
    operation first fixed = operation second fixed -> first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second fixed,
    operation first fixed = operation second fixed -> first = second

/--
`LeftRegular` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (fixed first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
def LeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation fixed first = operation fixed second -> first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation fixed first = operation fixed second -> first = second

/--
`RightRegular` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed first second : Carrier), operation first fixed = operation second fixed → first = second

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (fixed first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
def RightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation first fixed = operation second fixed -> first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation first fixed = operation second fixed -> first = second

/--
`LeftCancellativeOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed : Carrier), eligible fixed → LRA.Operation.Laws.Cancellation.LeftRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second

Logical form (Lean):

```lean
def LeftCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> LeftRegular operation fixed
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> LeftRegular operation fixed

/--
`RightCancellativeOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed : Carrier), eligible fixed → LRA.Operation.Laws.Cancellation.RightRegular operation fixed

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second

Logical form (Lean):

```lean
def RightCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> RightRegular operation fixed
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> RightRegular operation fixed

/--
`TwoSidedCancellativeOn` TODO

Predicate logic:

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Cancellation.LeftCancellativeOn eligible operation ∧ LRA.Operation.Laws.Cancellation.RightCancellativeOn eligible operation)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (eligible : Carrier → Prop) (operation : Carrier → Carrier → Carrier), (∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (fixed : Carrier), eligible fixed → ∀ (first second : Carrier), operation first fixed = operation second fixed → first = second)

Logical form (Lean):

```lean
def TwoSidedCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellativeOn eligible operation /\
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

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def TwoSidedCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellativeOn eligible operation /\
    RightCancellativeOn eligible operation

/--
`TwoSidedCancellative` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Cancellation.LeftCancellative operation ∧ LRA.Operation.Laws.Cancellation.RightCancellative operation)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier), (∀ (fixed first second : Carrier), operation fixed first = operation fixed second → first = second ∧ ∀ (first second fixed : Carrier), operation first fixed = operation second fixed → first = second)

Logical form (Lean):

```lean
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellative operation /\ RightCancellative operation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellative operation /\ RightCancellative operation

end LRA.Operation.Laws.Cancellation
