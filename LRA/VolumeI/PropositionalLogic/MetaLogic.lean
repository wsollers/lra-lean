namespace LRA.VolumeI.PropositionalLogic

-- 1. The Generic Signature
structure Signature where
  Atoms : Type
  BinOps : Type := Empty

-- 2. The Generic Language
inductive Formula (sig : Signature) where
  | atom : sig.Atoms → Formula sig
  | neg  : Formula sig → Formula sig
  | conj : Formula sig → Formula sig → Formula sig
  | binary : sig.BinOps → Formula sig → Formula sig → Formula sig

-- 3. The Generic Semantics
structure Structure (sig : Signature) where
  interpretation : sig.Atoms → Bool
  evaluateBinary : sig.BinOps → Bool → Bool → Bool := fun _ _ _ => false

def evaluate {sig : Signature} (M : Structure sig) : Formula sig → Bool
  | Formula.atom a   => M.interpretation a
  | Formula.neg ϕ    => !(evaluate M ϕ)
  | Formula.conj ϕ ψ => (evaluate M ϕ) && (evaluate M ψ)
  | Formula.binary op ϕ ψ => M.evaluateBinary op (evaluate M ϕ) (evaluate M ψ)

end LRA.VolumeI.PropositionalLogic
