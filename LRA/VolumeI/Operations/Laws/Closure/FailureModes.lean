import LRA.VolumeI.Operations.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

/-- Failure of a binary closure claim. -/
def FailsBinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left -> Prop)
    (rightCarrier : Right -> Prop)
    (resultCarrier : Codomain -> Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  Not (BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)

/-- Odd natural numbers, used as a concrete closure failure carrier. -/
def OddNaturalCarrier (number : Nat) : Prop :=
  number % 2 = 1

/-- Natural-number addition as a concrete operation for closure failures. -/
def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Failure Mode — OddNaturalAdditionFailsClosure]**

Odd natural numbers are not closed under natural-number addition.
-/
theorem OddNaturalAdditionFailsClosure :
    FailsBinaryClosedUnder
      OddNaturalCarrier
      OddNaturalCarrier
      OddNaturalCarrier
      NaturalAdditionForClosureFailure := by
  sorry

end LRA.Operation.Laws.Closure
