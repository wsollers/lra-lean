import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.LStructure
import LRA.NumberSystems.VonNeumann.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

def VonNeumannTheory
    (signature : VonNeumannSignature) : Prop :=
  ∃ (SetObject : Type) (_ : Membership signature.carrier SetObject),
    ∃ construction :
        LRA.NumberSystems.VonNeumann.VonNeumannConstructionModel
          signature.carrier SetObject,
      signature.zero = construction.zero ∧
        signature.one = construction.one ∧
        signature.successor = construction.successor ∧
        signature.addition = construction.addition ∧
        signature.multiplication = construction.multiplication ∧
        signature.lessThan = construction.lessThan

abbrev VonNeumannAxioms := VonNeumannTheory

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
