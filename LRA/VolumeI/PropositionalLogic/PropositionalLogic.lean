import LRA.VolumeI.PropositionalLogic.MetaLogic

namespace LRA.VolumeI.PropositionalLogic

-- 1. Define your specific universe of Atoms
inductive StandardAtoms where
  | P | Q | R

-- 2. Instantiate the Meta-Model with your Atoms
def PropSig : Signature := { Atoms := StandardAtoms }

-- 3. LOCK IN YOUR SYSTEM
abbrev PropFormula := Formula PropSig
abbrev PropModel   := Structure PropSig
abbrev PropTheory  := List PropFormula

-- 4. Custom Notation
prefix:max "¬"   => Formula.neg
infixl:65  " ∧ " => Formula.conj

-- 5. Test Case
def test_formula : PropFormula :=
  (Formula.atom StandardAtoms.P) ∧ ¬(Formula.atom StandardAtoms.Q)

def test_model : PropModel := {
  interpretation := fun a => match a with
    | StandardAtoms.P => true
    | StandardAtoms.Q => false
    | StandardAtoms.R => false
}

#eval evaluate test_model test_formula  -- Outputs: true

end LRA.VolumeI.PropositionalLogic
