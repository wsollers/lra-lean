import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

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
def Distinct (left right : Carrier) : Prop :=
  ¬ Ident left right

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

Related proof moves: use, rcases, unfold

-/
def AtLeastTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∃ x y : Carrier, Distinct x y

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

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def AtMostTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ x y z : Carrier, Ident x y ∨ Ident y z ∨ Ident x z

/--
`DistinctIrreflexive` TODO

Predicate logic:

  (∀ x ∈ Carrier), ¬ Distinct x x

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x : Carrier
  Prove
    (x ≤ x → False) → False

Logical form (Lean):

```lean
theorem DistinctIrreflexive (x : Carrier) : ¬ Distinct x x
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
theorem DistinctIrreflexive (x : Carrier) : ¬ Distinct x x :=
  by sorry

/--
`DistinctSymmetric` TODO

Predicate logic:

  Distinct y x

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Distinct x y
  Prove
    ((x ≤ y → False) ∧ y ≤ x) → False

Logical form (Lean):

```lean
theorem DistinctSymmetric {x y : Carrier} (h : Distinct x y) : Distinct y x
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
theorem DistinctSymmetric {x y : Carrier} (h : Distinct x y) : Distinct y x :=
  by sorry

end LRA.Identity
