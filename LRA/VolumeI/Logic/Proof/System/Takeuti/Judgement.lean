import LRA.VolumeI.Logic.Proof.System.Takeuti.Formula

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Sequents, the judgement form of Takeuti's LK and LJ.
-/

/--
`Judgement` packages the data and laws for judgement.

Logical form:

```lean
structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)
```
-/
structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)

/--
`Sequent` abbreviates the displayed type or object for sequent.

Logical form:

```lean
abbrev Sequent := Judgement
```
-/
abbrev Sequent := Judgement

/--
`Judgement.FreeVarOccurs` defines the displayed object for free var occurs.

Logical form:

```lean
def Judgement.FreeVarOccurs {L : Alphabet} (a : L.FreeVar)
    (J : Judgement L) : Prop :=
  (exists A, A ∈ J.antecedent /\ A.FreeVarOccurs a) \/
    (exists A, A ∈ J.succedent /\ A.FreeVarOccurs a)
```
-/
def Judgement.FreeVarOccurs {L : Alphabet} (a : L.FreeVar)
    (J : Judgement L) : Prop :=
  (exists A, A ∈ J.antecedent /\ A.FreeVarOccurs a) \/
    (exists A, A ∈ J.succedent /\ A.FreeVarOccurs a)

/--
`Judgement.IsIntuitionistic` defines the displayed object for is intuitionistic.

Logical form:

```lean
def Judgement.IsIntuitionistic {L : Alphabet} (J : Judgement L) : Prop :=
  J.succedent.length <= 1
```
-/
def Judgement.IsIntuitionistic {L : Alphabet} (J : Judgement L) : Prop :=
  J.succedent.length <= 1

end LRA.VolumeI.Logic.Proof.System.Takeuti
