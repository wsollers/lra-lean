import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`additive_structure` TODO

Predicate logic:

  (∀ first second third, addition natural_data (addition natural_data first second) third = addition natural_data first (addition natural_data second third)) ∧ (∀ first second, addition natural_data first second = addition natural_data second first) ∧ (∀ value, addition natural_data (zero natural_data) value = value ∧ addition natural_data value (zero natural_data) = value) ∧ (∀ first second common, addition natural_data first common = addition natural_data second common → first = second)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), (∀ (first second third : Option Element), Option.rec ((fun right => right) third) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) third) val) (Option.rec ((fun right => right) second) (fun val => (fun val => Option.casesOn second ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1) val) first) = Option.rec ((fun right => right) (Option.rec ((fun right => right) third) (fun val => (fun val => Option.casesOn third ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1) val) second)) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) (Option.casesOn second ((fun right => right) third) fun val => Option.casesOn third ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) val) first ∧ (∀ (first second : Option Element), Option.rec ((fun right => right) second) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) second) val) first = Option.rec ((fun right => right) first) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) first) val) second ∧ (∀ (value : Option Element), (Option.rec ((fun right => right) value) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) value) val) Option.none = value ∧ Option.rec ((fun right => right) Option.none) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) Option.none) val) value = value) ∧ ∀ (first second common : Option Element), Option.rec ((fun right => right) common) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) common) val) first = Option.rec ((fun right => right) common) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) common) val) second → first = second)))

Logical form (Lean):

