import LRA.Pilot.OrderBounds
import LRA.VolumeIII.RealNumbers.LraReal
import Mathlib.Analysis.Real.Sqrt

/-!
# Order-bound examples

The same real upper-bound fact stated through the explicit LRA `Poset`
interface and through the inferred Lean/Mathlib `PartialOrder` interface.
-/

namespace LRA.Pilot.OrderBounds.Examples

open LRA.Pilot.OrderBounds
open LRA.VolumeIII.RealNumbers

/-- The real numbers whose squares are strictly less than two.

Logical form:

```lean
{x : Real | x ^ 2 - 2 < 0}
```
-/
def SquareBelowTwo : Set Real :=
  {x | x ^ 2 - 2 < 0}

/-! ## Explicit LRA poset -/

/-- Through the explicit LRA interface, `√2` is an upper bound of the real
numbers whose squares are strictly less than two. -/
example :
    UpperBound
      (PosetFromPartialOrder Real)
      SquareBelowTwo
      (Real.sqrt 2) := by
  intro element elementInSubset
  exact Real.le_sqrt_of_sq_le (le_of_lt (sub_neg.mp elementInSubset))

/-! ## Inferred Lean/Mathlib partial order -/

/-- Through the inferred interface, Lean supplies the usual partial order on
`Real`, so the explicit poset argument disappears. -/
example :
    FromPartialOrder.UpperBound
      SquareBelowTwo
      (Real.sqrt 2) := by
  intro element elementInSubset
  exact Real.le_sqrt_of_sq_le (le_of_lt (sub_neg.mp elementInSubset))

/-! ## LRA real wrapper

`LraReal` currently provides cut inclusion only as a `Preorder`.  The local
instance below records the antisymmetry already carried by set inclusion so
that both pilot interfaces can recognize the wrapper as a partial order.  It
is deliberately local: this file is testing the desired connection before a
canonical production declaration is selected.
-/

local instance : PartialOrder LraReal where
  le := fun left right => left.lower ⊆ right.lower
  le_refl value := Set.Subset.refl value.lower
  le_trans _ _ _ leftLeMiddle middleLeRight :=
    Set.Subset.trans leftLeMiddle middleLeRight
  le_antisymm left right leftLeRight rightLeLeft := by
    cases left with
    | mk leftLower leftNonempty leftNotAll leftDownward leftOpenAbove =>
      cases right with
      | mk rightLower rightNonempty rightNotAll rightDownward rightOpenAbove =>
        have lowerSetsEqual : leftLower = rightLower :=
          Set.Subset.antisymm leftLeRight rightLeLeft
        cases lowerSetsEqual
        rfl

/-- Wrap a Mathlib real as the LRA lower Dedekind cut of rationals below it.

Logical form:

```lean
{q : Rat | (q : Real) < value}
```
-/
def LraRealOfReal (value : Real) : LraReal where
  lower := {rational | (rational : Real) < value}
  nonempty := by
    obtain ⟨rational, rationalLtValue⟩ := exists_rat_lt value
    exact ⟨rational, rationalLtValue⟩
  not_all := by
    obtain ⟨rational, valueLtRational⟩ := exists_rat_gt value
    exact ⟨rational, not_lt_of_ge (le_of_lt valueLtRational)⟩
  downward := by
    intro upper upperLtValue lower lowerLtUpper
    have lowerCastLtUpperCast : (lower : Real) < (upper : Real) := by
      exact_mod_cast lowerLtUpper
    exact lowerCastLtUpperCast.trans upperLtValue
  open_above := by
    intro rational rationalLtValue
    change (rational : Real) < value at rationalLtValue
    obtain ⟨greater, rationalLtGreater, greaterLtValue⟩ :=
      exists_rat_btwn rationalLtValue
    exact ⟨greater, greaterLtValue, by exact_mod_cast rationalLtGreater⟩

/-- Wrapping Mathlib reals as LRA lower cuts preserves their order.

Logical form:

```lean
left ≤ right → LraRealOfReal left ≤ LraRealOfReal right
```
-/
theorem LraRealOfRealMonotone {left right : Real} (leftLeRight : left ≤ right) :
    LraRealOfReal left ≤ LraRealOfReal right := by
  intro rational rationalLtLeft
  exact rationalLtLeft.trans_le leftLeRight

/-- The image in `LraReal` of the real numbers whose squares are strictly less
than two.

Logical form:

```lean
LraRealOfReal '' {x : Real | x ^ 2 - 2 < 0}
```
-/
def WrappedSquareBelowTwo : Set LraReal :=
  LraRealOfReal '' SquareBelowTwo

/-! ### Explicit LRA poset over the LRA real wrapper -/

/-- Through the explicit LRA interface, the lower cut representing `√2` is
an upper bound of the wrapped square-below-two set. -/
example :
    UpperBound
      (PosetFromPartialOrder LraReal)
      WrappedSquareBelowTwo
      (LraRealOfReal (Real.sqrt 2)) := by
  intro element elementInSubset
  obtain ⟨real, realInSubset, rfl⟩ := elementInSubset
  apply LraRealOfRealMonotone
  exact Real.le_sqrt_of_sq_le (le_of_lt (sub_neg.mp realInSubset))

/-! ### Inferred partial order over the LRA real wrapper -/

/-- Through the inferred interface, the local partial-order instance supplies
cut inclusion for `LraReal`, so the explicit poset argument disappears. -/
example :
    FromPartialOrder.UpperBound
      WrappedSquareBelowTwo
      (LraRealOfReal (Real.sqrt 2)) := by
  intro element elementInSubset
  obtain ⟨real, realInSubset, rfl⟩ := elementInSubset
  apply LraRealOfRealMonotone
  exact Real.le_sqrt_of_sq_le (le_of_lt (sub_neg.mp realInSubset))

end LRA.Pilot.OrderBounds.Examples
