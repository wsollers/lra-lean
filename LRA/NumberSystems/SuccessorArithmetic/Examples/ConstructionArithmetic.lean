import LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

namespace LRA.NumberSystems.SuccessorArithmetic.Examples

/--
`mathlibBase` TODO

Predicate logic:

  def mathlibBase :
      LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier := 0

Predicate logic (unfolded):

  def mathlibBase :
      LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier := 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier := 0
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
def mathlibBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier := 0

/--
`mathlibSuccessorBase` TODO

Predicate logic:

  theorem mathlibSuccessorBase :
      LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.successor mathlibBase =
        (1 : LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier)

Predicate logic (unfolded):

  theorem mathlibSuccessorBase :
      LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.successor mathlibBase =
        (1 : LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem mathlibSuccessorBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.successor mathlibBase =
      (1 : LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier)
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
theorem mathlibSuccessorBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.successor mathlibBase =
      (1 : LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier) := by
  sorry
end LRA.NumberSystems.SuccessorArithmetic.Examples
