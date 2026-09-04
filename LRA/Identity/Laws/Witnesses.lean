import LRA.Identity.Laws.Distinctness

namespace LRA.Identity

universe u

/--
`HasWitness` TODO

Predicate logic:

  ∀ {Carrier : Type u} (P : Carrier → Prop), Exists fun x => P x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => P x

Logical form (Lean):

```lean
def HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ∃ x, P x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ∃ x, P x

/--
`HasNoWitness` TODO

Predicate logic:

  ∀ {Carrier : Type u} (P : Carrier → Prop), (Exists fun x => P x) → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => P x) → False

Logical form (Lean):

```lean
def HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ¬ ∃ x, P x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ¬ ∃ x, P x

section NeedsIdentity

variable {Carrier : Type u} [IdentityRelation Carrier]

/--
`AtMostOne` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (P : Carrier → Prop) (left right : Carrier), (P left ∧ P right) → inst.Ident left right

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (P left ∧ P right) → left ≤ right

Logical form (Lean):

```lean
def AtMostOne (P : Carrier → Prop) : Prop :=
  ∀ left right, P left → P right → Ident left right
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
def AtMostOne (P : Carrier → Prop) : Prop :=
  ∀ left right, P left → P right → Ident left right

/--
`NotAtMostOne` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (P : Carrier → Prop), Exists fun left => Exists fun right => (P left ∧ (P right ∧ LRA.Identity.Distinct left right))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun left => Exists fun right => (P left ∧ (P right ∧ (left ≤ right → False)))

Logical form (Lean):

```lean
def NotAtMostOne (P : Carrier → Prop) : Prop :=
  ∃ left right, P left ∧ P right ∧ Distinct left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def NotAtMostOne (P : Carrier → Prop) : Prop :=
  ∃ left right, P left ∧ P right ∧ Distinct left right

/--
`ExactlyOne` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (P : Carrier → Prop), (LRA.Identity.HasWitness P ∧ LRA.Identity.AtMostOne P)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => P x ∧ (∀ (left right : Carrier), P left → P right → left ≤ right))

Logical form (Lean):

```lean
def ExactlyOne (P : Carrier → Prop) : Prop :=
  HasWitness P ∧ AtMostOne P
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
def ExactlyOne (P : Carrier → Prop) : Prop :=
  HasWitness P ∧ AtMostOne P

end NeedsIdentity

/--
`HasNoWitnessNotHasWitness` TODO

Predicate logic:

  (HasNoWitness P) → ¬ HasWitness P

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    P : Carrier → Prop
  Prove
    (((Exists fun x => P x) → False) ∧ Exists fun x => P x) → False

Logical form (Lean):

```lean
theorem HasNoWitnessNotHasWitness {Carrier : Type u} {P : Carrier → Prop}
    (h : HasNoWitness P) : ¬ HasWitness P
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
theorem HasNoWitnessNotHasWitness {Carrier : Type u} {P : Carrier → Prop}
    (h : HasNoWitness P) : ¬ HasWitness P :=
  by sorry

/--
`ExactlyOneNotAtLeastTwoWitnesses` TODO

Predicate logic:

  ¬ NotAtMostOne P

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    P : Carrier → Prop
    h : ExactlyOne P
  Prove
    ((Exists fun x => P x ∧ (∀ (left right : Carrier), P left → P right → left ≤ right)) ∧ (Exists fun left => Exists fun right => (P left ∧ (P right ∧ (left ≤ right → False))))) → False

Logical form (Lean):

```lean
theorem ExactlyOneNotAtLeastTwoWitnesses {Carrier : Type u} [IdentityRelation Carrier]
    {P : Carrier → Prop} (h : ExactlyOne P) : ¬ NotAtMostOne P
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
theorem ExactlyOneNotAtLeastTwoWitnesses {Carrier : Type u} [IdentityRelation Carrier]
    {P : Carrier → Prop} (h : ExactlyOne P) : ¬ NotAtMostOne P :=
  by sorry

end LRA.Identity
