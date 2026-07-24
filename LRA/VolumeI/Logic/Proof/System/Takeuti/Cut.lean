import LRA.VolumeI.Logic.Proof.System.Derivation
import LRA.VolumeI.Logic.Proof.System.Takeuti.LK
import LRA.VolumeI.Logic.Proof.System.Takeuti.LJ

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Named placeholders for the cut-elimination interface.

The theorem statements are intentionally not asserted here; this file only
names the definitions that later cut-elimination work will refine.
-/

def IsCutRuleShape {L : Alphabet}
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  exists (A : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)),
    uppers =
        [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
          ⟨A :: rightAntecedent, rightSuccedent⟩] /\
      lower =
        ⟨leftAntecedent ++ rightAntecedent, leftSuccedent ++ rightSuccedent⟩

end LRA.VolumeI.Logic.Proof.System.Takeuti
