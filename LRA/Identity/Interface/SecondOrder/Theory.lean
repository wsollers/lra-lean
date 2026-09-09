import LRA.Identity.Interface.SecondOrder.Model

namespace LRA.Identity.Interface.SecondOrder

/--
`HenkinTheory` TODO

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
abbrev HenkinTheory {L : LStructure} (M : HenkinModel L) : Prop :=
  LRA.Identity.Logic.SOL.HenkinIdentityTheory M.predicateDomain
    M.firstOrder.Identity

/--
`FullTheory` TODO

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
abbrev FullTheory {L : LStructure} (M : FullModel L) : Prop :=
  LRA.Identity.Logic.SOL.FullIdentityTheory M.firstOrder.Identity

end LRA.Identity.Interface.SecondOrder
