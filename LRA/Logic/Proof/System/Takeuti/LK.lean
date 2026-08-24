import LRA.Logic.Proof.System.Basic
import LRA.Logic.Proof.System.Takeuti.Rule

namespace LRA.Logic.Proof.System.Takeuti

/--
`LK` TODO

Predicate logic:

  def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

Predicate logic (unfolded):

  def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

end LRA.Logic.Proof.System.Takeuti
