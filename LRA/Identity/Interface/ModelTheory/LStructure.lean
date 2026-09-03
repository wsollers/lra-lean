import LRA.Identity.Interface.Logic.FirstOrder.Language
import LRA.Identity.Interface.Logic.Theory

namespace LRA.Identity

universe u

def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  satisfiesIdentityTheory :
    IdentityTheory (FullLeibniz Carrier) equalityInterpretation

end LRA.Identity
