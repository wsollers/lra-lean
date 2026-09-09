import LRA.Logic.Language.FirstOrder.Signature
import LRA.Metamathematics.Notation.LogicalSymbols

namespace LRA.Identity

open LRA.Logic

/--
`pureEqualitySignature` TODO

Predicate logic:

  def pureEqualitySignature : Signature where
    Functions := ⟨Empty, Empty.elim⟩
    Relations := ⟨Empty, Empty.elim⟩
    Constants := Empty

Predicate logic (unfolded):

  def pureEqualitySignature : Signature where
    Functions := ⟨Empty, Empty.elim⟩
    Relations := ⟨Empty, Empty.elim⟩
    Constants := Empty

Logical form (Lean):

```lean
def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def pureEqualitySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

/--
`PureEqualityLanguage` TODO

Predicate logic:

  abbrev PureEqualityLanguage := FirstOrderLanguage

Predicate logic (unfolded):

  abbrev PureEqualityLanguage := FirstOrderLanguage

Logical form (Lean):

```lean
abbrev PureEqualityLanguage := FirstOrderLanguage
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PureEqualityLanguage := FirstOrderLanguage

/--
`pureEqualityLanguage` TODO

Predicate logic:

  def pureEqualityLanguage : PureEqualityLanguage :=
    pureEqualitySignature

Predicate logic (unfolded):

  def pureEqualityLanguage : PureEqualityLanguage :=
    pureEqualitySignature

Logical form (Lean):

```lean
def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def pureEqualityLanguage : PureEqualityLanguage :=
  pureEqualitySignature

/--
`EqualityFirstOrderSignature` TODO

Predicate logic:

  abbrev EqualityFirstOrderSignature := Signature

Predicate logic (unfolded):

  abbrev EqualityFirstOrderSignature := Signature

Logical form (Lean):

```lean
abbrev EqualityFirstOrderSignature := Signature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev EqualityFirstOrderSignature := Signature

/--
`equalityFirstOrderSignature` TODO

Predicate logic:

  abbrev equalityFirstOrderSignature : EqualityFirstOrderSignature :=
    pureEqualitySignature

Predicate logic (unfolded):

  abbrev equalityFirstOrderSignature : EqualityFirstOrderSignature :=
    pureEqualitySignature

Logical form (Lean):

```lean
abbrev equalityFirstOrderSignature : EqualityFirstOrderSignature :=
  pureEqualitySignature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev equalityFirstOrderSignature : EqualityFirstOrderSignature :=
  pureEqualitySignature

/--
`EqualityFirstOrderLanguage` TODO

Predicate logic:

  abbrev EqualityFirstOrderLanguage := PureEqualityLanguage

Predicate logic (unfolded):

  abbrev EqualityFirstOrderLanguage := PureEqualityLanguage

Logical form (Lean):

```lean
abbrev EqualityFirstOrderLanguage := PureEqualityLanguage
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev EqualityFirstOrderLanguage := PureEqualityLanguage

/--
`equalityFirstOrderLanguage` TODO

Predicate logic:

  abbrev equalityFirstOrderLanguage : EqualityFirstOrderLanguage :=
    pureEqualityLanguage

Predicate logic (unfolded):

  abbrev equalityFirstOrderLanguage : EqualityFirstOrderLanguage :=
    pureEqualityLanguage

Logical form (Lean):

```lean
abbrev equalityFirstOrderLanguage : EqualityFirstOrderLanguage :=
  pureEqualityLanguage
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev equalityFirstOrderLanguage : EqualityFirstOrderLanguage :=
  pureEqualityLanguage

/--
`EqualityLogicalSymbol` TODO

Predicate logic:

  abbrev EqualityLogicalSymbol := LRA.Metamathematics.Notation.LogicalEquality

Predicate logic (unfolded):

  abbrev EqualityLogicalSymbol := LRA.Metamathematics.Notation.LogicalEquality

Logical form (Lean):

```lean
abbrev EqualityLogicalSymbol := LRA.Metamathematics.Notation.LogicalEquality
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev EqualityLogicalSymbol := LRA.Metamathematics.Notation.LogicalEquality

end LRA.Identity
