import LRA.NumberSystems.WholeNumbers.Constructions.Landau.WellFoundedness
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`addition` TODO

Predicate logic:

  noncomputable def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right =>
      some (LandauAddition natural_data.model left right)

Predicate logic (unfolded):

  noncomputable def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right =>
      some (LandauAddition natural_data.model left right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right =>
      some (LandauAddition natural_data.model left right)
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
noncomputable def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right =>
      some (LandauAddition natural_data.model left right)

/--
`multiplication` TODO

Predicate logic:

  noncomputable def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right =>
      some (LandauMultiplication natural_data.model left right)

Predicate logic (unfolded):

  noncomputable def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right =>
      some (LandauMultiplication natural_data.model left right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right =>
      some (LandauMultiplication natural_data.model left right)
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
noncomputable def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right =>
      some (LandauMultiplication natural_data.model left right)

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
