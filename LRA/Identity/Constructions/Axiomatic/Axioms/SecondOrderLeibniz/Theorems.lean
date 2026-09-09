import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions

namespace LRA.Identity

universe u

/--
`IdentityRelation.satisfiesIdentityTheory` TODO

Predicate logic:

  ∀ (Carrier : Type u) [inst : LRA.Identity.IdentityRelation Carrier], LRA.Identity.IdentityTheory (LRA.Identity.FullLeibniz Carrier) inst.Ident

Predicate logic (unfolded):

  ∀ (Carrier : Type u) [inst : LRA.Identity.IdentityRelation Carrier], ((∀ (x : Carrier), inst.Ident x x) ∧ (∀ (x y : Carrier), inst.Ident x y → ∀ (P : Carrier → Prop), True → P x → P y))

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

    exact {
      reflexive := by
        intro x
        exact IdentReflexive x

      leibniz := by
        intro x y hxIy
        intro P
        intro fl Px
        exact IdentLeibniz hxIy P Px -- hypothesis (x=y) The func (P) that P of x (Px)
    }


end LRA.Identity

namespace LRA.Identity.Constructions.Axiomatic

universe u

/-!
The SecondOrderLeibniz axiom folder owns the primitive axiom and its immediate
construction packaging. Generic identity laws live in `LRA.Identity.Laws`;
construction-specific law packaging lives in
`LRA.Identity.Constructions.Axiomatic.Laws`.
-/

/--
`axiomaticLeibnizLaw` TODO

Predicate logic:

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (Property : Carrier → Prop), Property x → Property y

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {x y : Carrier}, LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y → ∀ (Property : Carrier → Prop), Property x → Property y

Logical form (Lean):

```lean
theorem axiomaticLeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y := by
  intro hPx
  have hPy := Ax_LeibnizLaw h
  have xy := hPy Property
  have Py
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
theorem axiomaticLeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y := by
  intro hPx
  have hPy := Ax_LeibnizLaw h
  have xy := hPy Property
  have Py := xy hPx
  exact Py


end LRA.Identity.Constructions.Axiomatic
