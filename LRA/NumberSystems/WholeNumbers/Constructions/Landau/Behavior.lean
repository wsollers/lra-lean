import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`natural_embedding_preserves_structure` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), ((∀ (value : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (natural_data.model.successor value) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.successor natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data value)) ∧ ((∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model first second) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second)) ∧ ((∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model first second) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.multiplication natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second)) ∧ (∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.strictOrder natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second) ↔ natural_data.strictOrder first second))))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    natural_data : NaturalArithmeticForWholeNumbers Element SetObject
  Prove
    ((∀ (value : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (natural_data.model.successor value) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.successor natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data value)) ∧ ((∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model first second) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second)) ∧ ((∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model first second) = LRA.NumberSystems.WholeNumbers.Constructions.Landau.multiplication natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second)) ∧ (∀ (first second : Element), LRA.NumberSystems.WholeNumbers.Constructions.Landau.strictOrder natural_data (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data first) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding natural_data second) ↔ natural_data.strictOrder first second))))

Logical form (Lean):

```lean
theorem natural_embedding_preserves_structure :
    (∀ value,
      naturalEmbedding natural_data (natural_data.model.successor value) =
        successor natural_data (naturalEmbedding natural_data value)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauAddition
            natural_data.model
            first
            second) =
        addition natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauMultiplication
            natural_data.model
            first
            second) =
        multiplication natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      strictOrder natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second) ↔
        natural_data.strictOrder first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem natural_embedding_preserves_structure :
    (∀ value,
      naturalEmbedding natural_data (natural_data.model.successor value) =
        successor natural_data (naturalEmbedding natural_data value)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauAddition
            natural_data.model
            first
            second) =
        addition natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      naturalEmbedding natural_data
          (LandauMultiplication
            natural_data.model
            first
            second) =
        multiplication natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second)) ∧
    (∀ first second,
      strictOrder natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second) ↔
        natural_data.strictOrder first second) := by
  sorry
end LRA.NumberSystems.WholeNumbers.Constructions.Landau
