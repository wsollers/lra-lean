import LRA.Identity.Constructions.Axiomatic.Laws.Identity
import LRA.Identity.Interface.Logic.FOL.Theory
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Axiomatic.Laws

universe u

/--
`FullToHenkin` TODO

Predicate logic:

  ∀ {Carrier : Type u} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation → LRA.Identity.Logic.SOL.HenkinIdentityTheory domain LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem FullToHenkin {Carrier : Type u}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain Ax_IdentityRelation
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
theorem FullToHenkin {Carrier : Type u}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain Ax_IdentityRelation := by
  sorry

/--
`FullToFirstOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (Expressible : (Carrier → Prop) → Prop), LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation → LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (Expressible : (Carrier → Prop) → Prop), ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), Expressible P → P x → P y))

Logical form (Lean):

```lean
theorem FullToFirstOrder {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible Ax_IdentityRelation
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
theorem FullToFirstOrder {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible Ax_IdentityRelation := by
  sorry

/--
`HenkinToFullOfAllPredicates` TODO

Predicate logic:

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}, (LRA.Identity.Logic.SOL.HenkinIdentityTheory domain LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → LRA.Identity.Logic.SOL.FullIdentityTheory LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}, (((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y)) ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → ((∀ (x : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x x) ∧ (∀ (x y : Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem HenkinToFullOfAllPredicates {Carrier : Type u}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop))
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)
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
theorem HenkinToFullOfAllPredicates {Carrier : Type u}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop))
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic.Laws
