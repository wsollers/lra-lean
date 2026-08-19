import LRA.Logic.Proof.System.Basic
import LRA.Logic.Proof.System.Takeuti.Rule

namespace LRA.Logic.Proof.System.Takeuti

/-!
Gentzen-Takeuti intuitionistic sequent calculus LJ.

LJ is LK restricted to sequents with at most one succedent formula.
-/

/--
`LJRule` defines the displayed object for lj rule.

Logical form:

```lean
def LJRule {L : Alphabet} [DecidableEq L.FreeVar]
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  Rule uppers lower /\
    lower.IsIntuitionistic /\
    forall upper, upper ∈ uppers -> upper.IsIntuitionistic
```
-/
def LJRule {L : Alphabet} [DecidableEq L.FreeVar]
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  Rule uppers lower /\
    lower.IsIntuitionistic /\
    forall upper, upper ∈ uppers -> upper.IsIntuitionistic

/--
`LJ` defines the displayed object for lj.

Logical form:

```lean
def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
  Rule := LJRule
```
-/
def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
  Rule := LJRule

end LRA.Logic.Proof.System.Takeuti
