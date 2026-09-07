import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Axiom
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Definitions

namespace LRA.Identity

universe u

/--
`IdentityRelation.satisfiesIdentityTheory` packages any `IdentityRelation`
instance as an `IdentityTheory` over the full Leibniz predicate family.

Logical form:

```lean
theorem IdentityRelation.satisfiesIdentityTheory (Carrier : Type u)
    [IdentityRelation Carrier] :
    IdentityTheory (FullLeibniz Carrier) (Ident : Carrier → Carrier → Prop)
```
-/
theorem IdentityRelation.satisfiesIdentityTheory (Carrier : Type u)
    [IdentityRelation Carrier] :
    IdentityTheory (FullLeibniz Carrier) (Ident : Carrier → Carrier → Prop) := by
  sorry

end LRA.Identity

namespace LRA.Identity.Construction.Axiomatic

universe u

/-!
The SecondOrderLeibniz axiom folder owns the primitive axiom and its immediate
construction packaging. Generic identity laws live in `LRA.Identity.Laws`;
construction-specific law packaging lives in
`LRA.Identity.Constructions.Axiomatic.Laws`.
-/

/--
`axiomaticLeibnizLaw` is the immediate theorem wrapper around the primitive
axiomatic second-order Leibniz axiom.

Logical form:

```lean
theorem axiomaticLeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y
```
-/
theorem axiomaticLeibnizLaw {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x → Property y :=
  Ax_LeibnizLaw h Property

end LRA.Identity.Construction.Axiomatic
