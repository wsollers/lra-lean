import LRA.Order.Bounds.Cofinal.Definition
import LRA.Set.PredicateSet.Definition

namespace LRA.AlgebraicStructures

universe u

def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x

def Multiples {R : Type u} [Add R] (x : R) : LRA.Set.PredicateSet R :=
  fun y => exists n : Nat, y = IteratedSelfSum n x

class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)

section Wrappers

variable {R : Type u}

theorem MultiplesAreCofinal
    [Add R] [LT R] [OfNat R 0] [ArchimedeanLaw R] :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x) := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
