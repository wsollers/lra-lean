import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Language.Notation.LogicalSymbols

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

                                             
theorem EqualityLogicalSymbolIsBinary :
    LRA.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq := by
  sorry

                                                   
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

                                                                                   
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right

end LRA.Identity
