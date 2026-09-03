import LRA.Logic.Language.FirstOrder.Signature
import LRA.Metamathematics.Notation.LogicalSymbols

namespace LRA.Identity

open LRA.Logic

def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

abbrev PureEqualityLanguage := FirstOrderLanguage

def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature

abbrev EqualityFirstOrderSignature := Signature

abbrev equalityFirstOrderSignature : EqualityFirstOrderSignature :=
  pureEqualitySignature

abbrev EqualityFirstOrderLanguage := PureEqualityLanguage

abbrev equalityFirstOrderLanguage : EqualityFirstOrderLanguage :=
  pureEqualityLanguage

abbrev EqualityLogicalSymbol := LRA.Metamathematics.Notation.LogicalEquality

end LRA.Identity
