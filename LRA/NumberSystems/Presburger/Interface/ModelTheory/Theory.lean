import LRA.NumberSystems.Presburger.Interface.ModelTheory.LStructure
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

def PresburgerTheory
    (signature : PresburgerSignature) : Prop :=
  ∃ model :
      LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerModel
        signature.carrier (Set signature.carrier),
    signature.zero = model.zero ∧
      signature.successor = model.successor ∧
      signature.addition =
        LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerAddition
          model ∧
      signature.lessThan = model.lessThan

abbrev PresburgerAxioms := PresburgerTheory

end LRA.NumberSystems.Presburger.Interface.ModelTheory
