import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers

variable {rationalSystem : RationalNumberSystem}

/--
`representative_addition_cauchy_at_precision` TODO

Predicate logic:

  ∀ precision firstIndex secondIndex : Nat, max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex → max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex → let difference

Predicate logic (unfolded):

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem) (precision firstIndex secondIndex : Nat), (instLENat.1 (Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1))) firstIndex ∧ instLENat.1 (Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1))) secondIndex) → have difference := instHAdd.hAdd (instHAdd.hAdd (first.Approximate firstIndex) (second.Approximate firstIndex)) (rationalSystem.FieldModel.negInst.neg (instHAdd.hAdd (first.Approximate secondIndex) (second.Approximate secondIndex))); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
theorem representative_addition_cauchy_at_precision
    (first second : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex →
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex →
        let difference :=
          (first.Approximate firstIndex + second.Approximate firstIndex) +
            -(first.Approximate secondIndex + second.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision
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
theorem representative_addition_cauchy_at_precision
    (first second : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex →
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex →
        let difference :=
          (first.Approximate firstIndex + second.Approximate firstIndex) +
            -(first.Approximate secondIndex + second.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision := by
  sorry
/--
`representative_addition` TODO

Predicate logic:

  def representative_addition
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index + second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_addition_cauchy_at_precision first second

Predicate logic (unfolded):

  def representative_addition
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index + second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_addition_cauchy_at_precision first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index + second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_addition_cauchy_at_precision first second
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
def representative_addition
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index + second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_addition_cauchy_at_precision first second

/--
`representative_negation_cauchy_at_precision` TODO

Predicate logic:

  ∀ precision firstIndex secondIndex : Nat, representative.Modulus precision ≤ firstIndex → representative.Modulus precision ≤ secondIndex → let difference

Predicate logic (unfolded):

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (representative : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem) (precision firstIndex secondIndex : Nat), (instLENat.1 (representative.2 precision) firstIndex ∧ instLENat.1 (representative.2 precision) secondIndex) → have difference := instHAdd.hAdd (rationalSystem.FieldModel.negInst.neg (representative.Approximate firstIndex)) (rationalSystem.FieldModel.negInst.neg (rationalSystem.FieldModel.negInst.neg (representative.Approximate secondIndex))); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
theorem representative_negation_cauchy_at_precision
    (representative : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      representative.Modulus precision ≤ firstIndex →
      representative.Modulus precision ≤ secondIndex →
        let difference :=
          (-representative.Approximate firstIndex) +
            -(-representative.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision
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
theorem representative_negation_cauchy_at_precision
    (representative : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      representative.Modulus precision ≤ firstIndex →
      representative.Modulus precision ≤ secondIndex →
        let difference :=
          (-representative.Approximate firstIndex) +
            -(-representative.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision := by
  sorry
/--
`representative_negation` TODO

Predicate logic:

  def representative_negation
    (representative : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => -representative.Approximate index
  Modulus := representative.Modulus
  CauchyAtPrecision := representative_negation_cauchy_at_precision representative

Predicate logic (unfolded):

  def representative_negation
    (representative : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => -representative.Approximate index
  Modulus := representative.Modulus
  CauchyAtPrecision := representative_negation_cauchy_at_precision representative (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation
    (representative : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => -representative.Approximate index
  Modulus := representative.Modulus
  CauchyAtPrecision := representative_negation_cauchy_at_precision representative
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
def representative_negation
    (representative : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => -representative.Approximate index
  Modulus := representative.Modulus
  CauchyAtPrecision := representative_negation_cauchy_at_precision representative

/--
`representative_multiplication_cauchy_at_precision` TODO

Predicate logic:

  ∀ precision firstIndex secondIndex : Nat, max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex → max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex → let difference

Predicate logic (unfolded):

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem) (precision firstIndex secondIndex : Nat), (instLENat.1 (Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1))) firstIndex ∧ instLENat.1 (Nat.instMax.1 (first.2 (instHAdd.1 precision (instOfNatNat 1).1)) (second.2 (instHAdd.1 precision (instOfNatNat 1).1))) secondIndex) → have difference := instHAdd.hAdd (instHMul.hMul (first.Approximate firstIndex) (second.Approximate firstIndex)) (rationalSystem.FieldModel.negInst.neg (instHMul.hMul (first.Approximate secondIndex) (second.Approximate secondIndex))); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
theorem representative_multiplication_cauchy_at_precision
    (first second : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex →
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex →
        let difference :=
          (first.Approximate firstIndex * second.Approximate firstIndex) +
            -(first.Approximate secondIndex * second.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision
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
theorem representative_multiplication_cauchy_at_precision
    (first second : EffectiveCauchyApproximation rationalSystem) :
    ∀ precision firstIndex secondIndex : Nat,
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ firstIndex →
      max (first.Modulus (precision + 1)) (second.Modulus (precision + 1)) ≤ secondIndex →
        let difference :=
          (first.Approximate firstIndex * second.Approximate firstIndex) +
            -(first.Approximate secondIndex * second.Approximate secondIndex);
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision := by
  sorry
/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index * second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_multiplication_cauchy_at_precision first second

Predicate logic (unfolded):

  def representative_multiplication
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index * second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_multiplication_cauchy_at_precision first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index * second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_multiplication_cauchy_at_precision first second
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
def representative_multiplication
    (first second : EffectiveCauchyApproximation rationalSystem) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun index => first.Approximate index * second.Approximate index
  Modulus := fun precision => max (first.Modulus (precision + 1)) (second.Modulus (precision + 1))
  CauchyAtPrecision := representative_multiplication_cauchy_at_precision first second

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
