import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib

open LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier := Complex

Predicate logic (unfolded):

  abbrev Carrier := Complex (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier := Complex
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
abbrev Carrier := Complex

/--
`genericModel` TODO

Predicate logic:

  noncomputable def genericModel : ComplexNumberModel :=
    mathlibComplexNumberModel

Predicate logic (unfolded):

  noncomputable def genericModel : ComplexNumberModel :=
    mathlibComplexNumberModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def genericModel : ComplexNumberModel :=
  mathlibComplexNumberModel
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
noncomputable def genericModel : ComplexNumberModel :=
  mathlibComplexNumberModel

/--
`satisfiesGenericType` TODO

Predicate logic:

  LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.genericModel.Carrier = LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.genericModel.1 = LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.Carrier

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

  noncomputable def firstOrderModel := genericModel.firstOrderModel

Predicate logic (unfolded):

  noncomputable def firstOrderModel := genericModel.firstOrderModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def firstOrderModel := genericModel.firstOrderModel
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
noncomputable def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib
