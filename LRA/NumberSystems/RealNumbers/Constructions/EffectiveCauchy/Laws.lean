import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy
open LRA.NumberSystems.RationalNumbers

/--
`rational_embedding_cauchy_at_precision` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem ∀ value ∈ rationalSystem.FieldModel.Carrier), ∀ precision firstIndex secondIndex : Nat, 0 ≤ firstIndex → 0 ≤ secondIndex → let difference

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (value : rationalSystem.FieldModel.1) (precision firstIndex secondIndex : Nat), (instLENat.1 (instOfNatNat 0).1 firstIndex ∧ instLENat.1 (instOfNatNat 0).1 secondIndex) → have difference := instHAdd.hAdd value (rationalSystem.FieldModel.negInst.neg value); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
theorem rational_embedding_cauchy_at_precision
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    ∀ precision firstIndex secondIndex : Nat,
      0 ≤ firstIndex →
      0 ≤ secondIndex →
        let difference := value + -value;
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
theorem rational_embedding_cauchy_at_precision
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    ∀ precision firstIndex secondIndex : Nat,
      0 ≤ firstIndex →
      0 ≤ secondIndex →
        let difference := value + -value;
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision := by
  sorry
/--
`rational_embedding` TODO

Predicate logic:

  noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun _ => value
  Modulus := fun _ => 0
  CauchyAtPrecision := rational_embedding_cauchy_at_precision rationalSystem value

Predicate logic (unfolded):

  noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun _ => value
  Modulus := fun _ => 0
  CauchyAtPrecision := rational_embedding_cauchy_at_precision rationalSystem value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun _ => value
  Modulus := fun _ => 0
  CauchyAtPrecision := rational_embedding_cauchy_at_precision rationalSystem value
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
noncomputable def rational_embedding
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.Carrier) :
    EffectiveCauchyApproximation rationalSystem where
  Approximate := fun _ => value
  Modulus := fun _ => 0
  CauchyAtPrecision := rational_embedding_cauchy_at_precision rationalSystem value

/--
`zero` TODO

Predicate logic:

  noncomputable def zero
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 0

Predicate logic (unfolded):

  noncomputable def zero
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def zero
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 0
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
noncomputable def zero
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 0

/--
`one` TODO

Predicate logic:

  noncomputable def one
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 1

Predicate logic (unfolded):

  noncomputable def one
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def one
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 1
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
noncomputable def one
    (rationalSystem : RationalNumberSystem) : EffectiveCauchyApproximation rationalSystem :=
  rational_embedding rationalSystem 1

/--
`representative_strict_order` TODO

Predicate logic:

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), Exists fun precision => Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → rationalSystem.FieldModel.leInst.le (instHAdd.hAdd (first.Approximate index) (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) (second.Approximate index)

Predicate logic (unfolded):

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), Exists fun precision => Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.leInst.1 (instHAdd.1 (first.1 index) (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) (second.1 index)

Logical form (Lean):

```lean
def representative_strict_order
    {rationalSystem : RationalNumberSystem}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∃ precision threshold : Nat,
    ∀ index : Nat, threshold ≤ index →
      first.Approximate index + PrecisionRadius rationalSystem precision ≤
        second.Approximate index
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def representative_strict_order
    {rationalSystem : RationalNumberSystem}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∃ precision threshold : Nat,
    ∀ index : Nat, threshold ≤ index →
      first.Approximate index + PrecisionRadius rationalSystem precision ≤
        second.Approximate index

/--
`representative_strict_order_respects_equivalence` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.UniversalAlgebra.Quotient.relation_respects (ApproximationSetoid rationalSystem) (representative_strict_order rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (first_representative first_replacement second_representative second_replacement : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem), ((LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 first_representative first_replacement ∧ (LRA.NumberSystems.RealNumbers.EffectiveCauchy.ApproximationSetoid rationalSystem).1 second_representative second_replacement) → Exists fun precision => Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.leInst.1 (instHAdd.1 (first_representative.1 index) (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) (second_representative.1 index) ↔ Exists fun precision => Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.leInst.1 (instHAdd.1 (first_replacement.1 index) (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) (second_replacement.1 index)

Logical form (Lean):

```lean
theorem representative_strict_order_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem))
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
theorem representative_strict_order_respects_equivalence
    (rationalSystem : RationalNumberSystem) :
    LRA.UniversalAlgebra.Quotient.relation_respects
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem)) := by
  sorry
/--
`strict_order_is_proper` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), LRA.Operation.Laws.QuotientCompatible.RelationIsProper (ApproximationSetoid rationalSystem) (representative_strict_order rationalSystem ∈ = rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), LRA.Operation.Laws.QuotientCompatible.RelationIsProper { r := fun first second => ∀ (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)), iseqv := ⋯ } fun first second => Exists fun precision => Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rationalSystem.FieldModel.leInst.1 (instHAdd.1 (first.1 index) (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) (second.1 index)

Logical form (Lean):

```lean
theorem strict_order_is_proper
    (rationalSystem : RationalNumberSystem) :
    LRA.Operation.Laws.QuotientCompatible.RelationIsProper
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem))
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
theorem strict_order_is_proper
    (rationalSystem : RationalNumberSystem) :
    LRA.Operation.Laws.QuotientCompatible.RelationIsProper
      (ApproximationSetoid rationalSystem)
      (representative_strict_order (rationalSystem := rationalSystem)) := by
  sorry
