import LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.NaturalNumbers.Examples

section Mathlib

/--
`mathlibOne` TODO

Predicate logic:

  def mathlibOne :
      LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier := 1

Predicate logic (unfolded):

  def mathlibOne :
      LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier := 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibOne :
    LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier := 1
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
def mathlibOne :
    LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier := 1

/--
`mathlibOnePlusOne` TODO

Predicate logic:

  theorem mathlibOnePlusOne :
      mathlibOne + mathlibOne =
        (2 : LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier)

Predicate logic (unfolded):

  theorem mathlibOnePlusOne :
      mathlibOne + mathlibOne =
        (2 : LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem mathlibOnePlusOne :
    mathlibOne + mathlibOne =
      (2 : LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier)
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
theorem mathlibOnePlusOne :
    mathlibOne + mathlibOne =
      (2 : LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier) := by
  sorry
end Mathlib

end LRA.NumberSystems.NaturalNumbers.Examples
