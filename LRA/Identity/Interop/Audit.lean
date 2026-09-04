import LRA.Identity.Interop.Adapters
import LRA.Identity.Constructions.Axiomatic
import LRA.Identity.Constructions.Mathlib
import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity.Interop

universe u

open LRA.Identity

/--
`axiomaticIsEq` TODO

Predicate logic:

  (∀ x y ∈ Carrier), LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y ↔ x = y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
  Prove
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y ↔ x = y

Logical form (Lean):

```lean
theorem axiomaticIsEq {Carrier : Type u} (x y : Carrier) :
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y ↔ x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem axiomaticIsEq {Carrier : Type u} (x y : Carrier) :
    LRA.Identity.Construction.Axiomatic.Ax_IdentityRelation x y ↔ x = y := by
  sorry

#print axioms IdentIsDiagonal
#print axioms LRA.Identity.Construction.Mathlib.instIdentityRelation
#print axioms axiomaticIsEq

end LRA.Identity.Interop
