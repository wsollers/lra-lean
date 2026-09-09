import LRA.Identity.Interface.Identity

namespace LRA.Identity.Logic.SOL

universe u

/--
`HenkinPredicateDomain` TODO

Predicate logic:

  structure HenkinPredicateDomain (Carrier : Type u) where
    Admissible : (Carrier -> Prop) -> Prop

Predicate logic (unfolded):

  structure HenkinPredicateDomain (Carrier : Type u) where
    Admissible : (Carrier -> Prop) -> Prop

Logical form (Lean):

```lean
structure HenkinPredicateDomain (Carrier : Type u) where
  Admissible : (Carrier -> Prop) -> Prop
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
structure HenkinPredicateDomain (Carrier : Type u) where
  Admissible : (Carrier -> Prop) -> Prop

/--
`HenkinIdentityTheory` TODO

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
abbrev HenkinIdentityTheory {Carrier : Type u}
    (domain : HenkinPredicateDomain Carrier)
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory domain.Admissible R

/--
`FullIdentityTheory` TODO

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
abbrev FullIdentityTheory {Carrier : Type u}
    (R : Carrier -> Carrier -> Prop) : Prop :=
  LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) R

/--
`HenkinPredicatesSeparatePoints` TODO

Predicate logic:

  ∀ {Carrier : Type u} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) (x y : Carrier), (∀ (P : Carrier → Prop), domain.Admissible P → P x ↔ P y) → x = y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) (x y : Carrier), (∀ (P : Carrier → Prop), domain.Admissible P → P x ↔ P y) → x = y

Logical form (Lean):

```lean
def HenkinPredicatesSeparatePoints {Carrier : Type u}
    (domain : HenkinPredicateDomain Carrier) : Prop :=
  forall x y, (forall P, domain.Admissible P -> (P x <-> P y)) -> x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def HenkinPredicatesSeparatePoints {Carrier : Type u}
    (domain : HenkinPredicateDomain Carrier) : Prop :=
  forall x y, (forall P, domain.Admissible P -> (P x <-> P y)) -> x = y

end LRA.Identity.Logic.SOL
