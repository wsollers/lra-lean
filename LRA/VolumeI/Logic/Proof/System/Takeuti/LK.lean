import LRA.VolumeI.Logic.Proof.System.Basic
import LRA.VolumeI.Logic.Proof.System.Takeuti.Rule

namespace LRA.Logic.Proof.System.Takeuti

/-!
Gentzen-Takeuti classical first-order sequent calculus LK.
-/

/--
`LK` defines the displayed object for lk.

Logical form:

```lean
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule
```
-/
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

end LRA.Logic.Proof.System.Takeuti
