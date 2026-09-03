import LRA.Identity.Interface.Logic.FirstOrder.Language
import LRA.Identity.Interface.Logic.Theory

namespace LRA.Identity

/--
`EqualityFirstOrderTheory` is the subject-level first-order equality theory
schema over the pure equality language. The admissible unary predicates are
left explicit so the same schema can later be specialized by whichever
definability discipline is chosen for the subject's first-order development.
-/
abbrev EqualityFirstOrderTheory {Carrier : Type _}
    (Admissible : (Carrier → Prop) → Prop)
    (R : Carrier → Carrier → Prop) : Prop :=
  IdentityTheory Admissible R

end LRA.Identity
