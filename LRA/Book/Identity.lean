import LRA.Identity.Laws

namespace LRA.Book.Identity

universe u

/--
`Ident` TODO

Predicate logic:

  abbrev Ident {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
      (left right : Carrier) : Prop :=
    LRA.Identity.Ident left right

Predicate logic (unfolded):

  abbrev Ident {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
      (left right : Carrier) : Prop :=
    LRA.Identity.Ident left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Ident {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (left right : Carrier) : Prop :=
  LRA.Identity.Ident left right
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
abbrev Ident {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (left right : Carrier) : Prop :=
  LRA.Identity.Ident left right
/--
`Distinct` TODO

Predicate logic:

  ∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] (left right : Carrier), inst.Ident left right → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.Ident left right → False

Logical form (Lean):

```lean
def Distinct (left right : Carrier) : Prop :=
  ¬ Ident left right
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
abbrev Distinct {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (left right : Carrier) : Prop :=
  LRA.Identity.Distinct left right
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
abbrev HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  LRA.Identity.HasWitness P
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
abbrev HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  LRA.Identity.HasNoWitness P
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
    (P left ∧ P right) → inst.Ident left right

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
abbrev AtMostOne {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (P : Carrier → Prop) : Prop :=
  LRA.Identity.AtMostOne P
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
    Exists fun left => Exists fun right => (P left ∧ (P right ∧ (inst.Ident left right → False)))

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
abbrev NotAtMostOne {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (P : Carrier → Prop) : Prop :=
  LRA.Identity.NotAtMostOne P
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
    (Exists fun x => P x ∧ (∀ (left right : Carrier), P left → P right → inst.Ident left right))

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
abbrev ExactlyOne {Carrier : Type u} [LRA.Identity.IdentityRelation Carrier]
    (P : Carrier → Prop) : Prop :=
  LRA.Identity.ExactlyOne P
/--
`AtLeastTwo` TODO

Predicate logic:

  ∀ (Carrier : Type u) [inst : LRA.Identity.IdentityRelation Carrier], Exists fun x => Exists fun y => LRA.Identity.Distinct x y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => Exists fun y => inst.Ident x y → False

Logical form (Lean):

```lean
def AtLeastTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∃ x y : Carrier, Distinct x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
abbrev AtLeastTwo (Carrier : Type u) [LRA.Identity.IdentityRelation Carrier] : Prop :=
  LRA.Identity.AtLeastTwo Carrier
/--
`AtMostTwo` TODO

Predicate logic:

  ∀ (Carrier : Type u) [inst : LRA.Identity.IdentityRelation Carrier] (x y z : Carrier), Or (inst.Ident x y) (Or (inst.Ident y z) (inst.Ident x z))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (inst.Ident x y) (Or (inst.Ident y z) (inst.Ident x z))

Logical form (Lean):

```lean
def AtMostTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ x y z : Carrier, Ident x y ∨ Ident y z ∨ Ident x z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
abbrev AtMostTwo (Carrier : Type u) [LRA.Identity.IdentityRelation Carrier] : Prop :=
  LRA.Identity.AtMostTwo Carrier

end LRA.Book.Identity
