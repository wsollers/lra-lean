import LRA.Identity.Constructions.Axiomatic.Satisfies.Equality
import LRA.Identity.Laws.Equality

namespace LRA.Identity.Construction.Axiomatic

universe u

/--
`axiomaticEqualRfl` is the axiomatic construction's reflexivity law for
in-house equality.

Logical form:

```lean
theorem axiomaticEqualRfl {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x
```
-/
theorem axiomaticEqualRfl {Carrier : Type u} (x : Carrier) :
    Ax_IdentityRelation x x := by
  sorry

/--
`axiomaticIdentIsDiagonal` identifies axiomatic identity with axiomatic
in-house equality.

Logical form:

```lean
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔ Ax_IdentityRelation x y
```
-/
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔ Ax_IdentityRelation x y := by
  sorry

end LRA.Identity.Construction.Axiomatic
