import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

/--
`LRA_MATHLIB_Carrier` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q
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
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q

/--
`LRA_MathlibCarrier` TODO

Predicate logic:

  abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

Predicate logic (unfolded):

  abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier
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
abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier := LRA_MathlibCarrier

Predicate logic (unfolded):

  abbrev Carrier := LRA_MathlibCarrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier := LRA_MathlibCarrier
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
abbrev Carrier := LRA_MathlibCarrier

/--
`genericModel` TODO

Predicate logic:

  def genericModel : RationalModel :=
    mathlibRationalModel

Predicate logic (unfolded):

  def genericModel : RationalModel :=
    mathlibRationalModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericModel : RationalModel :=
  mathlibRationalModel
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
def genericModel : RationalModel :=
  mathlibRationalModel

/--
`satisfiesGenericType` TODO

Predicate logic:

  LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.genericModel.Carrier = LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.genericModel.1 = LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Logical form (Lean):

```lean
theorem satisfiesGenericType : genericModel.Carrier = Carrier
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
theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  sorry
/--
`firstOrderModel` TODO

Predicate logic:

  def firstOrderModel := rationalNumbersModel genericModel

Predicate logic (unfolded):

  def firstOrderModel := rationalNumbersModel genericModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def firstOrderModel := rationalNumbersModel genericModel
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
def firstOrderModel := rationalNumbersModel genericModel

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