```lean
theorem additive_structure :
    (∀ first second third,
      addition natural_data (addition natural_data first second) third =
        addition natural_data first (addition natural_data second third)) ∧
    (∀ first second,
      addition natural_data first second = addition natural_data second first) ∧
    (∀ value,
      addition natural_data (zero natural_data) value = value ∧
      addition natural_data value (zero natural_data) = value) ∧
    (∀ first second common,
      addition natural_data first common = addition natural_data second common →
      first = second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem additive_structure :
    (∀ first second third,
      addition natural_data (addition natural_data first second) third =
        addition natural_data first (addition natural_data second third)) ∧
    (∀ first second,
      addition natural_data first second = addition natural_data second first) ∧
    (∀ value,
      addition natural_data (zero natural_data) value = value ∧
      addition natural_data value (zero natural_data) = value) ∧
    (∀ first second common,
      addition natural_data first common = addition natural_data second common →
      first = second) := by
  sorry

/--
`semiring_structure` TODO

Predicate logic:

  zero natural_data ≠ one natural_data ∧ (∀ first second third, multiplication natural_data (multiplication natural_data first second) third = multiplication natural_data first (multiplication natural_data second third)) ∧ (∀ first second, multiplication natural_data first second = multiplication natural_data second first) ∧ (∀ value, multiplication natural_data (one natural_data) value = value ∧ multiplication natural_data value (one natural_data) = value) ∧ (∀ value, multiplication natural_data (zero natural_data) value = zero natural_data ∧ multiplication natural_data value (zero natural_data) = zero natural_data) ∧ (∀ first second third, multiplication natural_data first (addition natural_data second third) = addition natural_data (multiplication natural_data first second) (multiplication natural_data first third)) ∧ (∀ first second, multiplication natural_data first second = zero natural_data → first = zero natural_data ∨ second = zero natural_data)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), (Option.none = Option.some natural_data.model.1 → False ∧ (∀ (first second third : Option Element), Option.rec ((fun x => Option.none) third) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) third) val) (Option.rec ((fun x => Option.none) second) (fun val => (fun val => Option.casesOn second ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1) val) first) = Option.rec ((fun x => Option.none) (Option.rec ((fun x => Option.none) third) (fun val => (fun val => Option.casesOn third ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1) val) second)) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) (Option.casesOn second ((fun x => Option.none) third) fun val => Option.casesOn third ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1)) val) first ∧ (∀ (first second : Option Element), Option.rec ((fun x => Option.none) second) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) second) val) first = Option.rec ((fun x => Option.none) first) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) first) val) second ∧ (∀ (value : Option Element), (Option.rec ((fun x => Option.none) value) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) value) val) (Option.some natural_data.model.1) = value ∧ Option.rec ((fun x => Option.none) (Option.some natural_data.model.1)) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) (Option.some natural_data.model.1)) val) value = value) ∧ (∀ (value : Option Element), (Option.rec ((fun x => Option.none) value) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) value) val) Option.none = Option.none ∧ Option.rec ((fun x => Option.none) Option.none) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) Option.none) val) value = Option.none) ∧ (∀ (first second third : Option Element), Option.rec ((fun x => Option.none) (Option.rec ((fun right => right) third) (fun val => (fun val => Option.casesOn third ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1) val) second)) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) (Option.casesOn second ((fun right => right) third) fun val => Option.casesOn third ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) val) first = Option.rec ((fun right => right) (Option.rec ((fun x => Option.none) third) (fun val => (fun val => Option.casesOn third ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1) val) first)) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => natural_data.model.successor left) fun x value => natural_data.model.successor value) ⋯).val left right)) val val_2) val_1) (Option.casesOn first ((fun x => Option.none) third) fun val => Option.casesOn third ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1)) val) (Option.rec ((fun x => Option.none) second) (fun val => (fun val => Option.casesOn second ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1) val) first) ∧ ∀ (first second : Option Element), Option.rec ((fun x => Option.none) second) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some ((Classical.indefiniteDescription (LRA.NumberSystems.PeanoSystem.Recursion.BinaryIteratorOperationClauses natural_data.model Element Element (fun left => left) fun left value => LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model value left) ⋯).val left right)) val val_2) val_1) second) val) first = Option.none → Or (first = Option.none)(second = Option.none)))))))

Logical form (Lean):

```lean
theorem semiring_structure :
    zero natural_data ≠ one natural_data ∧
    (∀ first second third,
      multiplication natural_data (multiplication natural_data first second) third =
        multiplication natural_data first (multiplication natural_data second third)) ∧
    (∀ first second,
      multiplication natural_data first second = multiplication natural_data second first) ∧
    (∀ value,
      multiplication natural_data (one natural_data) value = value ∧
      multiplication natural_data value (one natural_data) = value) ∧
    (∀ value,
      multiplication natural_data (zero natural_data) value = zero natural_data ∧
      multiplication natural_data value (zero natural_data) = zero natural_data) ∧
    (∀ first second third,
      multiplication natural_data first (addition natural_data second third) =
        addition natural_data
          (multiplication natural_data first second)
          (multiplication natural_data first third)) ∧
    (∀ first second,
      multiplication natural_data first second = zero natural_data →
      first = zero natural_data ∨ second = zero natural_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr

-/
theorem semiring_structure :
    zero natural_data ≠ one natural_data ∧
    (∀ first second third,
      multiplication natural_data (multiplication natural_data first second) third =
        multiplication natural_data first (multiplication natural_data second third)) ∧
    (∀ first second,
      multiplication natural_data first second = multiplication natural_data second first) ∧
    (∀ value,
      multiplication natural_data (one natural_data) value = value ∧
      multiplication natural_data value (one natural_data) = value) ∧
    (∀ value,
      multiplication natural_data (zero natural_data) value = zero natural_data ∧
      multiplication natural_data value (zero natural_data) = zero natural_data) ∧
    (∀ first second third,
      multiplication natural_data first (addition natural_data second third) =
        addition natural_data
          (multiplication natural_data first second)
          (multiplication natural_data first third)) ∧
    (∀ first second,
      multiplication natural_data first second = zero natural_data →
      first = zero natural_data ∨ second = zero natural_data) := by
  sorry

/--
`ordered_semiring_structure` TODO

Predicate logic:

  (∀ value, nonstrictOrder natural_data (zero natural_data) value) ∧ (∀ first second, strictOrder natural_data first second ∨ first = second ∨ strictOrder natural_data second first) ∧ (∀ first second third, strictOrder natural_data first second → strictOrder natural_data second third → strictOrder natural_data first third) ∧ (∀ first second translation, strictOrder natural_data first second ↔ strictOrder natural_data (addition natural_data first translation) (addition natural_data second translation)) ∧ (∀ first second positive, positive ≠ zero natural_data → (strictOrder natural_data first second ↔ strictOrder natural_data (multiplication natural_data first positive) (multiplication natural_data second positive)))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject), (∀ (value : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) value) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) value) val) Option.none) (Option.none = value) ∧ (∀ (first second : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (Or (first = second) (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) first) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) first) val) second)) ∧ (∀ (first second third : Option Element), Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first → Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) third) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) third) val) second → Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) third) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) third) val) first ∧ (∀ (first second translation : Option Element), Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first ↔ Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (Option.casesOn second ((fun right => right) translation) fun val => Option.casesOn translation ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (Option.casesOn second ((fun right => right) translation) fun val => Option.casesOn translation ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) val) (Option.rec ((fun right => right) translation) (fun val => (fun val => Option.casesOn translation ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1) val) first) ∧ ∀ (first second positive : Option Element), (positive = Option.none → False) → Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first ↔ Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (Option.casesOn second ((fun x => Option.none) positive) fun val => Option.casesOn positive ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1)) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (Option.casesOn second ((fun x => Option.none) positive) fun val => Option.casesOn positive ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1)) val) (Option.rec ((fun x => Option.none) positive) (fun val => (fun val => Option.casesOn positive ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1) val) first)))))

