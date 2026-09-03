import LRA.Identity.Interface.Definitions

namespace LRA.Book.Identity

/--
`Ident` TODO

Predicate logic:

  abbrev Ident := LRA.Identity.Ident

Predicate logic (unfolded):

  abbrev Ident := LRA.Identity.Ident (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Ident := LRA.Identity.Ident
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
abbrev Ident := LRA.Identity.Ident
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
    left ≤ right → False

Logical form (Lean):

```lean
def Distinct {Carrier : Type u} [IdentityRelation Carrier] (left right : Carrier) : Prop :=
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
abbrev Distinct := LRA.Identity.Distinct
/--
`HasWitness` `HasWitness P` states that at least one element of `Carrier` satisfies `P`.

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

Related proof moves: unfold

-/
abbrev HasWitness := LRA.Identity.HasWitness
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

Related proof moves: unfold

-/
abbrev HasNoWitness := LRA.Identity.HasNoWitness
/--
`AtMostOne` `AtMostOne P` states that any two witnesses of `P` are identified by the active `IdentityRelation`.  It does not assert that a witness exists.

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

Related proof moves: unfold

-/
abbrev AtMostOne := LRA.Identity.AtMostOne
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

Related proof moves: unfold

-/
abbrev NotAtMostOne := LRA.Identity.NotAtMostOne
/--
`ExactlyOne` `ExactlyOne P` states that `P` has a witness and that all its witnesses are identified by the active `IdentityRelation`.  Use this identity-polymorphic notion when uniqueness should be expressed via `Ident`; use Lean's `ExistsAndUnique` when native equality is intended.

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

Related proof moves: unfold

-/
abbrev ExactlyOne := LRA.Identity.ExactlyOne
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
    Exists fun x => Exists fun y => x ≤ y → False

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

Related proof moves: unfold

-/
abbrev AtLeastTwo := LRA.Identity.AtLeastTwo
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
    Or (x ≤ y)(Or (y ≤ z)(x ≤ z))

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

Related proof moves: unfold

-/
abbrev AtMostTwo := LRA.Identity.AtMostTwo

end LRA.Book.Identity
