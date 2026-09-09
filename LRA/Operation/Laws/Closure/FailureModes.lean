import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

/--
`FailsBinaryClosedUnder` TODO

Predicate logic:

  ∀ {Left : Type u} {Right : Type v} {Codomain : Type w} (leftCarrier : Left → Prop) (rightCarrier : Right → Prop) (resultCarrier : Codomain → Prop) (operation : LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain), LRA.Operation.Laws.Closure.BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left : Left) (right : Right), leftCarrier left → rightCarrier right → resultCarrier (operation left right)) → False

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instHMod.1 number 2 = 1

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

  LRA.Operation.Laws.Closure.FailsBinaryClosedUnder LRA.Operation.Laws.Closure.OddNaturalCarrier LRA.Operation.Laws.Closure.OddNaturalCarrier LRA.Operation.Laws.Closure.OddNaturalCarrier LRA.Operation.Laws.Closure.NaturalAdditionForClosureFailure

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (left right : Nat), instHMod.1 left 2 = 1 → instHMod.1 right 2 = 1 → instHMod.1 (instHAdd.hAdd left right) 2 = 1) → False

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
