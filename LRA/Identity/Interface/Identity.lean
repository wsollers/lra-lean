namespace LRA.Identity

universe u

/--
`IdentityTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {Admissible : (Carrier → Prop) → Prop} {R : Carrier → Carrier → Prop}, ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), Admissible P → P x → P y))

Logical form (Lean):

```lean
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y
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
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y →
    ∀ P : Carrier → Prop, Admissible P → P x → P y

/--
`FullLeibniz` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a : Carrier → Prop), True

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (a : Carrier → Prop), True

Logical form (Lean):

```lean
abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop :=
  fun _ => True
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
abbrev FullLeibniz (Carrier : Type u) : (Carrier → Prop) → Prop :=
  fun _ => True

/--
`IdentityRelation` TODO

Predicate logic:

  class IdentityRelation (Carrier : Type u) where
    Ident : Carrier → Carrier → Prop
    IdentReflexive : ∀ x : Carrier, Ident x x
    IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
      ∀ Property : Carrier → Prop, Property x → Property y

Predicate logic (unfolded):

  class IdentityRelation (Carrier : Type u) where
    Ident : Carrier → Carrier → Prop
    IdentReflexive : ∀ x : Carrier, Ident x x
    IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
      ∀ Property : Carrier → Prop, Property x → Property y

Logical form (Lean):

```lean
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y
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
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y

export IdentityRelation (Ident IdentReflexive IdentLeibniz)

/--
`IsIdentityRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (R : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (R : Carrier → Carrier → Prop), ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
abbrev IsIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory (FullLeibniz Carrier) R
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
abbrev IsIdentityRelation {Carrier : Type u}
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory (FullLeibniz Carrier) R

/--
`IdentityRelation.ofIdentityTheory` TODO

Predicate logic:

  def IdentityRelation.ofIdentityTheory {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier

Predicate logic (unfolded):

  def IdentityRelation.ofIdentityTheory {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier

Logical form (Lean):

```lean
def IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier
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
@[reducible] def IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier := by
  sorry

/--
`IdentityRelation.ofIsIdentityRelation` TODO

Predicate logic:

  def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : IdentityRelation Carrier

Predicate logic (unfolded):

  def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : IdentityRelation Carrier

Logical form (Lean):

```lean
def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier
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
@[reducible] def IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier := by
  sorry

end LRA.Identity
