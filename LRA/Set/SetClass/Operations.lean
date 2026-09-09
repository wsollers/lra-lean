import LRA.Set.SetClass.Definition

namespace LRA.Set

universe u

namespace SetClass

variable {α : Type u}

/--
`Empty` TODO

Predicate logic:

  ∀ {α : Type u} (a : α), False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    False

Logical form (Lean):

```lean
def Empty : SetClass α := fun _ => False
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
def Empty : SetClass α := fun _ => False

/--
`Universal` TODO

Predicate logic:

  ∀ {α : Type u} (a : α), True

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    True

Logical form (Lean):

```lean
def Universal : SetClass α := fun _ => True
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
def Universal : SetClass α := fun _ => True

/--
`Union` TODO

Predicate logic:

  ∀ {α : Type u} (left right : LRA.Set.SetClass α) (a : α), Or (left a) (right a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (left a) (right a)

Logical form (Lean):

```lean
def Union (left right : SetClass α) : SetClass α :=
  fun element => left element ∨ right element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def Union (left right : SetClass α) : SetClass α :=
  fun element => left element ∨ right element

/--
`Intersection` TODO

Predicate logic:

  ∀ {α : Type u} (left right : LRA.Set.SetClass α) (a : α), (left a ∧ right a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (left a ∧ right a)

Logical form (Lean):

```lean
def Intersection (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ right element
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
def Intersection (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ right element

/--
`Difference` TODO

Predicate logic:

  ∀ {α : Type u} (left right : LRA.Set.SetClass α) (a : α), (left a ∧ ¬ right a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (left a ∧ (right a → False))

Logical form (Lean):

```lean
def Difference (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ ¬ right element
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
def Difference (left right : SetClass α) : SetClass α :=
  fun element => left element ∧ ¬ right element

/--
`Complement` TODO

Predicate logic:

  ∀ {α : Type u} (setClass : LRA.Set.SetClass α) (a : α), setClass a → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    setClass a → False

Logical form (Lean):

```lean
def Complement (setClass : SetClass α) : SetClass α :=
  fun element => ¬ setClass element
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
def Complement (setClass : SetClass α) : SetClass α :=
  fun element => ¬ setClass element

/--
`Included` TODO

Predicate logic:

  ∀ {α : Type u} (left right : LRA.Set.SetClass α) (element : α), left element → right element

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    left element → right element

Logical form (Lean):

```lean
def Included (left right : SetClass α) : Prop :=
  ∀ element, left element → right element
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
def Included (left right : SetClass α) : Prop :=
  ∀ element, left element → right element

end SetClass

end LRA.Set
