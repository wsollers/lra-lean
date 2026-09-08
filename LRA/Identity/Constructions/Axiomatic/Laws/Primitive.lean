import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies
import LRA.Identity.Laws.Primitive

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`axiomaticIdentRfl` is the axiomatic construction's reflexivity law for
identity.

Logical form:

```lean
theorem axiomaticIdentRfl {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```
-/
theorem axiomaticIdentRfl {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  sorry

/--
`axiomaticIdentSymmetric` is the axiomatic construction's symmetry law for
identity.

Logical form:

```lean
theorem axiomaticIdentSymmetric {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x
```
-/
theorem axiomaticIdentSymmetric {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) : Ax_IdentityRelation y x := by
  sorry

/--
`axiomaticIdentTransitive` is the axiomatic construction's transitivity law for
identity.

Logical form:

```lean
theorem axiomaticIdentTransitive {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z
```
-/
theorem axiomaticIdentTransitive {Carrier : Type u} {x y z : Carrier}
    (hxy : Ax_IdentityRelation x y) (hyz : Ax_IdentityRelation y z) :
    Ax_IdentityRelation x z := by
  sorry

/--
`axiomaticIdentLeibnizIff` is the axiomatic construction's bidirectional
Leibniz law for identity.

Logical form:

```lean
theorem axiomaticIdentLeibnizIff {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x ↔ Property y
```
-/
theorem axiomaticIdentLeibnizIff {Carrier : Type u} {x y : Carrier}
    (h : Ax_IdentityRelation x y) (Property : Carrier → Prop) :
    Property x ↔ Property y := by
  sorry

end LRA.Identity.Constructions.Axiomatic
