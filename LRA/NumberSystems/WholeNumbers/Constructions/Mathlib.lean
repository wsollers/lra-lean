import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.WholeNumbers.Definition

namespace LRA.NumberSystems.WholeNumbers.Constructions.Mathlib

open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

/--
`LRA_MATHLIB_Carrier` TODO

Predicate logic:

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.WholeNumbers.LRA_MATHLIB_W

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.WholeNumbers.LRA_MATHLIB_W (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.WholeNumbers.LRA_MATHLIB_W
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
abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.WholeNumbers.LRA_MATHLIB_W

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

  def genericModel : WholeNumberModel :=
    mathlibWholeNumberModel

Predicate logic (unfolded):

  def genericModel : WholeNumberModel :=
    mathlibWholeNumberModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericModel : WholeNumberModel :=
  mathlibWholeNumberModel
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
def genericModel : WholeNumberModel :=
  mathlibWholeNumberModel

/--
`satisfiesGenericType` TODO

Predicate logic:

  LRA.NumberSystems.WholeNumbers.Constructions.Mathlib.genericModel.Carrier = LRA.NumberSystems.WholeNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.WholeNumbers.Constructions.Mathlib.genericModel.1 = LRA.NumberSystems.WholeNumbers.Constructions.Mathlib.Carrier

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

end LRA.NumberSystems.WholeNumbers.Constructions.Mathlib
