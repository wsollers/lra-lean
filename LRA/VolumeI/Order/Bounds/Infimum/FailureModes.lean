import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Infimum.Definition

namespace LRA.Order

universe u v

/--
`FailsInfimum`

Statement: A represented subset fails to have an infimum when no element satisfies the predicate.

Logical form: `Not (Exists fun candidate => Infimum relation subset candidate)`.
-/
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)

section IntegerEmptySet

/--
`EmptyIntegerSetFailsInfimum`

Statement: The empty set has no infimum in the integers, which have no top element.

Logical form: `FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int)`.
-/
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int) := by
  sorry

end IntegerEmptySet

/--
`ComplementInfimumFormulaFails` records the discrete failure in which a set
has an infimum but its complement has none.

Logical form: `(∃ i, Infimum relation subset i) ∧ ¬ ∃ j, Infimum relation (complement subset) j`.
-/
def ComplementInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists infimum, Infimum relation subset infimum) /\
    Not (exists infimum, Infimum relation (complement subset) infimum)

/--
`IntegerSingletonComplementHasNoInfimum` proves that complementation has no
general infimum formula: `{0}` has infimum `0`, while its integer complement
is unbounded below and has no integer infimum.

Logical form: `ComplementInfimumFormulaFails (· ≤ ·) Set.compl ({0} : Set ℤ)`.
-/
theorem IntegerSingletonComplementHasNoInfimum :
    ComplementInfimumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

/--
`DifferenceInfimumFormulaFails` records the discrete failure in which both
operands have infima but their relative difference has none.

Logical form: `(∃ i, Infimum relation left i) ∧ (∃ j, Infimum relation removed j) ∧ ¬ ∃ d, Infimum relation (left \ removed) d`.
-/
def DifferenceInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists infimum, Infimum relation left infimum) /\
    (exists infimum, Infimum relation removed infimum) /\
      Not (exists infimum, Infimum relation (left \ removed) infimum)

/--
`IntegerSingletonDifferenceHasNoInfimum` proves that the two operand infima do
not determine an infimum of their difference: `{0} \ {0}` is empty.

Logical form: `DifferenceInfimumFormulaFails (· ≤ ·) ({0} : Set ℤ) ({0} : Set ℤ)`.
-/
theorem IntegerSingletonDifferenceHasNoInfimum :
    DifferenceInfimumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order
