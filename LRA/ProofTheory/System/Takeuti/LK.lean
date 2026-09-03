import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Takeuti.Rule

namespace LRA.ProofTheory.System.Takeuti

/--
`LK` TODO

Predicate logic:

  def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.ProofTheory.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

Predicate logic (unfolded):

  def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.ProofTheory.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.ProofTheory.System.ProofSystem where
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
    LRA.ProofTheory.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

end LRA.ProofTheory.System.Takeuti
