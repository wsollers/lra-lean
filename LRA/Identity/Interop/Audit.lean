import LRA.Identity.Interop.Adapters
import LRA.Identity.Constructions.Axiomatic
import LRA.Identity.Constructions.Mathlib

namespace LRA.Identity.Interop

universe u

open LRA.Identity

/--
`axiomaticIsEq` TODO

Predicate logic:

  (∀ x y ∈ Carrier), LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ x = y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
  Prove
    LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ x = y

Logical form (Lean):

```lean
theorem axiomaticIsEq {Carrier : Type u} (x y : Carrier) :
    LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ x = y
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
    LRA.Identity.Constructions.Axiomatic.Ax_IdentityRelation x y ↔ x = y := by
  sorry

#print axioms IdentAgreesWithLeanEq
#print axioms LRA.Identity.Constructions.Mathlib.instIdentityRelation
#print axioms axiomaticIsEq

end LRA.Identity.Interop
