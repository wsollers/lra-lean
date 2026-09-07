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
    @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x x
```
-/
theorem axiomaticEqualRfl {Carrier : Type u} (x : Carrier) :
    @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x x := by
  exact axiomaticIdentityReflexivity x

/--
`axiomaticIdentIsDiagonal` identifies axiomatic identity with axiomatic
in-house equality. It does not identify axiomatic identity with Lean's native
equality.

Logical form:

```lean
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔
      @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x y
```
-/
theorem axiomaticIdentIsDiagonal {Carrier : Type u} (x y : Carrier) :
    Ax_IdentityRelation x y ↔
      @LRA.Identity.Equal Carrier (instEqualityRelation Carrier) x y := by
  constructor
  · intro h
    exact h
  · intro h
    exact h

end LRA.Identity.Construction.Axiomatic