Logical form (Lean):

```lean
theorem ordered_semiring_structure :
    (∀ value, nonstrictOrder natural_data (zero natural_data) value) ∧
    (∀ first second,
      strictOrder natural_data first second ∨ first = second ∨ strictOrder natural_data second first) ∧
    (∀ first second third,
      strictOrder natural_data first second →
      strictOrder natural_data second third →
      strictOrder natural_data first third) ∧
    (∀ first second translation,
      strictOrder natural_data first second ↔
      strictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation)) ∧
    (∀ first second positive,
      positive ≠ zero natural_data →
      (strictOrder natural_data first second ↔
        strictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem ordered_semiring_structure :
    (∀ value, nonstrictOrder natural_data (zero natural_data) value) ∧
    (∀ first second,
      strictOrder natural_data first second ∨ first = second ∨ strictOrder natural_data second first) ∧
    (∀ first second third,
      strictOrder natural_data first second →
      strictOrder natural_data second third →
      strictOrder natural_data first third) ∧
    (∀ first second translation,
      strictOrder natural_data first second ↔
      strictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation)) ∧
    (∀ first second positive,
      positive ≠ zero natural_data →
      (strictOrder natural_data first second ↔
        strictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive))) := by
  sorry

/--
`nonstrict_order_refl` TODO

Predicate logic:

  ∀ value, nonstrictOrder natural_data value value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (value : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) value) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) value) val) value) (value = value)

Logical form (Lean):

```lean
theorem nonstrict_order_refl :
    ∀ value, nonstrictOrder natural_data value value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem nonstrict_order_refl :
    ∀ value, nonstrictOrder natural_data value value := by

  sorry

/--
`nonstrict_order_trans` TODO

Predicate logic:

  ∀ first second third, nonstrictOrder natural_data first second → nonstrictOrder natural_data second third → nonstrictOrder natural_data first third

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second third : Option Element), (Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second) ∧ Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) third) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) third) val) second) (second = third)) → Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) third) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) third) val) first) (first = third)

Logical form (Lean):

```lean
theorem nonstrict_order_trans :
    ∀ first second third,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second third →
      nonstrictOrder natural_data first third
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem nonstrict_order_trans :
    ∀ first second third,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second third →
      nonstrictOrder natural_data first third := by
  sorry

/--
`nonstrict_order_antisymm` TODO

Predicate logic:

  ∀ first second, nonstrictOrder natural_data first second → nonstrictOrder natural_data second first → first = second

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second : Option Element), (Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second) ∧ Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) first) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) first) val) second) (second = first)) → first = second

Logical form (Lean):

```lean
theorem nonstrict_order_antisymm :
    ∀ first second,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second first →
      first = second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem nonstrict_order_antisymm :
    ∀ first second,
      nonstrictOrder natural_data first second →
      nonstrictOrder natural_data second first →
      first = second := by
  sorry

/--
`nonstrict_order_total` TODO

Predicate logic:

  ∀ first second, nonstrictOrder natural_data first second ∨ nonstrictOrder natural_data second first

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second : Option Element), Or (Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second)) (Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) first) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) first) val) second) (second = first))

Logical form (Lean):

