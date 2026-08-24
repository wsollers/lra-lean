import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Interface.ModelTheory

universe u

/--
`NaturalNumeral` TODO

Predicate logic:

  def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

Predicate logic (unfolded):

  def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1
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
def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

/--
`IntegerNumeral` TODO

Predicate logic:

  def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

Predicate logic (unfolded):

  def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))
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
def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

/--
`IntegerNumberSystem` TODO

Predicate logic:

  structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

Predicate logic (unfolded):

  structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

/--
`IntegerNumeralIsSurjective` TODO

Predicate logic:

  ∀ value : integerSystem.Model.Carrier, ∃ integer ∈ Int, IntegerNumeral integerSystem.Model integer = value

Predicate logic (unfolded):

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem) (value : integerSystem.Model.1), Exists fun integer => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.negInst.1 (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 (instHAdd.1 n (instOfNatNat 1).1))) a) a) integer = value

Logical form (Lean):

```lean
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value := by

  sorry

/--
`IntegerNumeralIsInjective` TODO

Predicate logic:

  ∀ first second : Int, IntegerNumeral integerSystem.Model first = IntegerNumeral integerSystem.Model second → first = second

Predicate logic (unfolded):

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem) (first second : Int), Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.negInst.1 (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 (instHAdd.1 n (instOfNatNat 1).1))) a) a) first = Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.negInst.1 (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 (instHAdd.1 n (instOfNatNat 1).1))) a) a) second → first = second

Logical form (Lean):

```lean
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
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
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
        first = second := by
  sorry

end LRA.NumberSystems.Integers
