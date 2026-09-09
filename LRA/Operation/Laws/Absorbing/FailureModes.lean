import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
`FailsRightAbsorbing` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (candidate : Carrier), LRA.Operation.Laws.Absorbing.RightAbsorbing operation candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Carrier), operation element candidate = candidate) → False

Logical form (Lean):

```lean
def FailsRightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightAbsorbing operation candidate)
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
def FailsRightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (RightAbsorbing operation candidate)

/--
`FailsLeftAbsorbing` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (candidate : Carrier), LRA.Operation.Laws.Absorbing.LeftAbsorbing operation candidate → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (element : Carrier), operation candidate element = candidate) → False

Logical form (Lean):

```lean
def FailsLeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftAbsorbing operation candidate)
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
def FailsLeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (candidate : Carrier) : Prop :=
  Not (LeftAbsorbing operation candidate)

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
`BooleanFirstProjectionLeftAbsorbingButNotRightAbsorbing` TODO

Predicate logic:

  (LRA.Operation.Laws.Absorbing.LeftAbsorbing LRA.Operation.Laws.Absorbing.BooleanFirstProjection Bool.false ∧ LRA.Operation.Laws.Absorbing.FailsRightAbsorbing LRA.Operation.Laws.Absorbing.BooleanFirstProjection Bool.false)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.false = Bool.false) ∧ ((∀ (element : Bool), element = Bool.false) → False))

Logical form (Lean):

```lean
theorem BooleanFirstProjectionLeftAbsorbingButNotRightAbsorbing :
    LeftAbsorbing BooleanFirstProjection false ∧
      FailsRightAbsorbing BooleanFirstProjection false
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
theorem BooleanFirstProjectionLeftAbsorbingButNotRightAbsorbing :
    LeftAbsorbing BooleanFirstProjection false ∧
      FailsRightAbsorbing BooleanFirstProjection false := by
  sorry
/--
`BooleanSecondProjectionRightAbsorbingButNotLeftAbsorbing` TODO

Predicate logic:

  (LRA.Operation.Laws.Absorbing.RightAbsorbing LRA.Operation.Laws.Absorbing.BooleanSecondProjection Bool.false ∧ LRA.Operation.Laws.Absorbing.FailsLeftAbsorbing LRA.Operation.Laws.Absorbing.BooleanSecondProjection Bool.false)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (element : Bool), Bool.false = Bool.false) ∧ ((∀ (element : Bool), element = Bool.false) → False))

Logical form (Lean):

```lean
theorem BooleanSecondProjectionRightAbsorbingButNotLeftAbsorbing :
    RightAbsorbing BooleanSecondProjection false ∧
      FailsLeftAbsorbing BooleanSecondProjection false
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
theorem BooleanSecondProjectionRightAbsorbingButNotLeftAbsorbing :
    RightAbsorbing BooleanSecondProjection false ∧
      FailsLeftAbsorbing BooleanSecondProjection false := by
  sorry
end LRA.Operation.Laws.Absorbing
