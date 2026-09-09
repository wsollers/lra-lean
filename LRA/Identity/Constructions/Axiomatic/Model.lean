import LRA.Identity.Constructions.Axiomatic.Satisfies.Generic
import LRA.Identity.Interface.Model

namespace LRA.Identity.Constructions.Axiomatic

universe u

/--
`AxiomaticIdentityModel` packages the primitive axiomatic identity relation as
the small identity model consumed by ordinary laws.

Logical form:

```lean
noncomputable def AxiomaticIdentityModel
    (Carrier : Type u) : LRA.Identity.IdentityModel
```
-/
noncomputable def AxiomaticIdentityModel
    (Carrier : Type u) : LRA.Identity.IdentityModel where
  Carrier := Carrier
  Admissible := LRA.Identity.FullLeibniz Carrier
  Identity := Ax_IdentityRelation
  theory := SatisfiesGenericIdentity Carrier
  fibers :=
    { left := fun _ => True.intro
      right := fun _ => True.intro }

end LRA.Identity.Constructions.Axiomatic
