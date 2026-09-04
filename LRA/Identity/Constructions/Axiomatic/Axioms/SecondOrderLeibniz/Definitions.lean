import LRA.Identity.Constructions.Axiomatic.Axioms.Common

namespace LRA.Identity

universe u

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
      ∀ Property : Carrier → Prop, Property x → Property y (source fallback; no compiled unfold data available)

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
`FullLeibniz` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a : Carrier → Prop), True

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    True

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
`IsIdentityRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (R : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) R

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Identity.IdentityTheory (fun x => True) R

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

  abbrev IdentityRelation.ofIdentityTheory {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier where
    Ident := R
    IdentReflexive := h.reflexive
    IdentLeibniz := fun hxy P hp => h.leibniz _ _ hxy P trivial hp

Predicate logic (unfolded):

  abbrev IdentityRelation.ofIdentityTheory {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier where
    Ident := R
    IdentReflexive := h.reflexive
    IdentLeibniz := fun hxy P hp => h.leibniz _ _ hxy P trivial hp (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier where
  Ident := R
  IdentReflexive := h.reflexive
  IdentLeibniz := fun hxy P hp => h.leibniz _ _ hxy P trivial hp
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
abbrev IdentityRelation.ofIdentityTheory {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IdentityTheory (FullLeibniz Carrier) R) : IdentityRelation Carrier where
  Ident := R
  IdentReflexive := h.reflexive
  IdentLeibniz := fun hxy P hp => h.leibniz _ _ hxy P trivial hp

/--
`IdentityRelation.satisfiesIdentityTheory` TODO

Predicate logic:

  IdentityTheory (FullLeibniz Carrier) Ident ∈ Carrier → Carrier → Prop

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    LRA.Identity.IdentityTheory (fun x => True) inst.1

Logical form (Lean):

```lean
theorem IdentityRelation.satisfiesIdentityTheory (Carrier : Type u)
    [IdentityRelation Carrier] :
    IdentityTheory (FullLeibniz Carrier) (Ident : Carrier → Carrier → Prop)
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
theorem IdentityRelation.satisfiesIdentityTheory (Carrier : Type u)
    [IdentityRelation Carrier] :
    IdentityTheory (FullLeibniz Carrier) (Ident : Carrier → Carrier → Prop) := by
  sorry

/--
`IdentityRelation.ofIsIdentityRelation` TODO

Predicate logic:

  abbrev IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : IdentityRelation Carrier :=
    IdentityRelation.ofIdentityTheory h

Predicate logic (unfolded):

  abbrev IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
      {R : Carrier → Carrier → Prop}
      (h : IsIdentityRelation R) : IdentityRelation Carrier :=
    IdentityRelation.ofIdentityTheory h (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier :=
  IdentityRelation.ofIdentityTheory h
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
abbrev IdentityRelation.ofIsIdentityRelation {Carrier : Type u}
    {R : Carrier → Carrier → Prop}
    (h : IsIdentityRelation R) : IdentityRelation Carrier :=
  IdentityRelation.ofIdentityTheory h

end LRA.Identity
