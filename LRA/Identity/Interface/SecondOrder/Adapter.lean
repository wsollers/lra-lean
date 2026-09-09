import LRA.Identity.Interface.SecondOrder.Theory
import LRA.Identity.Interface.Model

namespace LRA.Identity.Interface.SecondOrder

/--
`HenkinModel.ToIdentityModel` forgets second-order syntax while retaining the
small identity model required by ordinary laws. Henkin-domain membership of
the two identity fibers is supplied and consumed only at this adapter boundary.

Logical form:

```lean
def HenkinModel.ToIdentityModel
    {L : LStructure} (M : HenkinModel L) (T : HenkinTheory M)
    (leftFiberAdmissible : ∀ fixed,
      M.predicateDomain.Admissible (fun value => M.firstOrder.Identity value fixed))
    (rightFiberAdmissible : ∀ fixed,
      M.predicateDomain.Admissible (fun value => M.firstOrder.Identity fixed value)) :
    LRA.Identity.IdentityModel
```
-/
def HenkinModel.ToIdentityModel
    {L : LStructure} (M : HenkinModel L) (T : HenkinTheory M)
    (leftFiberAdmissible : ∀ fixed,
      M.predicateDomain.Admissible (fun value => M.firstOrder.Identity value fixed))
    (rightFiberAdmissible : ∀ fixed,
      M.predicateDomain.Admissible (fun value => M.firstOrder.Identity fixed value)) :
    LRA.Identity.IdentityModel where
  Carrier := M.firstOrder.interpretation.Domain
  Admissible := M.predicateDomain.Admissible
  Identity := M.firstOrder.Identity
  theory := T
  fibers :=
    { left := leftFiberAdmissible
      right := rightFiberAdmissible }

/--
`FullModel.ToIdentityModel` forgets full second-order syntax while retaining
the small identity model required by ordinary laws. Full semantics makes every
identity fiber admissible, so the adapter needs no additional evidence.

Logical form:

```lean
def FullModel.ToIdentityModel
    {L : LStructure} (M : FullModel L) (T : FullTheory M) :
    LRA.Identity.IdentityModel
```
-/
def FullModel.ToIdentityModel
    {L : LStructure} (M : FullModel L) (T : FullTheory M) :
    LRA.Identity.IdentityModel where
  Carrier := M.firstOrder.interpretation.Domain
  Admissible := LRA.Identity.FullLeibniz M.firstOrder.interpretation.Domain
  Identity := M.firstOrder.Identity
  theory := T
  fibers :=
    { left := fun _ => True.intro
      right := fun _ => True.intro }

end LRA.Identity.Interface.SecondOrder
