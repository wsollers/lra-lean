import LRA.Identity.Constructions.Axiomatic.Axioms.Common
import LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Axiom
import LRA.Identity.Interface.Logic.FirstOrder.Language

namespace LRA.Identity

/--
`EqualityFirstOrderTheory` TODO

Predicate logic:

  ∀ {Carrier : Type u_1} (Admissible : (Carrier → Prop) → Prop) (R : Carrier → Carrier → Prop), LRA.Identity.IdentityTheory Admissible R

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Identity.IdentityTheory Admissible R

Logical form (Lean):

```lean
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory Admissible R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory Admissible R

end LRA.Identity
