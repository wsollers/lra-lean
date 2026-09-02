
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

/--
`Equivalent` TODO

Predicate logic:

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem) (precision : Nat), Exists fun index => ∀ (n : Nat), GE.ge n index → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Predicate logic (unfolded):

  ∀ {rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem} (first second : LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyApproximation rationalSystem) (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
def Equivalent
    {rationalSystem : RationalNumberSystem.{u}}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat, ∀ n ≥ index,
      let difference := first.Approximate n + -second.Approximate n;
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

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def Equivalent
    {rationalSystem : RationalNumberSystem.{u}}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat, ∀ n ≥ index,
      let difference := first.Approximate n + -second.Approximate n;
      -PrecisionRadius rationalSystem precision < difference ∧
        difference < PrecisionRadius rationalSystem precision

/--
`EquivalentIsEquivalence` TODO

Predicate logic:

  Equivalence (@Equivalent rationalSystem)

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem), Equivalence fun first second => ∀ (precision : Nat), Exists fun index => ∀ (n : Nat), instLENat.1 index n → have difference := instHAdd.hAdd (first.Approximate n) (rationalSystem.FieldModel.negInst.neg (second.Approximate n)); (rationalSystem.FieldModel.ltInst.lt (rationalSystem.FieldModel.negInst.neg (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision)) difference ∧ rationalSystem.FieldModel.ltInst.lt difference (LRA.NumberSystems.RealNumbers.EffectiveCauchy.PrecisionRadius rationalSystem precision))

Logical form (Lean):

```lean
theorem EquivalentIsEquivalence
    (rationalSystem : RationalNumberSystem.{u}) :
    Equivalence (@Equivalent rationalSystem)
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
theorem EquivalentIsEquivalence
    (rationalSystem : RationalNumberSystem.{u}) :
    Equivalence (@Equivalent rationalSystem) := by
  sorry
/--
`ApproximationSetoid` TODO

Predicate logic:

  def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem

Predicate logic (unfolded):

  def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem
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
def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem

/--
`EffectiveCauchyReal` TODO

Predicate logic:

  abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem)

Predicate logic (unfolded):

  abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem)
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
abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem)

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
