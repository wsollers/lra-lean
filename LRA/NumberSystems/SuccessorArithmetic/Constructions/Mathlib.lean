import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier

Predicate logic (unfolded):

  abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier
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
abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier

/--
`genericArithmetic` TODO

Predicate logic:

  abbrev genericArithmetic :=
    LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem

Predicate logic (unfolded):

  abbrev genericArithmetic :=
    LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev genericArithmetic :=
  LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
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
abbrev genericArithmetic :=
  LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem

/--
`satisfiesGenericType` TODO

Predicate logic:

  theorem satisfiesGenericType : genericArithmetic.base = (0 : Carrier)

Predicate logic (unfolded):

  theorem satisfiesGenericType : genericArithmetic.base = (0 : Carrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
theorem satisfiesGenericType : genericArithmetic.base = (0 : Carrier)
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
theorem satisfiesGenericType : genericArithmetic.base = (0 : Carrier) := by
  sorry
/--
`zero` TODO

Predicate logic:

  abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero

Predicate logic (unfolded):

  abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero
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
abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero

/--
`one` TODO

Predicate logic:

  abbrev one := LRA.NumberSystems.SuccessorArithmetic.one

Predicate logic (unfolded):

  abbrev one := LRA.NumberSystems.SuccessorArithmetic.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev one := LRA.NumberSystems.SuccessorArithmetic.one
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
abbrev one := LRA.NumberSystems.SuccessorArithmetic.one

/--
`successor` TODO

Predicate logic:

  abbrev successor := LRA.NumberSystems.SuccessorArithmetic.successor

Predicate logic (unfolded):

  abbrev successor := LRA.NumberSystems.SuccessorArithmetic.successor (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev successor := LRA.NumberSystems.SuccessorArithmetic.successor
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
abbrev successor := LRA.NumberSystems.SuccessorArithmetic.successor

end LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib
