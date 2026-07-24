import LRA.VolumeI.Logic.Proof.System.Takeuti.Formula

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Sequents, the judgement form of Takeuti's LK and LJ.
-/

structure Judgement (L : Alphabet) where
  antecedent : List (Formula L)
  succedent : List (Formula L)

abbrev Sequent := Judgement

def Judgement.FreeVarOccurs {L : Alphabet} (a : L.FreeVar)
    (J : Judgement L) : Prop :=
  (exists A, A ∈ J.antecedent /\ A.FreeVarOccurs a) \/
    (exists A, A ∈ J.succedent /\ A.FreeVarOccurs a)

def Judgement.IsIntuitionistic {L : Alphabet} (J : Judgement L) : Prop :=
  J.succedent.length <= 1

end LRA.VolumeI.Logic.Proof.System.Takeuti
