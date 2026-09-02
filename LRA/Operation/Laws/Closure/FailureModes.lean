import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

/--
`FailsBinaryClosedUnder` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (leftCarrier : Left → Prop) (rightCarrier : Right → Prop) (resultCarrier : Codomain → Prop) (operation : LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain), LRA.Operation.Laws.Closure.BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation → False

Predicate logic (unfolded):

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (leftCarrier : Left → Prop) (rightCarrier : Right → Prop) (resultCarrier : Codomain → Prop) (operation : Left → Right → Codomain), (∀ (left : Left) (right : Right), leftCarrier left → rightCarrier right → resultCarrier (operation left right)) → False

Logical form (Lean):

```lean
def FailsBinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  Not (BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)
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
def FailsBinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  Not (BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)

/--
`OddNaturalCarrier` TODO

Predicate logic:

  ∀ (number : Nat), instHMod.hMod number 2 = 1

Predicate logic (unfolded):

  ∀ (number : Nat), instHMod.1 number (instOfNatNat 2).1 = instOfNatNat 1.1

Logical form (Lean):

```lean
def OddNaturalCarrier (number : Nat) : Prop :=
  number % 2 = 1
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
def OddNaturalCarrier (number : Nat) : Prop :=
  number % 2 = 1

/--
`NaturalAdditionForClosureFailure` TODO

Predicate logic:

  def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

Predicate logic (unfolded):

  def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right
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
def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
`OddNaturalAdditionFailsClosure` TODO

Predicate logic:

  FailsBinaryClosedUnder OddNaturalCarrier OddNaturalCarrier OddNaturalCarrier NaturalAdditionForClosureFailure

Predicate logic (unfolded):

  (∀ (left right : Nat), instHMod.1 left (instOfNatNat 2).1 = instOfNatNat 1.1 → instHMod.1 right (instOfNatNat 2).1 = instOfNatNat 1.1 → instHMod.1 (instHAdd.hAdd left right) (instOfNatNat 2).1 = instOfNatNat 1.1) → False

Logical form (Lean):

```lean
theorem OddNaturalAdditionFailsClosure :
    FailsBinaryClosedUnder
      OddNaturalCarrier
      OddNaturalCarrier
      OddNaturalCarrier
      NaturalAdditionForClosureFailure
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
theorem OddNaturalAdditionFailsClosure :
    FailsBinaryClosedUnder
      OddNaturalCarrier
      OddNaturalCarrier
      OddNaturalCarrier
      NaturalAdditionForClosureFailure := by
  sorry
end LRA.Operation.Laws.Closure
