import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.NaturalNumbers.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib

open LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

/--
`LRA_MATHLIB_Carrier` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N
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
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N

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

  def genericModel : NaturalNumberModel :=
    mathlibNaturalNumberModel

Predicate logic (unfolded):

  def genericModel : NaturalNumberModel :=
    mathlibNaturalNumberModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericModel : NaturalNumberModel :=
  mathlibNaturalNumberModel
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
def genericModel : NaturalNumberModel :=
  mathlibNaturalNumberModel

/--
`satisfiesGenericType` TODO

Predicate logic:

  LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.genericModel.Carrier = LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.genericModel.1 = LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier

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

  def firstOrderModel := genericModel.firstOrderModel

Predicate logic (unfolded):

  def firstOrderModel := genericModel.firstOrderModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def firstOrderModel := genericModel.firstOrderModel
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
def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib
