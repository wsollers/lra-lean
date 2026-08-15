import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u v

/--
`FailsSupremumUniqueness`

Statement: Supremum uniqueness fails when a subset has two distinct suprema.

Logical form: `Exists fun first => Exists fun second => first ≠ second ∧ Supremum relation subset first ∧ Supremum relation subset second`.
-/
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second

/--
`SupremaNeedNotBeUniqueInPreorder`

Statement: Antisymmetry is necessary for uniqueness; in the universal Boolean
preorder both distinct elements are suprema of the full subset.

Logical form: `Preorder (fun _ _ : Bool => True) ∧ FailsSupremumUniqueness (fun _ _ : Bool => True) (Set.univ : Set Bool)`.
-/
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool) := by
  sorry

/--
`ComplementSupremumFormulaFails` records the discrete failure in which a set
has a supremum but its complement has none.

Logical form: `(∃ s, Supremum relation subset s) ∧ ¬ ∃ t, Supremum relation (complement subset) t`.
-/
def ComplementSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists supremum, Supremum relation subset supremum) /\
    Not (exists supremum, Supremum relation (complement subset) supremum)

/--
`IntegerSingletonComplementHasNoSupremum` proves that complementation has no
general supremum formula: `{0}` has supremum `0`, while its integer complement
is unbounded above and has no integer supremum.

Logical form: `ComplementSupremumFormulaFails (· ≤ ·) Set.compl ({0} : Set ℤ)`.
-/
theorem IntegerSingletonComplementHasNoSupremum :
    ComplementSupremumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

/--
`DifferenceSupremumFormulaFails` records the discrete failure in which both
operands have suprema but their relative difference has none.

Logical form: `(∃ s, Supremum relation left s) ∧ (∃ t, Supremum relation removed t) ∧ ¬ ∃ d, Supremum relation (left \ removed) d`.
-/
def DifferenceSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists supremum, Supremum relation left supremum) /\
    (exists supremum, Supremum relation removed supremum) /\
      Not (exists supremum, Supremum relation (left \ removed) supremum)

/--
`IntegerSingletonDifferenceHasNoSupremum` proves that the two operand suprema do
not determine a supremum of their difference: `{0} \ {0}` is empty.

Logical form: `DifferenceSupremumFormulaFails (· ≤ ·) ({0} : Set ℤ) ({0} : Set ℤ)`.
-/
theorem IntegerSingletonDifferenceHasNoSupremum :
    DifferenceSupremumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order
