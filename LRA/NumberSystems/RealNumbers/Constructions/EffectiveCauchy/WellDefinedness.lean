import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Operations
import LRA.Operation.Laws.QuotientCompatible.Definition

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers
open LRA.Operation.Laws.QuotientCompatible

/-!
`EffectiveCauchyApproximation` has no separate raw/promoted split —
`representative_addition`/`_negation`/`_multiplication` are already total
functions on it directly (like `Dedekind.Cut`, unlike `Cauchy.Representative`).
So `BinaryOperationIsProper`/`UnaryOperationIsProper` apply here in their
degenerate form (`Raw := Representative`, `toRaw := id`,
`invariant := fun _ => True`, documented in
`Operation/Laws/QuotientCompatible/Definition.lean`): `closed` is
`trivial` and `matches_raw` is `rfl` in every instance below, since
there's nothing to reconstruct.
-/

/--
`representative_addition_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.binary_operation_respects (ApproximationSetoid rationalSystem) (representative_addition rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), ((LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 { Approximate := fun index => instHAdd.1 (first_representative.1 index) (second_representative.1 index), Modulus := fun precision => Nat.instMax.1 (first_representative.2 (instHAdd.1 precision 1)) (second_representative.2 (instHAdd.1 precision 1)), CauchyAtPrecision := ⋯ } { Approximate := fun index => instHAdd.1 (first_replacement.1 index) (second_replacement.1 index), Modulus := fun precision => Nat.instMax.1 (first_replacement.2 (instHAdd.1 precision 1)) (second_replacement.2 (instHAdd.1 precision 1)), CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem))
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
theorem representative_addition_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem)) := by
  sorry
/--
`addition_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), BinaryOperationIsProper fun _ ∈ EffectiveCauchyApproximation rationalSystem => True id (representative_addition rationalSystem ∈ = rationalSystem) (ApproximationSetoid rationalSystem) (representative_addition rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun x => True) (fun a => a) (fun first second => { Approximate := fun index => instHAdd.1 (first.1 index) (second.1 index), Modulus := fun precision => Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1)), CauchyAtPrecision := ⋯ }) { r := fun first second => ∀ (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)), iseqv := ⋯ } fun first second => { Approximate := fun index => instHAdd.1 (first.1 index) (second.1 index), Modulus := fun precision => Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1)), CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem addition_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_addition (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem))
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
theorem addition_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_addition (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_addition (rationalSystem := rationalSystem)) := by
  sorry
/--
`representative_negation_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.unary_operation_respects (ApproximationSetoid rationalSystem) (representative_negation rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first_representative second_representative : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 first_representative second_representative → (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 { Approximate := fun index => rationalSystem.FieldModel.negInst.1 (first_representative.1 index), Modulus := first_representative.2, CauchyAtPrecision := ⋯ } { Approximate := fun index => rationalSystem.FieldModel.negInst.1 (second_representative.1 index), Modulus := second_representative.2, CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem))
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
theorem representative_negation_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem)) := by
  sorry
/--
`negation_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), UnaryOperationIsProper fun _ ∈ EffectiveCauchyApproximation rationalSystem => True id (representative_negation rationalSystem ∈ = rationalSystem) (ApproximationSetoid rationalSystem) (representative_negation rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Operation.Laws.QuotientCompatible.UnaryOperationIsProper (fun x => True) (fun a => a) (fun representative => { Approximate := fun index => rationalSystem.FieldModel.negInst.1 (representative.1 index), Modulus := representative.2, CauchyAtPrecision := ⋯ }) { r := fun first second => ∀ (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)), iseqv := ⋯ } fun representative => { Approximate := fun index => rationalSystem.FieldModel.negInst.1 (representative.1 index), Modulus := representative.2, CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem negation_is_proper
    (rationalSystem : RationalNumberSystem) :
    UnaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_negation (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem))
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
theorem negation_is_proper
    (rationalSystem : RationalNumberSystem) :
    UnaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_negation (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_negation (rationalSystem := rationalSystem)) := by
  sorry
/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.binary_operation_respects (ApproximationSetoid rationalSystem) (representative_multiplication rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), ((LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 second_representative second_replacement) → (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 { Approximate := fun index => instHMul.1 (first_representative.1 index) (second_representative.1 index), Modulus := fun precision => Nat.instMax.1 (first_representative.2 (instHAdd.1 precision 1)) (second_representative.2 (instHAdd.1 precision 1)), CauchyAtPrecision := ⋯ } { Approximate := fun index => instHMul.1 (first_replacement.1 index) (second_replacement.1 index), Modulus := fun precision => Nat.instMax.1 (first_replacement.2 (instHAdd.1 precision 1)) (second_replacement.2 (instHAdd.1 precision 1)), CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem))
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
theorem representative_multiplication_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem)) := by
  sorry
/--
`multiplication_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), BinaryOperationIsProper fun _ ∈ EffectiveCauchyApproximation rationalSystem => True id (representative_multiplication rationalSystem ∈ = rationalSystem) (ApproximationSetoid rationalSystem) (representative_multiplication rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Operation.Laws.QuotientCompatible.BinaryOperationIsProper (fun x => True) (fun a => a) (fun first second => { Approximate := fun index => instHMul.1 (first.1 index) (second.1 index), Modulus := fun precision => Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1)), CauchyAtPrecision := ⋯ }) { r := fun first second => ∀ (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)), iseqv := ⋯ } fun first second => { Approximate := fun index => instHMul.1 (first.1 index) (second.1 index), Modulus := fun precision => Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1)), CauchyAtPrecision := ⋯ }

Logical form (Lean):

```lean
theorem multiplication_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_multiplication (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem))
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
theorem multiplication_is_proper
    (rationalSystem : RationalNumberSystem) :
    BinaryOperationIsProper
      (fun _ : EffectiveCauchyApproximation rationalSystem => True)
      id
      (representative_multiplication (rationalSystem := rationalSystem))
      (ApproximationSetoid rationalSystem)
      (representative_multiplication (rationalSystem := rationalSystem)) := by
  sorry
