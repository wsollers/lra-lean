import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.AlgebraicStructures

/--
`satisfiesField` The `Rat`-backed rational construction canonically realizes field structure.

Predicate logic:

  LRA.AlgebraicStructures.FieldLaws LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.FieldLaws LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Logical form (Lean):

```lean
theorem satisfiesField :
    FieldLaws Carrier
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
theorem satisfiesField :
    FieldLaws Carrier := by
  sorry
/--
`satisfiesOrderedField` The `Rat`-backed rational construction canonically realizes ordered field structure.

Predicate logic:

  LRA.AlgebraicStructures.OrderedFieldLaws LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.OrderedFieldLaws LRA.NumberSystems.RationalNumbers.Constructions.Mathlib.Carrier

Logical form (Lean):

```lean
theorem satisfiesOrderedField :
    OrderedFieldLaws Carrier
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
theorem satisfiesOrderedField :
    OrderedFieldLaws Carrier := by
  sorry
end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
