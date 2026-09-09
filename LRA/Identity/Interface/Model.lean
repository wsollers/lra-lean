import LRA.Identity.Interface.Identity

namespace LRA.Identity

universe u

/--
`IdentityFibersAdmissible` states that fixing either argument of an identity
relation produces an admissible unary predicate.

Logical form:

```lean
structure IdentityFibersAdmissible
    {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (Identity : Carrier → Carrier → Prop) : Prop where
  left : ∀ fixed, Admissible (fun value => Identity value fixed)
  right : ∀ fixed, Admissible (fun value => Identity fixed value)
```
-/
structure IdentityFibersAdmissible
    {Carrier : Type u}
    (Admissible : (Carrier → Prop) → Prop)
    (Identity : Carrier → Carrier → Prop) : Prop where
  left : ∀ fixed, Admissible (fun value => Identity value fixed)
  right : ∀ fixed, Admissible (fun value => Identity fixed value)

/--
`IdentityModel` is the small public model used by ordinary identity laws. It
packages only the carrier, identity relation, admissible predicates, identity
theory, and admissibility of the identity fibers.

Logical form:

```lean
structure IdentityModel where
  Carrier : Type u
  Admissible : (Carrier → Prop) → Prop
  Identity : Carrier → Carrier → Prop
  theory : IdentityTheory Admissible Identity
  fibers : IdentityFibersAdmissible Admissible Identity
```
-/
structure IdentityModel where
  Carrier : Type u
  Admissible : (Carrier → Prop) → Prop
  Identity : Carrier → Carrier → Prop
  theory : IdentityTheory Admissible Identity
  fibers : IdentityFibersAdmissible Admissible Identity

end LRA.Identity
