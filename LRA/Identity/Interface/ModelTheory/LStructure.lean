import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Language.Notation.LogicalSymbols

namespace LRA.Identity

open LRA.Logic

universe u

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
  Constants := Empty (source fallback; no compiled unfold data available)

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

  abbrev PureEqualityLanguage := FirstOrderLanguage (source fallback; no compiled unfold data available)

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
  pureEqualitySignature (source fallback; no compiled unfold data available)

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
`EqualityLogicalSymbol` TODO

Predicate logic:

  abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality

Predicate logic (unfolded):

  abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality
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
abbrev EqualityLogicalSymbol := LRA.Logic.Language.Notation.LogicalEquality

/--
`EqualityLogicalSymbolIsBinary` TODO

Predicate logic:

  LRA.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq

Predicate logic (unfolded):

  LRA.Logic.Language.Notation.LogicalEqualitySymbols.2 LRA.Logic.Language.Notation.LogicalEquality.eq = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem EqualityLogicalSymbolIsBinary :
    LRA.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem EqualityLogicalSymbolIsBinary :
    LRA.Logic.Language.Notation.LogicalEqualitySymbols.IsBinary .eq := by
  sorry

/--
`EqualityDiagonal` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Logical form (Lean):

```lean
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

/--
`EqualityStructure` TODO

Predicate logic:

  structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right

Predicate logic (unfolded):

  structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right

end LRA.Identity
