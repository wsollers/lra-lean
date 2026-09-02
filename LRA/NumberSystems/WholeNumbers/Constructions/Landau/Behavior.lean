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

  (∀ value, naturalEmbedding natural_data (natural_data.model.successor value) = successor natural_data (naturalEmbedding natural_data value)) ∧ (∀ first second, naturalEmbedding natural_data (LandauAddition natural_data.model first second) = addition natural_data (naturalEmbedding natural_data first) (naturalEmbedding natural_data second)) ∧ (∀ first second, naturalEmbedding natural_data (LandauMultiplication natural_data.model first second) = multiplication natural_data (naturalEmbedding natural_data first) (naturalEmbedding natural_data second)) ∧ (∀ first second, strictOrder natural_data (naturalEmbedding natural_data first) (naturalEmbedding natural_data second) ↔ natural_data.strictOrder first second)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), (∀ (value : Element), Option.some (natural_data.model.2 value) = Option.rec ((fun _ => Option.some natural_data.model.1) Unit.unit) (fun val => (fun val => (fun value => Option.some (natural_data.model.2 value)) val) val) (Option.some value) ∧ (∀ (first second : Element), Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).1 first second) = Option.rec ((fun right => right) (Option.some second)) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) (Option.some second)) val) (Option.some first) ∧ (∀ (first second : Element), Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).1 first second) = Option.rec ((fun x => Option.none) (Option.some second)) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) (Option.some second)) val) (Option.some first) ∧ ∀ (first second : Element), Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (Option.some second)) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (Option.some second)) val) (Option.some first) ↔ natural_data.2 first second)))

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
