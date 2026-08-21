import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Language.Notation.LogicalSymbols

namespace LRA.Identity

open LRA.Logic

universe u

/-! The pure first-order language and structures of equality. -/

/-- The pure first-order signature underlying the language of equality. -/
def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

/-- `L_=` as a first-order language. -/
abbrev PureEqualityLanguage := FirstOrderLanguage

/-- The language of equality is the empty non-logical signature. -/
def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature

/-- The equality symbol in `L_=` is ordinary logical equality. -/
abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality

/-- The logical equality symbol is binary. -/
theorem EqualityLogicalSymbolIsBinary :
    LRA.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq := by
  sorry

/-- The diagonal equality relation on a carrier. -/
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

/-- An `L_=`-structure: a nonempty carrier with equality interpreted diagonally. -/
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right

end LRA.Identity
