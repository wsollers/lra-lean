import LRA.VolumeI.Logic.Language.FirstOrder.Signature
import LRA.VolumeI.Logic.Language.Notation.LogicalSymbols

namespace LRA.VolumeI.Identity

open LRA.VolumeI.Logic

/-!
The pure language of equality.

The language `L_=` has no constant symbols, no function symbols, and no
non-logical relation symbols. Equality itself is not listed in the signature's
non-logical relation vocabulary; it is the distinguished logical equality
symbol already supplied by the logical notation layer.
-/

/--
The pure first-order signature underlying the language of equality.

Logical form:

```lean
Functions = ⟨Empty, Empty.elim⟩
Relations = ⟨Empty, Empty.elim⟩
Constants = Empty
```
-/
def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

/--
`L_=` as a first-order language: the empty non-logical signature plus logical
equality.

Logical form:

```lean
PureEqualityLanguage = FirstOrderLanguage
```
-/
abbrev PureEqualityLanguage := FirstOrderLanguage

/--
The language of equality is the empty non-logical signature.

Logical form:

```lean
pureEqualityLanguage = pureEqualitySignature
```
-/
def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature

/--
The equality symbol in `L_=` is the ordinary logical equality symbol.

Logical form:

```lean
EqualityLogicalSymbol =
  LRA.VolumeI.Logic.Language.Notation.LogicalEquality
```
-/
abbrev EqualityLogicalSymbol := LRA.VolumeI.Logic.Language.Notation.LogicalEquality

/--
The logical equality symbol is binary.

Logical form:

```lean
LogicalEqualitySymbols.IsBinary .eq
```
-/
theorem EqualityLogicalSymbolIsBinary :
    LRA.VolumeI.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq :=
  LRA.VolumeI.Logic.Language.Notation.LogicalEqualitySymbols.eqIsBinary

end LRA.VolumeI.Identity
