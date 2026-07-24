import LRA.VolumeI.Logic.Proof.System.Basic

namespace LRA.VolumeI.Logic.Proof.System

/-!
Finite derivability for a generic proof system.

The `infer` constructor covers both ordinary inferences and initial
judgements: initial judgements are also exposed as a convenience constructor.
-/

inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower

end LRA.VolumeI.Logic.Proof.System
