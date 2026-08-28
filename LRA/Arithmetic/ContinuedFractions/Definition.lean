import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.Arithmetic.ContinuedFractions

open LRA.NumberSystems.Integers.Interface.ModelTheory

universe u

/--
`FiniteSimpleContinuedFraction` TODO

Predicate logic:

  structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier

Predicate logic (unfolded):

  structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier
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
structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier

/--
`InfiniteSimpleContinuedFraction` TODO

Predicate logic:

  def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier

Predicate logic (unfolded):

  def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier
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
def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier

/--
`IsCanonicalSimpleContinuedFraction` TODO

Predicate logic:

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : LRA.Arithmetic.ContinuedFractions.FiniteSimpleContinuedFraction integerModel), (∀ (coefficient : integerModel.Carrier), List.instMembership.mem fraction.Tail coefficient → integerModel.ltInst.lt 0 coefficient ∧ Or (fraction.Tail = List.nil) (Exists fun initialSegment => Exists fun last => (fraction.Tail = instHAppendOfAppend.hAppend initialSegment (List.cons last List.nil) ∧ integerModel.ltInst.lt 1 last)))

Predicate logic (unfolded):

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : LRA.Arithmetic.ContinuedFractions.FiniteSimpleContinuedFraction integerModel), (∀ (coefficient : integerModel.1), List.instMembership.1 fraction.2 coefficient → integerModel.ltInst.1 integerModel.zeroInst.1 coefficient ∧ Or (fraction.2 = List.nil) (Exists fun initialSegment => Exists fun last => (fraction.2 = instHAppendOfAppend.1 initialSegment (List.cons last List.nil) ∧ integerModel.ltInst.1 integerModel.oneInst.1 last)))

Logical form (Lean):

```lean
def IsCanonicalSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : FiniteSimpleContinuedFraction integerModel) : Prop :=
  (∀ coefficient ∈ fraction.Tail, 0 < coefficient) ∧
    (fraction.Tail = [] ∨
      ∃ initialSegment : List integerModel.Carrier,
        ∃ last : integerModel.Carrier,
          fraction.Tail = initialSegment ++ [last] ∧ 1 < last)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use, unfold

-/
def IsCanonicalSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : FiniteSimpleContinuedFraction integerModel) : Prop :=
  (∀ coefficient ∈ fraction.Tail, 0 < coefficient) ∧
    (fraction.Tail = [] ∨
      ∃ initialSegment : List integerModel.Carrier,
        ∃ last : integerModel.Carrier,
          fraction.Tail = initialSegment ++ [last] ∧ 1 < last)

/--
`IsProperInfiniteSimpleContinuedFraction` TODO

Predicate logic:

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction integerModel) (index : Nat), integerModel.ltInst.lt 0 (fraction (instHAdd.hAdd index 1))

Predicate logic (unfolded):

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : Nat → integerModel.1) (index : Nat), integerModel.ltInst.1 integerModel.zeroInst.1 (fraction (instHAdd.1 index (instOfNatNat 1).1))

Logical form (Lean):

```lean
def IsProperInfiniteSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∀ index : Nat, 0 < fraction (index + 1)
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
def IsProperInfiniteSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∀ index : Nat, 0 < fraction (index + 1)

/--
`IsEventuallyPeriodic` TODO

Predicate logic:

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction integerModel), Exists fun start => Exists fun period => (Ne period 0 ∧ ∀ (index : Nat), instLENat.le start index → fraction (instHAdd.hAdd index period) = fraction index)

Predicate logic (unfolded):

  ∀ {integerModel : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel} (fraction : Nat → integerModel.1), Exists fun start => Exists fun period => (period = instOfNatNat 0.1 → False ∧ ∀ (index : Nat), instLENat.1 start index → fraction (instHAdd.1 index period) = fraction index)

Logical form (Lean):

```lean
def IsEventuallyPeriodic
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index
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
def IsEventuallyPeriodic
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index

end LRA.Arithmetic.ContinuedFractions
