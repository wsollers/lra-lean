import LRA.Identity.Interface.Model

namespace LRA.Identity

/--
`IdentityModel.IdentitySymmetric` derives symmetry in any identity model.
Equivalently, every proof of `M.Identity x y` yields a proof of
`M.Identity y x` without exposing how `M` was constructed.

Logical form:

```lean
theorem IdentityModel.IdentitySymmetric
    (M : IdentityModel) {x y : M.Carrier}
    (hIdentity : M.Identity x y) : M.Identity y x
```
-/
theorem IdentityModel.IdentitySymmetric
    (M : IdentityModel) {x y : M.Carrier}
    (hIdentity : M.Identity x y) : M.Identity y x :=
  M.theory.leibniz x y hIdentity
    (fun value => M.Identity value x)
    (M.fibers.left x)
    (M.theory.reflexive x)

end LRA.Identity
