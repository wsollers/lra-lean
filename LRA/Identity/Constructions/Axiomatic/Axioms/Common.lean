namespace LRA.Identity

universe u

namespace Construction.Axiomatic

/--
`Ax_IdentityRelation` TODO

Predicate logic:

  Carrier → Carrier → Prop end Construction.Axiomatic structure IdentityTheory {Carrier : Type u} Admissible ∈ (Carrier → Prop → Prop) R ∈ Carrier → Carrier → Prop : Prop where reflexive : ∀ x, R x x leibniz : ∀ x y, R x y → ∀ P : Carrier → Prop, Admissible P → P x → P y end LRA.Identity

Predicate logic (unfolded):

  {Carrier : Type u} → Carrier → Carrier → Prop (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop
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
