import LRA.Operation.Laws.Identity.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/--
`FailsRightIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (candidate : Carrier), LRA.Operation.Laws.Identity.RightIdentity operation candidate → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (candidate : Carrier), (∀ (element : Carrier), operation element candidate = element) → False

Logical form (Lean):

```lean
def FailsRightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightIdentity operation candidate)
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
def FailsRightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightIdentity operation candidate)

/--
`FailsLeftIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (candidate : Carrier), LRA.Operation.Laws.Identity.LeftIdentity operation candidate → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (candidate : Carrier), (∀ (element : Carrier), operation candidate element = element) → False

Logical form (Lean):

```lean
def FailsLeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftIdentity operation candidate)
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
def FailsLeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftIdentity operation candidate)

/--
`BooleanSecondProjection` TODO

Predicate logic:

  def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

Predicate logic (unfolded):

  def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right
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
def BooleanSecondProjection : BinaryEndoOperation Bool :=
  fun _ right => right

/--
`BooleanFirstProjection` TODO

Predicate logic:

  def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

Predicate logic (unfolded):

  def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left
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
def BooleanFirstProjection : BinaryEndoOperation Bool :=
  fun left _ => left

/--
`BooleanSecondProjectionLeftIdentityButNotRightIdentity` TODO

Predicate logic:

  LeftIdentity BooleanSecondProjection false ∧ FailsRightIdentity BooleanSecondProjection false

Predicate logic (unfolded):

  (∀ (element : Bool), element = element ∧ (∀ (element : Bool), Bool.false = element) → False)

Logical form (Lean):

```lean
theorem BooleanSecondProjectionLeftIdentityButNotRightIdentity :
    LeftIdentity BooleanSecondProjection false ∧
      FailsRightIdentity BooleanSecondProjection false
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BooleanSecondProjectionLeftIdentityButNotRightIdentity :
    LeftIdentity BooleanSecondProjection false ∧
      FailsRightIdentity BooleanSecondProjection false := by
  sorry

/--
`BooleanFirstProjectionRightIdentityButNotLeftIdentity` TODO

Predicate logic:

  RightIdentity BooleanFirstProjection false ∧ FailsLeftIdentity BooleanFirstProjection false

Predicate logic (unfolded):

  (∀ (element : Bool), element = element ∧ (∀ (element : Bool), Bool.false = element) → False)

Logical form (Lean):

```lean
theorem BooleanFirstProjectionRightIdentityButNotLeftIdentity :
    RightIdentity BooleanFirstProjection false ∧
      FailsLeftIdentity BooleanFirstProjection false
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem BooleanFirstProjectionRightIdentityButNotLeftIdentity :
    RightIdentity BooleanFirstProjection false ∧
      FailsLeftIdentity BooleanFirstProjection false := by
  sorry

end LRA.Operation.Laws.Identity
