import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Integers.Interface.ModelTheory

universe u

/--
`NaturalNumeral` `NaturalNumeral model n` is the image of the natural number `n` in `model.Carrier` under the unique semiring homomorphism from `Nat`: `0 ↦ 0` and `n + 1 ↦ NaturalNumeral model n + 1`.

Predicate logic:

  def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
    | 0 => 0
    | n + 1 => NaturalNumeral model n + 1

Predicate logic (unfolded):

  def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
    | 0 => 0
    | n + 1 => NaturalNumeral model n + 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
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
def NaturalNumeral (model : IntegerModel) : Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

/--
`IntegerNumeral` `IntegerNumeral model n` is the image of the integer `n` in `model.Carrier` under the unique ring homomorphism from `Int`: nonnegative integers via `NaturalNumeral`, negative integers via `neg`.

Predicate logic:

  def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
    | Int.ofNat n => NaturalNumeral model n
    | Int.negSucc n => -(NaturalNumeral model (n + 1))

Predicate logic (unfolded):

  def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
    | Int.ofNat n => NaturalNumeral model n
    | Int.negSucc n => -(NaturalNumeral model (n + 1)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
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
def IntegerNumeral (model : IntegerModel) : Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

/--
`IntegerNumberSystem` An `IntegerNumberSystem` is an `IntegerModel` in which every element is the image of some integer under `IntegerNumeral` — the model realizes ℤ and nothing more.

Predicate logic:

  structure IntegerNumberSystem : Type (u + 1) where
    Model : IntegerModel.{u}
    EveryElementIsIntegerNumeral :
      ∀ value : Model.Carrier,
        ∃ integer : Int, IntegerNumeral Model integer = value

Predicate logic (unfolded):

  structure IntegerNumberSystem : Type (u + 1) where
    Model : IntegerModel.{u}
    EveryElementIsIntegerNumeral :
      ∀ value : Model.Carrier,
        ∃ integer : Int, IntegerNumeral Model integer = value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerNumberSystem : Type (u + 1) where
  Model : IntegerModel.{u}
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
  Model : IntegerModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

/--
`IntegerNumeralIsSurjective` `IntegerNumeral` is surjective onto any `IntegerNumberSystem`'s carrier.

Predicate logic:

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem) (value : integerSystem.Model.Carrier), Exists fun integer => LRA.NumberSystems.Integers.IntegerNumeral integerSystem.Model integer = value

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    integerSystem : IntegerNumberSystem.{u}
  Prove
    Exists fun integer => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.4.neg (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) a) a) integer = value

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
`IntegerNumeralIsInjective` `IntegerNumeral` is injective on any `IntegerNumberSystem`'s carrier.

Predicate logic:

  ∀ (integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem) (first second : Int), LRA.NumberSystems.Integers.IntegerNumeral integerSystem.Model first = LRA.NumberSystems.Integers.IntegerNumeral integerSystem.Model second → first = second

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    integerSystem : IntegerNumberSystem.{u}
  Prove
    Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.4.neg (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) a) a) first = Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 n) a) a) (fun a => (fun a => (fun n => integerSystem.Model.4.neg (LRA.NumberSystems.Integers.NaturalNumeral integerSystem.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))) a) a) second → first = second

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
