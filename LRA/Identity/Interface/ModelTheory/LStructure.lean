import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Language.Notation.LogicalSymbols
import LRA.Identity.Interface.ModelTheory.Theory

namespace LRA.Identity

open LRA.Logic

universe u

def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

abbrev PureEqualityLanguage := FirstOrderLanguage

def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature

abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality

def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  satisfiesIdentityTheory :
    IdentityTheory (FullLeibniz Carrier) equalityInterpretation

end LRA.Identity
