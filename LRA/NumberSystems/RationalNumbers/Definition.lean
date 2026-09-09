import Mathlib.Data.NNRat.Defs
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.Carriers.Witnesses

namespace LRA.NumberSystems.RationalNumbers

/--
`LRA_Q_RationalQuotientFractions` TODO

Predicate logic:

  abbrev LRA_Q_RationalQuotientFractions :=
    LRA.NumberSystems.Carriers.Q_RationalQuotientFractions

Predicate logic (unfolded):

  abbrev LRA_Q_RationalQuotientFractions :=
    LRA.NumberSystems.Carriers.Q_RationalQuotientFractions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Q_RationalQuotientFractions :=
  LRA.NumberSystems.Carriers.Q_RationalQuotientFractions
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
abbrev LRA_Q_RationalQuotientFractions :=
  LRA.NumberSystems.Carriers.Q_RationalQuotientFractions

/--
`LRA_Q` TODO

Predicate logic:

  abbrev LRA_Q := LRA_Q_RationalQuotientFractions

Predicate logic (unfolded):

  abbrev LRA_Q := LRA_Q_RationalQuotientFractions (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Q := LRA_Q_RationalQuotientFractions
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
abbrev LRA_Q := LRA_Q_RationalQuotientFractions

/--
`LRA_Rat` TODO

Predicate logic:

  abbrev LRA_Rat := LRA_Q

Predicate logic (unfolded):

  abbrev LRA_Rat := LRA_Q (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Rat := LRA_Q
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
abbrev LRA_Rat := LRA_Q

/--
`LRA_DefaultCarrier` TODO

Predicate logic:

  abbrev LRA_DefaultCarrier := LRA_Rat

Predicate logic (unfolded):

  abbrev LRA_DefaultCarrier := LRA_Rat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_DefaultCarrier := LRA_Rat
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
abbrev LRA_DefaultCarrier := LRA_Rat

/--
`LRA_MATHLIB_Q` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Q := Rat

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Q := Rat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Q := Rat
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
abbrev LRA_MATHLIB_Q := Rat

/--
`LRA_MATHLIB_Q_Nonneg` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Q_Nonneg := NNRat

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Q_Nonneg := NNRat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Q_Nonneg := NNRat
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
abbrev LRA_MATHLIB_Q_Nonneg := NNRat

/--
`LRA_MATHLIB_Q_Pos` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Q_Pos := LRA_MATHLIB_Q_Nonnegˣ

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Q_Pos := LRA_MATHLIB_Q_Nonnegˣ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Q_Pos := LRA_MATHLIB_Q_Nonnegˣ
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
abbrev LRA_MATHLIB_Q_Pos := LRA_MATHLIB_Q_Nonnegˣ

/--
`LRA_Q_Pos` TODO

Predicate logic:

  def LRA_Q_Pos : Type := { value : LRA_Q // (0 : LRA_Q) < value }

Predicate logic (unfolded):

  def LRA_Q_Pos : Type := { value : LRA_Q // (0 : LRA_Q) < value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Q_Pos : Type := { value : LRA_Q // (0 : LRA_Q) < value }
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
def LRA_Q_Pos : Type := { value : LRA_Q // (0 : LRA_Q) < value }

/--
`LRA_Q_Nonneg` TODO

Predicate logic:

  def LRA_Q_Nonneg : Type := { value : LRA_Q // (0 : LRA_Q) <= value }

Predicate logic (unfolded):

  def LRA_Q_Nonneg : Type := { value : LRA_Q // (0 : LRA_Q) <= value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Q_Nonneg : Type := { value : LRA_Q // (0 : LRA_Q) <= value }
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
def LRA_Q_Nonneg : Type := { value : LRA_Q // (0 : LRA_Q) <= value }

/--
`LRA_Q_Neg` TODO

Predicate logic:

  def LRA_Q_Neg : Type := { value : LRA_Q // value < (0 : LRA_Q) }

Predicate logic (unfolded):

  def LRA_Q_Neg : Type := { value : LRA_Q // value < (0 : LRA_Q) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Q_Neg : Type := { value : LRA_Q // value < (0 : LRA_Q) }
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
def LRA_Q_Neg : Type := { value : LRA_Q // value < (0 : LRA_Q) }

/--
`LRA_Q_Nonpos` TODO

Predicate logic:

  def LRA_Q_Nonpos : Type := { value : LRA_Q // value <= (0 : LRA_Q) }

Predicate logic (unfolded):

  def LRA_Q_Nonpos : Type := { value : LRA_Q // value <= (0 : LRA_Q) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LRA_Q_Nonpos : Type := { value : LRA_Q // value <= (0 : LRA_Q) }
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
def LRA_Q_Nonpos : Type := { value : LRA_Q // value <= (0 : LRA_Q) }

namespace LRA_Q_Pos

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Pos 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨1⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_Q_Pos

namespace LRA_Q_Nonneg

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg 1 := ⟨⟨1, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Mul LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := ⟨
  fun left right => ⟨left.1 * right.1, by
    sorry
  ⟩
⟩

end LRA_Q_Nonneg

namespace LRA_Q_Neg

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨⟨-1, by
  sorry
⟩⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

noncomputable instance : Inv LRA.NumberSystems.RationalNumbers.LRA_Q_Neg := ⟨
  fun value => ⟨value.1⁻¹, by
    sorry
  ⟩
⟩

end LRA_Q_Neg

namespace LRA_Q_Nonpos

noncomputable instance : OfNat LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos 0 := ⟨⟨0, by
  sorry
⟩⟩

noncomputable instance : Nonempty LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos := ⟨0⟩

noncomputable instance : Add LRA.NumberSystems.RationalNumbers.LRA_Q_Nonpos := ⟨
  fun left right => ⟨left.1 + right.1, by
    sorry
  ⟩
⟩

end LRA_Q_Nonpos

end LRA.NumberSystems.RationalNumbers
