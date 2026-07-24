namespace LRA.VolumeI.Logic.Proof.System

/-!
Generic proof-system data.

A proof system is presented by a type of judgements, a predicate selecting
initial judgements, and a relation saying that a finite list of upper
judgements licenses a lower judgement.
-/

structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop

end LRA.VolumeI.Logic.Proof.System
