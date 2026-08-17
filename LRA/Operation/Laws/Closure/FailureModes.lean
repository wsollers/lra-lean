import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

def FailsBinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  Not (BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)

def OddNaturalCarrier (number : Nat) : Prop :=
  number % 2 = 1

def NaturalAdditionForClosureFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

theorem OddNaturalAdditionFailsClosure :
    FailsBinaryClosedUnder
      OddNaturalCarrier
      OddNaturalCarrier
      OddNaturalCarrier
      NaturalAdditionForClosureFailure := by
  sorry

end LRA.Operation.Laws.Closure