```lean
theorem nonstrict_order_total :
    ∀ first second,
      nonstrictOrder natural_data first second ∨
        nonstrictOrder natural_data second first
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
theorem nonstrict_order_total :
    ∀ first second,
      nonstrictOrder natural_data first second ∨
        nonstrictOrder natural_data second first := by
  sorry

/--
`addition_preserves_nonstrict_order` TODO

Predicate logic:

  ∀ first second translation, nonstrictOrder natural_data first second → nonstrictOrder natural_data (addition natural_data first translation) (addition natural_data second translation)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second translation : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second) → Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second translation (fun right => right) (fun left => left) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right))) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second translation (fun right => right) (fun left => left) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right))) val) (Option.casesOn first ((fun right => right) translation) fun val => Option.casesOn translation ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) (Option.rec ((fun right => right) translation) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) translation) val) first = Option.rec ((fun right => right) translation) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) translation) val) second)

Logical form (Lean):

```lean
theorem addition_preserves_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (addition natural_data first translation)
          (addition natural_data second translation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem addition_preserves_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (addition natural_data first translation)
          (addition natural_data second translation) := by
  sorry

/--
`addition_preserves_and_reflects_nonstrict_order` TODO

Predicate logic:

  ∀ first second translation, nonstrictOrder natural_data (addition natural_data first translation) (addition natural_data second translation) ↔ nonstrictOrder natural_data first second

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second translation : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second translation (fun right => right) (fun left => left) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right))) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second translation (fun right => right) (fun left => left) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right))) val) (Option.casesOn first ((fun right => right) translation) fun val => Option.casesOn translation ((fun left => left) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition natural_data.model left right)) val val_1)) (Option.rec ((fun right => right) translation) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) translation) val) first = Option.rec ((fun right => right) translation) (fun val => (fun val => Option.rec ((fun left => left) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) translation) val) second) ↔ Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second)

Logical form (Lean):

```lean
theorem addition_preserves_and_reflects_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation) ↔
      nonstrictOrder natural_data first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem addition_preserves_and_reflects_nonstrict_order :
    ∀ first second translation,
      nonstrictOrder natural_data
        (addition natural_data first translation)
        (addition natural_data second translation) ↔
      nonstrictOrder natural_data first second := by
  sorry

/--
`multiplication_preserves_nonstrict_order` TODO

Predicate logic:

  ∀ first second positive, nonstrictOrder natural_data (zero natural_data) positive → nonstrictOrder natural_data first second → nonstrictOrder natural_data (multiplication natural_data first positive) (multiplication natural_data second positive)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (first second positive : Option Element), (Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) positive) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) positive) val) Option.none) (Option.none = positive) ∧ Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) second) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) second) val) first) (first = second)) → Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second positive (fun x => Option.none) (fun x => Option.none) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right))) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) (LRA.NumberSystems.WholeNumbers.Constructions.Landau.addition.match_1 natural_data (fun x x_1 => LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data) second positive (fun x => Option.none) (fun x => Option.none) fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right))) val) (Option.casesOn first ((fun x => Option.none) positive) fun val => Option.casesOn positive ((fun x => Option.none) (Option.some val)) fun val_1 => (fun left right => Option.some (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication natural_data.model left right)) val val_1)) (Option.rec ((fun x => Option.none) positive) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) positive) val) first = Option.rec ((fun x => Option.none) positive) (fun val => (fun val => Option.rec ((fun x => Option.none) (Option.some val)) (fun val_1 => (fun val_2 => (fun left right => Option.some (Classical.choose ⋯ left right)) val val_2) val_1) positive) val) second)

Logical form (Lean):

```lean
theorem multiplication_preserves_nonstrict_order :
    ∀ first second positive,
      nonstrictOrder natural_data (zero natural_data) positive →
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem multiplication_preserves_nonstrict_order :
    ∀ first second positive,
      nonstrictOrder natural_data (zero natural_data) positive →
      nonstrictOrder natural_data first second →
        nonstrictOrder natural_data
          (multiplication natural_data first positive)
          (multiplication natural_data second positive) := by
  sorry

/--
`well_ordering` TODO

Predicate logic:

  (Carrier natural_data → Prop ∧ ∃ value, subset value) → ∃ least, subset least ∧ ∀ value, subset value → nonstrictOrder natural_data least value

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (subset : Option Element → Prop), (Exists fun value => subset value) → Exists fun least => (subset least ∧ ∀ (value : Option Element), subset value → Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) value) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) value) val) least) (least = value))

Logical form (Lean):

```lean
theorem well_ordering
    (subset : Carrier natural_data → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder natural_data least value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem well_ordering
    (subset : Carrier natural_data → Prop)
    (nonempty : ∃ value, subset value) :
    ∃ least,
      subset least ∧
      ∀ value, subset value → nonstrictOrder natural_data least value := by
  sorry

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
