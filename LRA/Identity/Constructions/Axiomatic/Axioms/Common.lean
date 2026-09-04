namespace LRA.Identity

universe u

namespace Construction.Axiomatic

/--
`Ax_IdentityRelation` is the abstract identity relation used by the axiomatic
construction.  It is an `axiom`, rather than a `def`, so this development does
not immediately identify it with Lean's built-in equality (`x = y`).  Its
intended equality-like behavior is supplied separately by axioms such as
reflexivity and Leibniz substitution.

Predicate logic:

  Carrier → Carrier → Prop end Construction.Axiomatic structure IdentityTheory {Carrier : Type u} Admissible ∈ (Carrier → Prop → Prop) R ∈ Carrier → Carrier → Prop : Prop where reflexive : ∀ x, R x x leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y end LRA.Identity

Predicate logic (unfolded):

  {Carrier : Type u} → Carrier → Carrier → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop
```

Type-theoretic form:

  An uninterpreted binary predicate on each `Carrier`.

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  This declaration alone does not prove that the relation is reflexive,
  symmetric, transitive, or equal to Lean equality.  A definition such as
  `def IdentityRelation (x y : Carrier) : Prop := x = y` would make that
  particular choice directly, whereas this axiom leaves the relation abstract.

Related proof moves: intro

-/
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop

end Construction.Axiomatic

/--
`IdentityTheory` TODO

Predicate logic:

  structure IdentityTheory {Carrier : Type u}
      (Admissible : (Carrier → Prop) → Prop)
      (R : Carrier → Carrier → Prop) : Prop where
    reflexive : ∀ x, R x x
    leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y

Predicate logic (unfolded):

  structure IdentityTheory {Carrier : Type u}
      (Admissible : (Carrier → Prop) → Prop)
      (R : Carrier → Carrier → Prop) : Prop where
    reflexive : ∀ x, R x x
    leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IdentityTheory {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop where
  reflexive : ∀ x, R x x
  leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y
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
  leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y

end LRA.Identity
